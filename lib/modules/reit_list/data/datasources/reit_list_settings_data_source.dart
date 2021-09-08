import 'package:fii_app/core/domain/entities/reit_column.dart';

abstract class ReitListSettingsDataSource {
  Future<List<ReitColumnType>> getEnabledLists();
  Future<bool> saveEnabledLists(List<ReitColumnType> lists);

  int getListLimit();
  Future<bool> saveListLimit(int limit);
}
