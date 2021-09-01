import 'package:dartz/dartz.dart';
import 'package:fii_app/core/errors/failures.dart';
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
  Future<Either<Failure, bool>> saveEnabledLists(
      List<ReitListSortOptionType> lists) async {
    try {
      final saved = await localDatasource.saveEnabledLists(lists);

      if (!saved) {
        return Left(
          UnexpectedFailure(
            message: "Unable to save enabled lists on local datasource.",
          ),
        );
      }

      return Right(saved);
    } on Exception catch (exception) {
      return Left(LocalStorageFailure(exception: exception));
    }
  }

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
  Future<Either<Failure, bool>> saveListLimit(int limit) async {
    try {
      final saved = await localDatasource.saveListLimit(limit);

      if (!saved) {
        return Left(
          UnexpectedFailure(
            message: "Unable to save list limit on local datasource.",
          ),
        );
      }

      return Right(saved);
    } on Exception catch (exception) {
      return Left(LocalStorageFailure(exception: exception));
    }
  }
}
