import 'package:fii_app/core/errors/http_client_exceptions.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

import '../../errors/datasource_exceptions.dart';
import '../../network/http_client.dart';
import '../models/reit_model.dart';
import 'reit_data_source.dart';

class FundsExplorerReitDataSource implements ReitDataSource {
  final HttpClient httpClient;
  final url = 'https://www.fundsexplorer.com.br/rankingggg';

  FundsExplorerReitDataSource({required this.httpClient});

  @override
  Future<List<ReitModel>> getAll() async {
    try {
      final response = await httpClient.get(url);

      if (response.statusCode == 200) {
        final sourceHtml = response.data as String;
        final Document document = parse(sourceHtml);

        final List<ReitModel> list = _mapDocumentToReitList(document);
        return list;
      } else {
        throw ServerException(message: "Status code is not 200 for {$url}");
      }
    } on HttpClientException {
      throw ServerException();
    }
  }

  List<ReitModel> _mapDocumentToReitList(Document document) {
    final table = document.getElementById('table-ranking');

    if (table == null) {
      throw NoTableRankingException();
    }

    final rows = table.getElementsByTagName('tbody tr');

    if (rows.isEmpty) {
      throw NoTbodyTrException();
    }

    final List<ReitModel> reits = [];

    for (final row in rows) {
      final reitColumns = row.getElementsByTagName('td');

      final ReitModel newReit = ReitModel(
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
