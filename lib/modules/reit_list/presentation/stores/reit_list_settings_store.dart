import 'package:fii_app/modules/reit_list/presentation/stores/reit_list_store.dart';
import 'package:mobx/mobx.dart';

part 'reit_list_settings_store.g.dart';

class ReitListSettingsStore = _ReitListSettingsStoreBase
    with _$ReitListSettingsStore;

abstract class _ReitListSettingsStoreBase with Store {
  @observable
  ObservableList<ReitListSortOptionType> enabledLists = [
    ReitListSortOptionType.netWorth,
    ReitListSortOptionType.currentDividendYield,
    ReitListSortOptionType.assetsAmount,
  ].asObservable();

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
  void enableList(ReitListSortOptionType option) => enabledLists.add(option);

  @action
  bool disableList(ReitListSortOptionType option) =>
      enabledLists.remove(option);
}
