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
  ObservableList<Filter> enabledFilters = <Filter>[].asObservable();

  @observable
  late List<double> assetsAmountRange = [
    minAssetsAmount.toDouble(),
    maxAssetsAmount.toDouble()
  ];

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

    if (isFilterEnabled(Filter.assetsAmount)) {
      reits = reits
          .where(
            (reit) =>
                reit.assetsAmount >= assetsAmountRange.first &&
                reit.assetsAmount <= assetsAmountRange.last,
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

  bool isFilterEnabled(Filter filter) => enabledFilters.contains(filter);

  @computed
  int get minAssetsAmount =>
      _reitListStore.reitsSortedByAssetsAmount.last.assetsAmount;

  @computed
  int get maxAssetsAmount =>
      _reitListStore.reitsSortedByAssetsAmount.first.assetsAmount;
}
