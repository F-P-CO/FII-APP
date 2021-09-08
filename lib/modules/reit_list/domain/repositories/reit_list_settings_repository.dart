import 'package:dartz/dartz.dart';
import 'package:fii_app/core/domain/entities/reit_column.dart';
import 'package:fii_app/core/errors/failures.dart';

abstract class ReitListSettingsRepository {
  Future<List<ReitColumnType>> getEnabledLists();
  Future<Either<Failure, bool>> saveEnabledLists(List<ReitColumnType> lists);

  int getListLimit();
  Future<Either<Failure, bool>> saveListLimit(int limit);
}
