import 'package:dartz/dartz.dart';
import 'package:fii_app/core/errors/failures.dart';
import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart';

abstract class ReitListSettingsRepository {
  Future<List<ReitListSortOptionType>> getEnabledLists();
  Future<Either<Failure, bool>> saveEnabledLists(
      List<ReitListSortOptionType> lists);

  int getListLimit();
  Future<Either<Failure, bool>> saveListLimit(int limit);
}
