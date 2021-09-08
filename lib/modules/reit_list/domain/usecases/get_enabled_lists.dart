import 'package:fii_app/core/domain/entities/reit_column.dart';
import 'package:fii_app/modules/reit_list/domain/repositories/reit_list_settings_repository.dart';

class GetEnabledLists {
  final ReitListSettingsRepository reitListSettingsRepository;

  GetEnabledLists({required this.reitListSettingsRepository});

  Future<List<ReitColumnType>> call() =>
      reitListSettingsRepository.getEnabledLists();
}
