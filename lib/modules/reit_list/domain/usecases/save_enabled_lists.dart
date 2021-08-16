import 'package:either_dart/either.dart';
import 'package:fii_app/core/errors/failures.dart';
import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart';
import 'package:fii_app/modules/reit_list/domain/repositories/reit_list_settings_repository.dart';

class SaveEnabledLists {
  final ReitListSettingsRepository reitListSettingsRepository;

  SaveEnabledLists({required this.reitListSettingsRepository});

  Future<Either<Failure, bool>> call(List<ReitListSortOptionType> lists) async {
    final save = await reitListSettingsRepository.saveEnabledLists(lists);

    if (save) {
      return const Right(true);
    } else {
      return Left(LocalStorageFailure());
    }
  }
}
