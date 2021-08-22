import 'package:fii_app/modules/reit_list/domain/repositories/reit_list_settings_repository.dart';

class GetListLimit {
  final ReitListSettingsRepository reitListSettingsRepository;

  GetListLimit({required this.reitListSettingsRepository});

  int call() => reitListSettingsRepository.getLimit();
}
