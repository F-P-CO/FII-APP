import 'package:either_dart/either.dart';
import 'package:fii_app/core/domain/entities/reit.dart';
import 'package:fii_app/core/errors/failures.dart';
import 'package:fii_app/modules/reit_list/domain/usecases/get_all_reits.dart';
import 'package:fii_app/modules/reit_list/presentation/stores/reit_list_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'reit_list_store_test.mocks.dart';

@GenerateMocks([GetAllReits])
void main() {
  late GetAllReits mockGetAllReits;
  late ReitListStore store;

  setUpAll(() {
    mockGetAllReits = MockGetAllReits();
  });

  setUp(() {
    store = ReitListStore(getAllReits: mockGetAllReits);
  });

  void _mockLoadReitList() {
    when(mockGetAllReits()).thenAnswer(
      (_) async => Right(<Reit>[
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
        ),
        Reit(
          symbol: 'Mock Symbol 3',
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
      ]),
    );
  }

  test("should start with [loading] being false", () {
    expect(store.isLoading, false);
  });

  group('loadReitList', () {
    test(
        "should set [reits] to reits list with proper length and type when called",
        () async {
      _mockLoadReitList();
      await store.loadReitList();

      expect(store.reits, isA<List<Reit>>());
      expect(store.reits.length, 3);
    });

    test("should set [loading] to false when finishes execution", () async {
      await store.loadReitList();

      expect(store.isLoading, false);
    });

    test("should set [errorMessage] to a string when usecase fails", () async {
      when(mockGetAllReits())
          .thenAnswer((_) async => Left(ServerFailure(exception: Exception())));

      await store.loadReitList();

      expect(store.errorMessage, isA<String>());
      expect(store.errorMessage, isNotEmpty);
    });
  });

  group('sortedReits', () {
    test("should return a [Reit] list sorted by [currentSortOption]", () async {
      _mockLoadReitList();
      await store.loadReitList();

      store.currentSortOptionType = ReitListSortOptionType.assetsAmount;
      expect(store.sortedReits.first.assetsAmount, 3);
      expect(store.sortedReits.last.assetsAmount, 1);

      store.currentSortOptionType = ReitListSortOptionType.currentDividendYield;
      expect(store.sortedReits.first.currentDividendYield, 3);
      expect(store.sortedReits.last.currentDividendYield, 1);
    });

    test("should return a [Reit] list limited by [limit]", () async {
      _mockLoadReitList();
      await store.loadReitList();

      store.limit = 1;
      expect(store.sortedReits.length, store.limit);

      store.limit = 2;
      expect(store.sortedReits.length, store.limit);
    });
  });

  group('toggleSortBottomSheetOpened', () {
    test("should start with [isSortBottomSheetOpened] being false", () {
      expect(store.isSortBottomSheetOpened, false);
    });

    test(
        "should change [isSortBottomSheetOpened] to its inverse boolean value when called",
        () {
      store.toggleSortBottomSheetOpened();
      expect(store.isSortBottomSheetOpened, true);

      store.toggleSortBottomSheetOpened();
      expect(store.isSortBottomSheetOpened, false);
    });
  });
}
