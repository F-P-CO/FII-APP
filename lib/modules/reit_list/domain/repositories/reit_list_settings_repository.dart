import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart';

abstract class ReitListSettingsRepository {
  Future<List<ReitListSortOptionType>> getEnabledLists();
  Future<bool> saveEnabledLists(List<ReitListSortOptionType> lists);

  int getListLimit();
  Future<bool> saveListLimit(int limit);
}
