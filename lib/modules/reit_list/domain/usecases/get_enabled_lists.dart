import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart';
import 'package:fii_app/modules/reit_list/domain/repositories/reit_list_settings_repository.dart';

class GetEnabledLists {
  final ReitListSettingsRepository reitListSettingsRepository;

  GetEnabledLists({required this.reitListSettingsRepository});

  Future<List<ReitListSortOptionType>> call() =>
      reitListSettingsRepository.getEnabledLists();
}
