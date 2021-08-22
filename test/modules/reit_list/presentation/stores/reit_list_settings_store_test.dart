import 'package:dartz/dartz.dart';
import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart';
import 'package:fii_app/modules/reit_list/domain/usecases/get_enabled_lists.dart';
import 'package:fii_app/modules/reit_list/domain/usecases/save_enabled_lists.dart';
import 'package:fii_app/modules/reit_list/presentation/stores/reit_list_settings_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'reit_list_settings_store_test.mocks.dart';

@GenerateMocks([GetEnabledLists, SaveEnabledLists])
void main() {
  late GetEnabledLists mockGetEnabledLists;
  late SaveEnabledLists mockSaveEnabledLists;
  late ReitListSettingsStore store;

  setUp(() {
    mockGetEnabledLists = MockGetEnabledLists();
    mockSaveEnabledLists = MockSaveEnabledLists();

    store = ReitListSettingsStore(
      getEnabledLists: mockGetEnabledLists,
      saveEnabledLists: mockSaveEnabledLists,
    );
  });

  group('init', () {
    test('should set [enabledLists] to enabled lists fetched from usecase',
        () async {
      final mockList = mobx.ObservableSet.of([
        ReitListSortOptionType.assetsAmount,
        ReitListSortOptionType.netWorth
      ]);
      when(mockGetEnabledLists()).thenAnswer((_) async => mockList.toList());

      await store.init();

      expect(store.enabledLists, equals(mockList));
      verify(mockGetEnabledLists());
    });
  });

  group('isEnabled', () {
    late ReitListSortOptionType option;

    setUp(() {
      option = ReitListSortOptionType.assetsAmount;
    });
    test('should return true when list is enabled', () {
      when(mockSaveEnabledLists([option]))
          .thenAnswer((_) async => const Right(true));
      store.enableList(option);

      final isEnabled = store.isEnabled(option);

      expect(isEnabled, isTrue);
    });

    test('should return true when list is disabled', () {
      final isEnabled = store.isEnabled(option);

      expect(isEnabled, isFalse);
    });
  });

  group('toggleList', () {
    late ReitListSortOptionType option;

    setUp(() {
      option = ReitListSortOptionType.assetsAmount;
    });

    test('should enable list when list is disabled', () {
      when(mockSaveEnabledLists([option]))
          .thenAnswer((_) async => const Right(true));

      store.toggleList(option);

      expect(store.enabledLists, contains(option));
      expect(store.enabledLists, hasLength(1));
    });

    test('should disable list when list is enabled', () async {
      const mockList = [
        ReitListSortOptionType.assetsAmount,
        ReitListSortOptionType.netWorth
      ];
      when(mockGetEnabledLists()).thenAnswer((_) async => mockList);
      await store.init();

      when(mockSaveEnabledLists([mockList.last]))
          .thenAnswer((_) async => const Right(true));

      store.toggleList(option);

      expect(store.enabledLists.contains(option), false);
      expect(store.enabledLists, hasLength(1));
    });

    test('should not disable list when only one list is enabled', () async {
      when(mockGetEnabledLists()).thenAnswer((_) async => [option]);
      await store.init();

      store.toggleList(option);

      expect(store.enabledLists, contains(option));
      expect(store.enabledLists, hasLength(1));
      verifyZeroInteractions(mockSaveEnabledLists);
    });
  });

  group('enableList', () {
    late ReitListSortOptionType option;

    setUp(() {
      option = ReitListSortOptionType.assetsAmount;

      when(mockSaveEnabledLists([option]))
          .thenAnswer((_) async => const Right(true));
    });

    test('should add list to the [enabledLists] list', () {
      store.enableList(option);

      expect(store.enabledLists, contains(option));
      expect(store.enabledLists, hasLength(1));
    });

    test('should have called [SaveEnabledLists] usecase to persist data', () {
      store.enableList(option);

      verify(mockSaveEnabledLists([option]));
    });

    test('should not add same option multiple times to [enabledLists]', () {
      store.enableList(option);
      store.enableList(option);
      store.enableList(option);

      expect(store.enabledLists, contains(option));
      expect(store.enabledLists, hasLength(1));
    });
  });

  group('disableList', () {
    late ReitListSortOptionType option;

    setUp(() {
      option = ReitListSortOptionType.assetsAmount;

      when(mockSaveEnabledLists([])).thenAnswer((_) async => const Right(true));
    });

    test('should remove list from [enabledLists] list', () {
      store.disableList(option);

      expect(store.enabledLists.contains(option), false);
      expect(store.enabledLists, hasLength(0));
    });

    test('should have called [SaveEnabledLists] usecase to persist data', () {
      store.disableList(option);

      verify(mockSaveEnabledLists([]));
    });
  });
}
