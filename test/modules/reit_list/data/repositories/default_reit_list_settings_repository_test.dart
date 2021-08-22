import 'package:fii_app/modules/reit_list/data/datasources/reit_list_settings_local_data_source.dart';
import 'package:fii_app/modules/reit_list/data/repositories/default_reit_list_settings_repository.dart';
import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'default_reit_list_settings_repository_test.mocks.dart';

@GenerateMocks([ReitSettingsLocalDataSource])
void main() {
  late MockReitSettingsLocalDataSource mockDatasource;
  late DefaultReitListSettingsRepository repository;

  setUp(() {
    mockDatasource = MockReitSettingsLocalDataSource();

    repository = DefaultReitListSettingsRepository(
      reitSettingsLocalDataSource: mockDatasource,
    );
  });

  group('getEnabledLists', () {
    test('should return enabled lists when datasource returns a list',
        () async {
      final mockList = [ReitListSortOptionType.netWorth];

      when(mockDatasource.getEnabledLists())
          .thenAnswer((_) => Future.value(mockList));

      final lists = await repository.getEnabledLists();

      expect(lists, equals(mockList));
      verify(mockDatasource.getEnabledLists());
    });

    test(
        'should return default enabled lists when datasource throws a Exception',
        () async {
      when(mockDatasource.getEnabledLists()).thenThrow(Exception());

      final lists = await repository.getEnabledLists();

      expect(lists, equals(repository.defaultEnabledLists));
      verify(mockDatasource.getEnabledLists());
    });
  });

  group('saveEnabledLists', () {
    test('should save lists on datasource', () async {
      final mockList = [ReitListSortOptionType.netWorth];
      when(mockDatasource.saveEnabledLists(mockList))
          .thenAnswer((_) => Future.value(true));

      final save = await repository.saveEnabledLists(mockList);
      expect(save, equals(true));
      verify(mockDatasource.saveEnabledLists(mockList));
    });
  });
}
