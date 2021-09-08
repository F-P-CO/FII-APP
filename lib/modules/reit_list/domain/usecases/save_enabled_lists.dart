import 'package:dartz/dartz.dart';
import 'package:fii_app/core/errors/failures.dart';
import 'package:fii_app/core/domain/entities/reit_column.dart';
import 'package:fii_app/modules/reit_list/domain/repositories/reit_list_settings_repository.dart';

class SaveEnabledLists {
  final ReitListSettingsRepository reitListSettingsRepository;

  SaveEnabledLists({required this.reitListSettingsRepository});

  Future<Either<Failure, bool>> call(List<ReitColumnType> lists) =>
      reitListSettingsRepository.saveEnabledLists(lists);
}
