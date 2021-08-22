import 'package:fii_app/core/errors/datasource_exceptions.dart';
import 'package:fii_app/modules/reit_list/data/datasources/reit_list_settings_local_data_source.dart';
import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'reit_list_settings_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late ReitSettingsLocalDataSource datasource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();

    datasource = ReitSettingsLocalDataSource(
      sharedPreferences: mockSharedPreferences,
    );
  });

  group('getEnabledLists', () {
    test('should get list from shared preferences when there is a list saved',
        () async {
      final List<String> stringList = [
        ReitListSortOptionType.assetsAmount.index.toString()
      ];
      when(mockSharedPreferences.getStringList(any)).thenReturn(stringList);

      final list = await datasource.getEnabledLists();

      final expectedList = [ReitListSortOptionType.assetsAmount];
      expect(list, equals(expectedList));
      verify(mockSharedPreferences.getStringList(any));
    });

    test('should throw [DataNotFoundException] when there is no list saved',
        () async {
      when(mockSharedPreferences.getStringList(any)).thenReturn(null);

      expect(() async => datasource.getEnabledLists(),
          throwsA(isA<DataNotFoundException>()));
      verify(mockSharedPreferences.getStringList(any));
    });
  });

  group('saveEnabledLists', () {
    test('should save list on shared preferences successfully', () async {
      when(mockSharedPreferences.setStringList(any, any))
          .thenAnswer((_) => Future.value(true));

      final list = [ReitListSortOptionType.assetsAmount];
      final save = await datasource.saveEnabledLists(list);

      expect(save, true);
      verify(mockSharedPreferences.setStringList(any, any));
    });
  });
}
