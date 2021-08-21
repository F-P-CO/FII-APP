import 'package:fii_app/modules/reit_list/data/datasources/reit_list_settings_local_data_source.dart';
import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart';
import 'package:fii_app/modules/reit_list/domain/repositories/reit_list_settings_repository.dart';

class DefaultReitListSettingsRepository implements ReitListSettingsRepository {
  final ReitSettingsLocalDataSource reitSettingsLocalDataSource;

  final List<ReitListSortOptionType> defaultEnabledLists = [
    ReitListSortOptionType.netWorth,
    ReitListSortOptionType.currentDividendYield,
    ReitListSortOptionType.assetsAmount,
  ];

  DefaultReitListSettingsRepository({
    required this.reitSettingsLocalDataSource,
  });

  @override
  Future<List<ReitListSortOptionType>> getEnabledLists() async {
    try {
      final lists = await reitSettingsLocalDataSource.getEnabledLists();
      return lists;
    } on Exception {
      return defaultEnabledLists;
    }
  }

  @override
  Future<bool> saveEnabledLists(List<ReitListSortOptionType> lists) =>
      reitSettingsLocalDataSource.saveEnabledLists(lists);
}
