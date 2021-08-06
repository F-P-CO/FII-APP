import 'package:dio/dio.dart';
import 'package:fii_app/shared/datasources/funds_explorer_datasource.dart';
import 'package:fii_app/shared/exceptions/datasources/no_table_ranking_exception.dart';
import 'package:fii_app/shared/exceptions/datasources/no_tbody_tr_exception.dart';
import 'package:fii_app/shared/interfaces/http_service_interface.dart';
import 'package:fii_app/shared/models/reit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class MockHttpService implements HttpService {
  @override
  final Dio client;

  MockHttpService(this.client);
}

void main() {
  final dio = Dio(BaseOptions());
  final dioAdapter = DioAdapter(dio: dio);

  setUpAll(() {
    GetIt.I.registerSingleton<HttpService>(MockHttpService(dio));
  });

  group('funds explorer datasource', () {
    group("getAll", () {
      test('parses each table cell to its corresponding Reit attribute',
          () async {
        final datasource = FundsExplorerDatasource();

        dioAdapter.onGet(
          datasource.url,
          (server) => server.reply(200,
              '<table id="table-ranking" class="table table-hover">    <thead>        <tr>            <th>Código<br>do fundo</th>            <th>Setor</th>            <th>Preço Atual<img alt="Mais informações" data-toggle="tooltip"                    data-title="Preço de fechamento da cota do Dia Anterior."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>Liquidez Diária<img alt="Mais informações" data-toggle="tooltip"                    data-title="Quantidade de negócios realizados no Dia anterior."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>Dividendo<img alt="Mais informações" data-toggle="tooltip" data-title="Último dividendo anunciado."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>Dividend<br>Yield<img alt="Mais informações" data-toggle="tooltip"                    data-title="Retorno calculado sobre a divisão do último dividendo pela cota de fechamento do mês."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>DY (3M)<br>Acumulado<img alt="Mais informações" data-toggle="tooltip"                    data-title="Soma do Dividend Yield nos últimos 3 meses."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>DY (6M)<br>Acumulado<img alt="Mais informações" data-toggle="tooltip"                    data-title="Soma do Dividend Yield nos últimos 6 meses."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>DY (12M)<br>Acumulado<img alt="Mais informações" data-toggle="tooltip"                    data-title="Soma do Dividend Yield nos últimos 12 meses."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>DY (3M)<br>Média<img alt="Mais informações" data-toggle="tooltip"                    data-title="Média do Dividend Yield nos últimos 3 meses."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>DY (6M)<br>Média<img alt="Mais informações" data-toggle="tooltip"                    data-title="Média do Dividend Yield nos últimos 6 meses."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>DY (12M)<br>Média<img alt="Mais informações" data-toggle="tooltip"                    data-title="Média do Dividend Yield nos últimos 12 meses."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>DY Ano<img alt="Mais informações" data-toggle="tooltip"                    data-title="Soma do Dividend Yield em relação aos dividendos anunciados no ano corrente."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>Variação Preço<img alt="Mais informações" data-toggle="tooltip"                    data-title="Variação, em percentual, do valor do preço de fechamento nos últimos dois meses."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>Rentab.<br>Período<img alt="Mais informações" data-toggle="tooltip"                    data-title="Retorno calculado considerando o Dividend Yield e a Variação da Cota no último mês."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>Rentab.<br>Acumulada<img alt="Mais informações" data-toggle="tooltip"                    data-title="Retorno calculado considerando o Dividend Yield e a Variação da Cota desde o início do ano até o último mês."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>Patrimônio<br>Líq.<img alt="Mais informações" data-toggle="tooltip"                    data-title="Último valor de Patrimônio Líquido anunciado pelo Fundo."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>VPA<img alt="Mais informações" data-toggle="tooltip"                    data-title="Resultado da divisão do Patrimônio Líquido sobre o total de cotas do fundo."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>P/VPA<img alt="Mais informações" data-toggle="tooltip"                    data-title="Indicador calculado pela divisão do Preço da Cota sobre o Valor Patrimonial do fundo."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>DY<br>Patrimonial<img alt="Mais informações" data-toggle="tooltip"                    data-title="Retorno calculado sobre a divisão do último dividendo pelo valor patrimonial do mês."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>Variação<br>Patrimonial<img alt="Mais informações" data-toggle="tooltip"                    data-title="Variação, em percentual, do valor patrimonial do fundo nos últimos dois meses"                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>Rentab. Patr.<br>no Período<img alt="Mais informações" data-toggle="tooltip"                    data-title="Retorno calculado considerando o Dividend Yield Patrimonial e a Variação da Cota Patrimonial no último mês."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>Rentab. Patr.<br>Acumulada<img alt="Mais informações" data-toggle="tooltip"                    data-title="Retorno calculado considerando o Dividend Yield Patrimonial e a Variação Patrimonial desde o início do ano até o último mês."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>Vacância<br>Física<img alt="Mais informações" data-toggle="tooltip"                    data-title="Indicador calculado considerando a divisão da área vaga do fundo pela área total do fundo."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>Vacância<br>Financeira<img alt="Mais informações" data-toggle="tooltip"                    data-title="Indicador calculado considerando a divisão da área que não está gerando receita pela área total do fundo."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>            <th>Quantidade<br>Ativos<img alt="Mais informações" data-toggle="tooltip"                    data-title="Quantidade de imóveis ou participações em imóveis do fundo."                    src="/assets/icons/info-f75f205def6f00c6de7f471dfb953f49c56688839ec91a31271252def5bf299c.svg" />            </th>        </tr>    </thead>    <tbody>        <tr>            <td data-index="FIVN11"><a href="/funds/fivn11">FIVN11</a></td>            <td>Shoppings</td>            <td data-order="2.93">R\$ 2,93</td>            <td data-order="12268.0">12268.0</td>            <td data-valor="0.0" data-order="0.0">R\$ 0,00</td>            <td data-valor="0.0" data-order="0.0">0,00%</td>            <td data-valor="0.0" data-order="0.0">0,00%</td>            <td data-valor="0.0" data-order="0.0">0,00%</td>            <td data-valor="0.0" data-order="0.0">0,00%</td>            <td data-order="0.0">0,00%</td>            <td data-order="0.0">0,00%</td>            <td data-order="0.0">0,00%</td>            <td data-order="-9999999999">N/A</td>            <td data-order="0.0">0,00%</td>            <td data-order="0.0">0,00%</td>            <td data-order="0.0">0,00%</td>            <td data-order="64722802.83">R\$ 64.722.802,83</td>            <td data-order="6.876166">R\$ 6,88</td>            <td data-order="0.42610955000213785">0,43</td>            <td data-order="-9999999999">N/A</td>            <td data-order="-9999999999">N/A</td>            <td data-order="-9999999999">N/A</td>            <td data-order="-9999999999">N/A</td>            <td data-order="56.0">56,00%</td>            <td data-order="-9999999999">N/A</td>            <td data-order="1">1</td>        </tr>    </tbody></table>'),
        );

        final reits = await datasource.getAll();
        expect(reits, isA<List<Reit>>());
        expect(reits.length, 1);

        expect(reits.first.symbol, 'FIVN11');
        expect(reits.first.name, 'FIVN11');
        expect(reits.first.sector, 'Shoppings');
        expect(reits.first.currentPrice, 2.93);
        expect(reits.first.dailyLiquidity, 12268.0);
        expect(reits.first.currentDividend, 0.0);
        expect(reits.first.currentDividendYield, 0.0);
        expect(reits.first.netWorth, 64722802.83);
        expect(reits.first.vpa, 6.876166);
        expect(reits.first.pvpa, 0.42610955000213785);
        expect(reits.first.vacancy, 56);
        expect(reits.first.assetsAmount, 1);
      });

      test('throws if no table-ranking is found', () async {
        final datasource = FundsExplorerDatasource();

        dioAdapter.onGet(
          datasource.url,
          (server) =>
              server.reply(200, '<table id="not-a-table-ranking"></table>'),
        );

        expect(() async => datasource.getAll(),
            throwsA(isA<NoTableRankingException>()));
      });

      test('throws if no tbody tr is found', () async {
        final datasource = FundsExplorerDatasource();

        dioAdapter.onGet(
          datasource.url,
          (server) => server.reply(200, '<table id="table-ranking"></table>'),
        );

        expect(() async => datasource.getAll(),
            throwsA(isA<NoTbodyTrException>()));
      });
    });
  });
}
