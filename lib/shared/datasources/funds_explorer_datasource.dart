import 'package:dio/dio.dart';
import 'package:fii_app/shared/models/reit.dart';
import 'package:get_it/get_it.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;

abstract class IFundsExplorerDatasource {
  Future<List<dynamic>> getAll();
}

class FundsExplorerDatasource implements IFundsExplorerDatasource {
  final dio = GetIt.I.get<Dio>();
  final url = 'https://www.fundsexplorer.com.br/ranking';

  List<Reit>? _allReits;

  @override
  Future<List<Reit>> getAll() async {
    if (_allReits == null) {
      final response = await dio.get(
        url,
        options: Options(responseType: ResponseType.plain),
      );

      final sourceHtml = response.data as String;
      final Document document = parse(sourceHtml);

      _allReits = _parseReitsListPage(document);
    }

    return _allReits!;
  }

  List<Reit> _parseReitsListPage(Document document) {
    final table = document.getElementById('table-ranking');

    if (table == null) {
      throw Exception(
          "Element 'table-ranking' not found on FundsExplorer page.");
    }

    final rows = table.getElementsByTagName('tbody tr');

    if (rows.isEmpty) {
      throw Exception(
          "No elements with tag name 'tbody tr' found inside 'table-ranking' on FundsExplorer page.");
    }

    final List<Reit> reits = [];

    for (final row in rows) {
      final reitColumns = row.getElementsByTagName('td');

      final Reit newReit = Reit(
        symbol: reitColumns[0].text,
        name: reitColumns[0].text,
        sector: reitColumns[1].text,
        currentPrice: _formatDouble(reitColumns[2].attributes['data-order'] ??
            reitColumns[2].attributes['data-valor']),
        dailyLiquidity: _formatDouble(reitColumns[3].attributes['data-order'] ??
            reitColumns[3].attributes['data-valor']),
        currentDividend: _formatDouble(
            reitColumns[4].attributes['data-order'] ??
                reitColumns[4].attributes['data-valor']),
        currentDividendYield: _formatDouble(
            reitColumns[5].attributes['data-order'] ??
                reitColumns[5].attributes['data-valor']),
        netWorth: _formatDouble(reitColumns[16].attributes['data-order'] ??
            reitColumns[16].attributes['data-valor']),
        vpa: _formatDouble(reitColumns[17].attributes['data-order'] ??
            reitColumns[17].attributes['data-valor']),
        pvpa: _formatDouble(reitColumns[18].attributes['data-order'] ??
            reitColumns[18].attributes['data-valor']),
        vacancy: _formatDouble(reitColumns[23].attributes['data-order'] ??
            reitColumns[23].attributes['data-valor']),
        assetsAmount: int.parse(reitColumns[25].text),
      );

      reits.add(newReit);
    }

    return reits;
  }

  double? _formatDouble(String? str) =>
      str == '-9999999999' ? null : double.parse(str ?? '');
}
