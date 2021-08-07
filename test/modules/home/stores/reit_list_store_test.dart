import 'package:fii_app/modules/home/models/reit_list_sort_option.dart';
import 'package:fii_app/modules/home/stores/reit_list_store.dart';
import 'package:fii_app/shared/models/reit.dart';
import 'package:fii_app/shared/repositories/reit_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'reit_list_store_test.mocks.dart';

@GenerateMocks([ReitRepository])
void main() {
  late MockReitRepository mockReitRepository;
  late ReitListStore store;

  setUpAll(() {
    mockReitRepository = MockReitRepository();
    GetIt.I.registerSingleton<ReitRepository>(mockReitRepository);

    when(mockReitRepository.getAll()).thenAnswer(
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

  setUp(() {
    store = ReitListStore();
  });

  test("starts with loading and errors being false", () {
    expect(store.isLoading, false);
    expect(store.hasError, false);
  });

  group('after fetching all reits', () {
    test("reits list should have proper length and type", () async {
      await store.fetchAll();

      expect(store.reits, isA<List<Reit>>());
      expect(store.reits.length, 2);
    });

    test("loading should be false", () async {
      await store.fetchAll();

      expect(store.isLoading, false);
    });
  });

  group('after changing reit list sort option', () {
    test("current sort option should be changed", () async {
      final defaultOption = store.currentSortOption;
      expect(store.currentSortOption, defaultOption);

      const newSortOption = ReitListSortOption(
        label: "Quantidade de Ativos",
        type: ReitListSortOptionType.assetsAmount,
      );
      store.currentSortOption = newSortOption;
      expect(store.currentSortOption, newSortOption);
    });
    test("sorted reits should be sorted", () async {
      await store.fetchAll();

      store.currentSortOption = const ReitListSortOption(
        label: "Quantidade de Ativos",
        type: ReitListSortOptionType.assetsAmount,
      );

      expect(store.sortedReits.first.assetsAmount, 2);
      expect(store.sortedReits.last.assetsAmount, 1);

      store.currentSortOption = const ReitListSortOption(
        label: "Dividend Yield Atual",
        type: ReitListSortOptionType.currentDividendYield,
      );

      expect(store.sortedReits.first.currentDividendYield, 2);
      expect(store.sortedReits.last.currentDividendYield, 1);
    });
  });
}
