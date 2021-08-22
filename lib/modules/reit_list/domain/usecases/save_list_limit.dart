import 'package:dartz/dartz.dart';
import 'package:fii_app/core/errors/failures.dart';
import 'package:fii_app/modules/reit_list/domain/repositories/reit_list_settings_repository.dart';

class SaveListLimit {
  final ReitListSettingsRepository reitListSettingsRepository;

  SaveListLimit({required this.reitListSettingsRepository});

  Future<Either<Failure, bool>> call(int limit) async {
    final save = await reitListSettingsRepository.saveListLimit(limit);

    if (save) {
      return const Right(true);
    } else {
      return Left(LocalStorageFailure());
    }
  }
}
