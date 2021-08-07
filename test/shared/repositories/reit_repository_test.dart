import 'package:fii_app/shared/datasources/funds_explorer_datasource.dart';
import 'package:fii_app/shared/models/reit.dart';
import 'package:fii_app/shared/repositories/reit_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'reit_repository_test.mocks.dart';

@GenerateMocks([FundsExplorerDatasource])
void main() {
  final mockDatasource = MockFundsExplorerDatasource();

  setUpAll(() {
    GetIt.I.registerSingleton<FundsExplorerDatasource>(mockDatasource);

    when(mockDatasource.getAll()).thenAnswer(
      (_) async => [
        Reit(
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
        Reit(
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

  group('getAll', () {
    test('should return a Reit List with correct length', () async {
      final repository = ReitRepository();
      final reits = await repository.getAll();

      expect(reits, isA<List<Reit>>());
      expect(reits.length, 2);
    });

    test('returned List must match datasource data', () async {
      final repository = ReitRepository();
      final reits = await repository.getAll();

      expect(reits.first.symbol, 'Mock Symbol');
      expect(reits.first.name, 'Mock Name');
      expect(reits.first.sector, 'Mock Sector');
      expect(reits.first.currentPrice, 1);
      expect(reits.first.dailyLiquidity, 1);
      expect(reits.first.currentDividend, 1);
      expect(reits.first.currentDividendYield, 1);
      expect(reits.first.netWorth, 1);
      expect(reits.first.vpa, 1);
      expect(reits.first.pvpa, 1);
      expect(reits.first.vacancy, 1);
      expect(reits.first.assetsAmount, 1);
    });
  });
}
