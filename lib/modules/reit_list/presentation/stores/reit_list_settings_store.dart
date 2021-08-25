import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart';
import 'package:fii_app/modules/reit_list/domain/usecases/get_enabled_lists.dart';
import 'package:fii_app/modules/reit_list/domain/usecases/get_list_limit.dart';
import 'package:fii_app/modules/reit_list/domain/usecases/save_enabled_lists.dart';
import 'package:fii_app/modules/reit_list/domain/usecases/save_list_limit.dart';
import 'package:mobx/mobx.dart';

part 'reit_list_settings_store.g.dart';

class ReitListSettingsStore = _ReitListSettingsStoreBase
    with _$ReitListSettingsStore;

abstract class _ReitListSettingsStoreBase with Store {
  final GetEnabledLists getEnabledLists;
  final SaveEnabledLists saveEnabledLists;
  final GetListLimit getListLimit;
  final SaveListLimit saveListLimit;

  @observable
  ObservableSet<ReitListSortOptionType> enabledLists = ObservableSet.of([]);

  @observable
  int limit = 5;

  int maxLoadingLimit = 5;

  _ReitListSettingsStoreBase({
    required this.getEnabledLists,
    required this.saveEnabledLists,
    required this.getListLimit,
    required this.saveListLimit,
  });

  Future<void> init() async {
    _initListLimit();
    await _initEnabledLists();

    return Future.value();
  }

  @action
  void _initListLimit() {
    limit = getListLimit();
  }

  @action
  Future<void> _initEnabledLists() async {
    final lists = await getEnabledLists();
    enabledLists = ObservableSet.of(lists);
  }

  @computed
  int get loadingLimit => limit > maxLoadingLimit ? maxLoadingLimit : limit;

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

  Future _persistEnabledLists() => saveEnabledLists(enabledLists.toList());

  @action
  void changeLimit(int newLimit) {
    limit = newLimit;
    saveListLimit(newLimit);
  }
}
