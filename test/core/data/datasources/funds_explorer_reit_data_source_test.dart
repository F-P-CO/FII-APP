import 'package:dio/dio.dart';
import 'package:fii_app/core/data/datasources/funds_explorer_reit_data_source.dart';
import 'package:fii_app/core/data/models/reit_model.dart';
import 'package:fii_app/core/errors/datasource_exceptions.dart';
import 'package:fii_app/core/errors/http_client_exceptions.dart';
import 'package:fii_app/core/network/http_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import 'funds_explorer_reit_data_source_test.mocks.dart';

@GenerateMocks([HttpClient])
void main() {
  group('getAll', () {
    late MockHttpClient mockHttpClient;
    late FundsExplorerReitDataSource datasource;

    late Dio dio;
    late DioAdapter dioAdapter;

    setUpAll(() {
      dio = Dio(BaseOptions());
      dioAdapter = DioAdapter(dio: dio);

      mockHttpClient = MockHttpClient();
      when(mockHttpClient.get(any)).thenAnswer(
        (invocation) async =>
            dio.get(invocation.positionalArguments.first as String),
      );
    });

    setUp(() {
      datasource = FundsExplorerReitDataSource(httpClient: mockHttpClient);
    });

    test(
        'should parse html table to [Reit] list when page is gotten successfully',
        () async {
      dioAdapter.onGet(
        datasource.url,
        (server) => server.reply(200, fixture('funds_explorer_table.html')),
      );

      final reits = await datasource.getAll();
      expect(reits, isA<List<ReitModel>>());
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

    test(
        'should throw [NoTableRankingException] when "table-ranking" element is not found',
        () async {
      dioAdapter.onGet(
        datasource.url,
        (server) =>
            server.reply(200, fixture('funds_explorer_invalid_table.html')),
      );

      expect(() async => datasource.getAll(),
          throwsA(isA<NoTableRankingException>()));
    });

    test(
        'should throw [NoTbodyTrException] when "tbody tr" element is not found',
        () async {
      dioAdapter.onGet(
        datasource.url,
        (server) =>
            server.reply(200, fixture('funds_explorer_invalid_tbody.html')),
      );

      expect(
          () async => datasource.getAll(), throwsA(isA<NoTbodyTrException>()));
    });

    test('should throw [ServerException] when http client throws exception',
        () async {
      when(mockHttpClient.get(any)).thenThrow(HttpClientException());

      expect(() async => datasource.getAll(), throwsA(isA<ServerException>()));
    });
  });
}
