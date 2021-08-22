import 'package:dartz/dartz.dart';
import 'package:fii_app/core/data/datasources/reit_data_source.dart';
import 'package:fii_app/core/data/models/reit_model.dart';
import 'package:fii_app/core/data/repositories/default_reit_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'default_reit_repository_test.mocks.dart';

@GenerateMocks([ReitDataSource])
void main() {
  late MockReitDataSource mockDataSource;
  late DefaultReitRepository repository;

  group('getAll', () {
    setUpAll(() {
      mockDataSource = MockReitDataSource();

      when(mockDataSource.getAll()).thenAnswer(
        (_) async => [
          ReitModel(
            symbol: 'Mock Symbol',
            name: 'Mock Name',
            sector: 'Mock Sector',
            currentPrice: 1,
            dailyLiquidity: 1,
            currentDividend: 1,
            currentDividendYield: 1,
            netWorth: 1,
            vpa: 1,
            pvpa: 1,
            vacancy: 1,
            assetsAmount: 1,
          ),
          ReitModel(
            symbol: 'Mock Symbol 2',
            name: 'Mock Name 2',
            sector: 'Mock Sector 2',
            currentPrice: 2,
            dailyLiquidity: 2,
            currentDividend: 2,
            currentDividendYield: 2,
            netWorth: 2,
            vpa: 2,
            pvpa: 2,
            vacancy: 2,
            assetsAmount: 2,
          )
        ],
      );
    });

    setUp(() {
      repository = DefaultReitRepository(datasource: mockDataSource);
    });

    test('should return a [Reit] list with proper type and length', () async {
      final reitsOrFailure = await repository.getAll();
      final list = reitsOrFailure.getOrElse(() => throw Exception);

      expect(reitsOrFailure, isA<Right>());
      expect(list.length, 2);
    });

    test('should return a [Reit] list with proper content on the elements',
        () async {
      final reitsOrFailure = await repository.getAll();
      final list = reitsOrFailure.getOrElse(() => throw Exception);

      expect(list.first.symbol, 'Mock Symbol');
      expect(list.first.name, 'Mock Name');
      expect(list.first.sector, 'Mock Sector');
      expect(list.first.currentPrice, 1);
      expect(list.first.dailyLiquidity, 1);
      expect(list.first.currentDividend, 1);
      expect(list.first.currentDividendYield, 1);
      expect(list.first.netWorth, 1);
      expect(list.first.vpa, 1);
      expect(list.first.pvpa, 1);
      expect(list.first.vacancy, 1);
      expect(list.first.assetsAmount, 1);
    });
  });
}
