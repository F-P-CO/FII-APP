import 'package:fii_app/core/domain/entities/reit.dart';
import 'package:fii_app/core/presentation/stores/reit_list_store.dart';
import 'package:mobx/mobx.dart';

part 'comparator_store.g.dart';

enum Filter { dividendYield, assetsAmount }

class ComparatorStore = _ComparatorStoreBase with _$ComparatorStore;

abstract class _ComparatorStoreBase with Store {
  final ReitListStore _reitListStore;

  @observable
  String searchText = '';

  @observable
  ObservableList<Filter> enabledFilters = <Filter>[].asObservable();

  @observable
  List<double?> dividendYieldRange = List.filled(2, null);

  @observable
  late List<double> assetsAmountRange = [
    minAssetsAmount.toDouble(),
    maxAssetsAmount.toDouble()
  ];

  _ComparatorStoreBase({
    required ReitListStore reitListStore,
  }) : _reitListStore = reitListStore;

  @computed
  List<Reit> get textFilteredReits {
    return _reitListStore.reits
        .where((reit) =>
            reit.symbol.toLowerCase().contains(searchText.toLowerCase()) ||
            reit.sector.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }

  @computed
  List<Reit> get currentReits {
    List<Reit> reits = textFilteredReits;

    if (isFilterEnabled(Filter.dividendYield)) {
      final min = dividendYieldRange.first;
      final max = dividendYieldRange.last;

      if (min != null) {
        reits = reits
            .where(
              (reit) =>
                  reit.currentDividendYield != null &&
                  reit.currentDividendYield != 0 &&
                  reit.currentDividendYield! >= min,
            )
            .toList();
      }

      if (max != null) {
        reits = reits
            .where(
              (reit) =>
                  reit.currentDividendYield != null &&
                  reit.currentDividendYield! <= max,
            )
            .toList();
      }
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
  void toggleFilter(Filter filter) {
    if (enabledFilters.contains(filter)) {
      enabledFilters.remove(filter);
    } else {
      enabledFilters.add(filter);
    }
  }

  @computed
  bool get isSearchEnabled => searchText != '';

  bool isFilterEnabled(Filter filter) => enabledFilters.contains(filter);

  @computed
  int get minAssetsAmount =>
      _reitListStore.reitsSortedByAssetsAmount.last.assetsAmount;

  @computed
  int get maxAssetsAmount =>
      _reitListStore.reitsSortedByAssetsAmount.first.assetsAmount;
}
