import 'package:fii_app/core/domain/entities/reit.dart';
import 'package:fii_app/core/domain/entities/reit_column.dart';
import 'package:fii_app/core/presentation/stores/comparator_store.dart';
import 'package:fii_app/core/presentation/stores/reit_list_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'comparator_store_test.mocks.dart';

@GenerateMocks([ReitListStore])
void main() {
  late ReitListStore mockReitListStore;
  late ComparatorStore store;

  final mockReitList = [
    Reit(
      symbol: 'MOCK1',
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
      symbol: 'MOCK2',
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
    ),
    Reit(
      symbol: 'MOCK3',
      name: 'Mock Name 3',
      sector: 'Mock Sector 3',
      currentPrice: 3,
      dailyLiquidity: 3,
      currentDividend: 3,
      currentDividendYield: 3,
      netWorth: 3,
      vpa: 3,
      pvpa: 3,
      vacancy: 3,
      assetsAmount: 3,
    )
  ];

  final mockReitListSortedByAssetsAmount = [
    Reit(
      symbol: 'MOCK3',
      name: 'Mock Name 3',
      sector: 'Mock Sector 3',
      currentPrice: 3,
      dailyLiquidity: 3,
      currentDividend: 3,
      currentDividendYield: 3,
      netWorth: 3,
      vpa: 3,
      pvpa: 3,
      vacancy: 3,
      assetsAmount: 3,
    ),
    Reit(
      symbol: 'MOCK2',
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
    ),
    Reit(
      symbol: 'MOCK1',
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
  ];

  setUp(() {
    mockReitListStore = MockReitListStore();
    store = ComparatorStore(reitListStore: mockReitListStore);
  });

  group('currentReits', () {
    test('should return entire reit list by default', () {
      when(mockReitListStore.reits).thenReturn(mockReitList);

      expect(store.currentReits, equals(mockReitList));
    });

    test('should return filtered reit list when filtering by search text', () {
      when(mockReitListStore.reits).thenReturn(mockReitList);

      store.searchText = 'MOCK1';

      final mockedReit =
          mockReitList.singleWhere((element) => element.symbol == 'MOCK1');
      expect(store.currentReits.length, equals(1));
      expect(store.currentReits.single, equals(mockedReit));
    });

    group('dividend yield filter', () {
      const filter = ReitFilter.dividendYield;

      test(
        'should return unfiltered reit list when filter is disabled',
        () {
          when(mockReitListStore.reits).thenReturn(mockReitList);

          final list = store.currentReits;
          expect(list.first.currentDividendYield, equals(1));
          expect(list.last.currentDividendYield, equals(3));
        },
      );

      test(
        'should return filtered reit list when min and max are provided',
        () {
          when(mockReitListStore.reits).thenReturn(mockReitList);

          const double min = 2;
          const double max = 3;

          store.dividendYieldRange = [min, max];
          store.enabledFilters.add(filter);

          final list = store.currentReits;
          expect(list.first.currentDividendYield, equals(min));
          expect(list.last.currentDividendYield, equals(max));
        },
      );

      test(
        'should return filtered reit list when only min is provided',
        () {
          when(mockReitListStore.reits).thenReturn(mockReitList);

          const double min = 2;
          const double? max = null;

          store.dividendYieldRange = [min, max];
          store.enabledFilters.add(filter);

          final list = store.currentReits;
          expect(list.first.currentDividendYield, equals(min));
          expect(list.last.currentDividendYield, equals(3));
        },
      );

      test(
        'should return filtered reit list when only max is provided',
        () {
          when(mockReitListStore.reits).thenReturn(mockReitList);

          const double? min = null;
          const double max = 2;

          store.dividendYieldRange = [min, max];
          store.enabledFilters.add(filter);

          final list = store.currentReits;
          expect(list.first.currentDividendYield, equals(1));
          expect(list.last.currentDividendYield, equals(2));
        },
      );
    });

    group('assets amount filter', () {
      const filter = ReitFilter.assetsAmount;

      test(
        'should return unfiltered reit list when filter is disabled',
        () {
          when(mockReitListStore.reits).thenReturn(mockReitList);

          final list = store.currentReits;
          expect(list.first.assetsAmount, equals(1));
          expect(list.last.assetsAmount, equals(3));
        },
      );

      test(
        'should return filtered reit list when min and max are provided',
        () {
          when(mockReitListStore.reits).thenReturn(mockReitList);
          when(mockReitListStore.reitsSortedByAssetsAmount)
              .thenReturn(mockReitListSortedByAssetsAmount);

          const double min = 2;
          const double max = 3;

          store.assetsAmountRange = [min, max];
          store.enabledFilters.add(filter);

          final list = store.currentReits;
          expect(list.first.assetsAmount, equals(min));
          expect(list.last.assetsAmount, equals(max));
        },
      );
    });
  });

  group('toggleFilter', () {
    test('should enable a filter when the filter is disabled', () {
      const mockFilter = ReitFilter.dividendYield;

      store.toggleFilter(mockFilter);

      expect(store.enabledFilters, contains(mockFilter));
    });

    test('should disable a filter when the filter is enabled', () {
      const mockFilter = ReitFilter.dividendYield;
      store.enabledFilters.add(mockFilter);

      store.toggleFilter(mockFilter);

      expect(store.enabledFilters, isNot(contains(mockFilter)));
    });
  });

  group('minAssetsAmount', () {
    test('should return minimum assets amount from reits list', () {
      when(mockReitListStore.reitsSortedByAssetsAmount)
          .thenReturn(mockReitList.reversed.toList());

      final min = store.minAssetsAmount;

      expect(min, equals(1));
    });
  });

  group('maxAssetsAmount', () {
    test('should return maximum assets amount from reits list', () {
      when(mockReitListStore.reitsSortedByAssetsAmount)
          .thenReturn(mockReitList.reversed.toList());

      final max = store.maxAssetsAmount;

      expect(max, equals(3));
    });
  });

  group('enabledColumnsInOrder', () {
    test('should return all available columns by default', () {
      final columns = store.enabledColumnsInOrder;

      final totalColumns = store.tableColumns.length;
      expect(columns.length, equals(totalColumns));
    });

    test('should return only enabled columns when some columns are disabled',
        () {
      store.toggleColumn(const ReitColumn(type: ReitColumnType.currentPrice));
      store
          .toggleColumn(const ReitColumn(type: ReitColumnType.currentDividend));
      store.toggleColumn(const ReitColumn(type: ReitColumnType.netWorth));

      final columns = store.enabledColumnsInOrder;

      final totalColumns = store.tableColumns.length - 3;
      expect(columns.length, equals(totalColumns));
      expect(
        columns,
        orderedEquals([
          const ReitColumn(type: ReitColumnType.sector),
          const ReitColumn(type: ReitColumnType.dailyLiquidity),
          const ReitColumn(type: ReitColumnType.currentDividendYield),
          const ReitColumn(type: ReitColumnType.vpa),
          const ReitColumn(type: ReitColumnType.pvpa),
          const ReitColumn(type: ReitColumnType.vacancy),
          const ReitColumn(type: ReitColumnType.assetsAmount),
        ]),
      );
    });
  });

  group('toggleColumn', () {
    test('should enable a column when the column is disabled', () {
      const mockColumn = ReitColumn(type: ReitColumnType.currentDividendYield);
      store.enabledColumns.remove(mockColumn.type);

      store.toggleColumn(mockColumn);

      expect(store.enabledColumns, contains(mockColumn.type));
    });

    test('should disable a column when the column is enabled', () {
      const mockColumn = ReitColumn(type: ReitColumnType.currentDividendYield);

      store.toggleColumn(mockColumn);

      expect(store.enabledColumns, isNot(contains(mockColumn)));
    });
  });
}
