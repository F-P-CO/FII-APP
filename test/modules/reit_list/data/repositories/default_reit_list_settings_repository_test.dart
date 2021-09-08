import 'package:dartz/dartz.dart';
import 'package:fii_app/core/domain/entities/reit_column.dart';
import 'package:fii_app/modules/reit_list/data/datasources/local_reit_list_settings_data_source.dart';
import 'package:fii_app/modules/reit_list/data/repositories/default_reit_list_settings_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'default_reit_list_settings_repository_test.mocks.dart';

@GenerateMocks([LocalReitSettingsDataSource])
void main() {
  late MockLocalReitSettingsDataSource mockDatasource;
  late DefaultReitListSettingsRepository repository;

  setUp(() {
    mockDatasource = MockLocalReitSettingsDataSource();

    repository = DefaultReitListSettingsRepository(
      localDatasource: mockDatasource,
    );
  });

  group('getEnabledLists', () {
    test('should return enabled lists when datasource returns a list',
        () async {
      final mockList = [ReitColumnType.netWorth];

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
      final mockList = [ReitColumnType.netWorth];
      when(mockDatasource.saveEnabledLists(mockList))
          .thenAnswer((_) => Future.value(true));

      final save = await repository.saveEnabledLists(mockList);
      expect(save, equals(const Right(true)));
      verify(mockDatasource.saveEnabledLists(mockList));
    });
  });

  group('getLimit', () {
    test('should return list limit when datasource returns a int', () {
      const mockLimit = 100;
      when(mockDatasource.getListLimit()).thenReturn(mockLimit);

      final limit = repository.getListLimit();

      expect(limit, equals(mockLimit));
      verify(mockDatasource.getListLimit());
    });

    test('should return default list limit when datasource throws a Exception',
        () {
      when(mockDatasource.getListLimit()).thenThrow(Exception());

      final limit = repository.getListLimit();

      expect(limit, equals(repository.defaultLimit));
      verify(mockDatasource.getListLimit());
    });
  });

  group('saveListLimit', () {
    test('should save list limit on datasource', () async {
      const mockLimit = 100;
      when(mockDatasource.saveListLimit(mockLimit))
          .thenAnswer((_) => Future.value(true));

      final save = await repository.saveListLimit(mockLimit);

      expect(save, equals(const Right(true)));
      verify(mockDatasource.saveListLimit(mockLimit));
    });
  });
}
