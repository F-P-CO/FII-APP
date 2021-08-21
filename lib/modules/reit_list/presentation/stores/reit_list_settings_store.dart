import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart';
import 'package:fii_app/modules/reit_list/domain/usecases/get_enabled_lists.dart';
import 'package:fii_app/modules/reit_list/domain/usecases/save_enabled_lists.dart';
import 'package:mobx/mobx.dart';

part 'reit_list_settings_store.g.dart';

class ReitListSettingsStore = _ReitListSettingsStoreBase
    with _$ReitListSettingsStore;

abstract class _ReitListSettingsStoreBase with Store {
  final GetEnabledLists getEnabledLists;
  final SaveEnabledLists saveEnabledLists;

  @observable
  ObservableList<ReitListSortOptionType> enabledLists =
      <ReitListSortOptionType>[].asObservable();

  _ReitListSettingsStoreBase({
    required this.getEnabledLists,
    required this.saveEnabledLists,
  });

  @action
  Future<void> init() async {
    final lists = await getEnabledLists();
    enabledLists = lists.asObservable();
  }

  bool isEnabled(ReitListSortOptionType option) =>
      enabledLists.contains(option);

  @action
  void toggleList(ReitListSortOptionType option) {
    if (isEnabled(option)) {
      if (enabledLists.length > 1) {
        disableList(option);
      }
    } else {
      enableList(option);
    }
  }

  @action
  void enableList(ReitListSortOptionType option) {
    enabledLists.add(option);
    _persistEnabledLists();
  }

  @action
  void disableList(ReitListSortOptionType option) {
    enabledLists.remove(option);
    _persistEnabledLists();
  }

  Future _persistEnabledLists() => saveEnabledLists(enabledLists);
}
