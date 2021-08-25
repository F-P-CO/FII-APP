import 'package:fii_app/core/errors/datasource_exceptions.dart';
import 'package:fii_app/modules/reit_list/data/datasources/reit_list_settings_data_source.dart';
import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalReitSettingsDataSource implements ReitListSettingsDataSource {
  final SharedPreferences sharedPreferences;

  static const enabledListsStorageKey = 'reit_list_enabled_lists';
  static const limitStorageKey = 'reit_list_limit';

  LocalReitSettingsDataSource({required this.sharedPreferences});

  @override
  Future<List<ReitListSortOptionType>> getEnabledLists() async {
    final stringList = sharedPreferences.getStringList(enabledListsStorageKey);

    if (stringList != null) {
      final enabledLists = stringList
          .map((item) => ReitListSortOptionType.values[int.parse(item)])
          .toList();
      return enabledLists;
    } else {
      throw DataNotFoundException();
    }
  }

  @override
  Future<bool> saveEnabledLists(List<ReitListSortOptionType> lists) async {
    final stringList = lists.map((type) => type.index.toString()).toList();
    return sharedPreferences.setStringList(enabledListsStorageKey, stringList);
  }

  @override
  int getListLimit() {
    final limit = sharedPreferences.getInt(limitStorageKey);

    if (limit == null) {
      throw DataNotFoundException();
    }

    return limit;
  }

  @override
  Future<bool> saveListLimit(int limit) =>
      sharedPreferences.setInt(limitStorageKey, limit);
}
