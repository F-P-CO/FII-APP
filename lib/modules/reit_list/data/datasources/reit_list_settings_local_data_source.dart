import 'package:fii_app/core/errors/datasource_exceptions.dart';
import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReitSettingsLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const enabledListsStorageKey = 'reit_list_enabled_lists';

  ReitSettingsLocalDataSource({required this.sharedPreferences});

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

  Future<bool> saveEnabledLists(List<ReitListSortOptionType> lists) async {
    final stringList = lists.map((type) => type.index.toString()).toList();
    return sharedPreferences.setStringList(enabledListsStorageKey, stringList);
  }
}
