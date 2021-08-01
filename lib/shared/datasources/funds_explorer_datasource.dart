import 'package:dio/dio.dart';
import 'package:fii_app/shared/models/reit.dart';
import 'package:get_it/get_it.dart';
import 'package:html/parser.dart' show parse;

abstract class IFundsExplorerDatasource {
  Future<List<dynamic>> getAll();
}

class FundsExplorerDatasource implements IFundsExplorerDatasource {
  final url = 'https://www.fundsexplorer.com.br/ranking';
  final dio = GetIt.I.get<Dio>();

  String? removeCharacters(String? str, List<String> strToRemove) {
    String finalStr = (str ?? '').trim();
    for (final subStr in strToRemove) {
      finalStr = finalStr.replaceAll(subStr, '');
    }
    if (finalStr.isEmpty) return '-9999999999';
    return finalStr;
  }

  double? formatDouble(String? str) => (str ?? '').toLowerCase() == 'n/a'
      ? null
      : double.parse(removeCharacters(str, ['%', 'R\$']) ?? '');

  @override
  Future<List<Reit>> getAll() async {
    try {
      final response = await dio.get(url);
      final sourceHtml = response.data;
      final document = parse(sourceHtml);
      final table = document.getElementById('table-ranking');

      final tbody = table?.getElementsByTagName('tbody').single;
      final rows = tbody?.getElementsByTagName("tr");
      if (table != null && tbody != null && rows != null) {
        final List<Reit> reits = [];
        for (final row in rows) {
          final reitColumns = row.getElementsByTagName('td');
          final Reit newReit = Reit(
            symbol: reitColumns[0].text,
            name: reitColumns[0].text,
            sector: reitColumns[1].text,
            currentPrice: formatDouble(reitColumns[2].attributes['data-order']),
            dailyLiquidity:
                formatDouble(reitColumns[3].attributes['data-order']),
            currentDividend:
                formatDouble(reitColumns[4].attributes['data-order']),
            currentDividendYield:
                formatDouble(reitColumns[5].attributes['data-order']),
            netWorth: formatDouble(reitColumns[16].attributes['data-order']),
            vpa: formatDouble(reitColumns[17].attributes['data-order']),
            pvpa: formatDouble(reitColumns[18].attributes['data-order']),
            vacancy: formatDouble(reitColumns[23].attributes['data-order']),
            assetsAmount: int.parse(reitColumns[25].text),
          );
          reits.add(newReit);
        }
        return reits;
      }
      return [];
    } catch (exception) {
      rethrow;
    }
  }
}
