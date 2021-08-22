import 'package:fii_app/modules/reit_list/data/datasources/local_reit_list_settings_data_source.dart';
import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart';
import 'package:fii_app/modules/reit_list/domain/repositories/reit_list_settings_repository.dart';

class DefaultReitListSettingsRepository implements ReitListSettingsRepository {
  final LocalReitSettingsDataSource localDatasource;

  final List<ReitListSortOptionType> defaultEnabledLists = [
    ReitListSortOptionType.netWorth,
    ReitListSortOptionType.currentDividendYield,
    ReitListSortOptionType.assetsAmount,
  ];

  final int defaultLimit = 5;

  DefaultReitListSettingsRepository({
    required this.localDatasource,
  });

  @override
  Future<List<ReitListSortOptionType>> getEnabledLists() async {
    try {
      final lists = await localDatasource.getEnabledLists();
      return lists;
    } on Exception {
      return defaultEnabledLists;
    }
  }

  @override
  Future<bool> saveEnabledLists(List<ReitListSortOptionType> lists) =>
      localDatasource.saveEnabledLists(lists);

  @override
  int getListLimit() {
    try {
      final limit = localDatasource.getListLimit();
      return limit;
    } on Exception {
      return defaultLimit;
    }
  }

  @override
  Future<bool> saveListLimit(int limit) => localDatasource.saveListLimit(limit);
}
