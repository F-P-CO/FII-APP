import 'package:fii_app/core/domain/entities/reit.dart';
import 'package:fii_app/core/presentation/stores/reit_list_store.dart';
import 'package:mobx/mobx.dart';

part 'comparator_store.g.dart';

enum Filter { dividendYield, assetsAmount }

class ComparatorStore = _ComparatorStoreBase with _$ComparatorStore;

abstract class _ComparatorStoreBase with Store {
  final ReitListStore _reitListStore;

  @observable
  String? searchText;

  @observable
  List<double>? dividendYieldRange;

  @observable
  List<double>? assetsAmountRange;

  @observable
  ObservableList<Filter> enabledFilters = <Filter>[].asObservable();

  _ComparatorStoreBase({
    required ReitListStore reitListStore,
  }) : _reitListStore = reitListStore;

  @computed
  List<Reit> get currentReits {
    List<Reit> reits = _reitListStore.reits;

    if (isSearchEnabled) {
      reits = reits
          .where(
            (reit) =>
                reit.symbol.toLowerCase().contains(searchText!.toLowerCase()) ||
                reit.sector.toLowerCase().contains(searchText!.toLowerCase()),
          )
          .toList();
    }

    return reits;
  }

  @action
  void toggle(Filter filter) {
    if (enabledFilters.contains(filter)) {
      enabledFilters.remove(filter);
    } else {
      enabledFilters.add(filter);
    }
  }

  @computed
  bool get isSearchEnabled => searchText != null;

  @computed
  bool get isDividendYieldFilterEnabled =>
      enabledFilters.contains(Filter.dividendYield);

  @computed
  bool get isAssetsAmountFilterEnabled =>
      enabledFilters.contains(Filter.assetsAmount);

  @computed
  double get minDividendYield =>
      _reitListStore.reitsSortedByCurrentDividendYield
          .where((reit) => reit.currentDividendYield != null)
          .last
          .currentDividendYield!;

  @computed
  double get maxDividendYield =>
      _reitListStore.reitsSortedByCurrentDividendYield
          .where((reit) => reit.currentDividendYield != null)
          .first
          .currentDividendYield!;

  @computed
  int get minAssetsAmount =>
      _reitListStore.reitsSortedByAssetsAmount.last.assetsAmount;

  @computed
  int get maxAssetsAmount =>
      _reitListStore.reitsSortedByAssetsAmount.first.assetsAmount;
}
