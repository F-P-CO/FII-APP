import 'package:fii_app/core/domain/entities/reit.dart';
import 'package:fii_app/core/domain/entities/reit_column.dart';
import 'package:fii_app/core/presentation/stores/reit_list_store.dart';
import 'package:mobx/mobx.dart';

part 'comparator_store.g.dart';

enum ReitFilter { dividendYield, assetsAmount }

class ComparatorStore = _ComparatorStoreBase with _$ComparatorStore;

abstract class _ComparatorStoreBase with Store {
  final ReitListStore _reitListStore;

  @observable
  String? searchText;

  // Filters
  @observable
  ObservableList<ReitFilter> enabledFilters = <ReitFilter>[].asObservable();

  @observable
  List<double?> dividendYieldRange = List.filled(2, null);

  @observable
  late List<double> assetsAmountRange = [
    minAssetsAmount.toDouble(),
    maxAssetsAmount.toDouble()
  ];

  // Columns
  @observable
  ObservableList<ReitColumn> tableColumns = [
    const ReitColumn(type: ReitColumnType.sector),
    const ReitColumn(type: ReitColumnType.currentPrice),
    const ReitColumn(type: ReitColumnType.dailyLiquidity),
    const ReitColumn(type: ReitColumnType.currentDividend),
    const ReitColumn(type: ReitColumnType.currentDividendYield),
    const ReitColumn(type: ReitColumnType.netWorth),
    const ReitColumn(type: ReitColumnType.vpa),
    const ReitColumn(type: ReitColumnType.pvpa),
    const ReitColumn(type: ReitColumnType.vacancy),
    const ReitColumn(type: ReitColumnType.assetsAmount),
  ].asObservable();

  @observable
  ObservableList<ReitColumnType> enabledColumns = [
    ReitColumnType.sector,
    ReitColumnType.currentPrice,
    ReitColumnType.dailyLiquidity,
    ReitColumnType.currentDividend,
    ReitColumnType.currentDividendYield,
    ReitColumnType.netWorth,
    ReitColumnType.vpa,
    ReitColumnType.pvpa,
    ReitColumnType.vacancy,
    ReitColumnType.assetsAmount
  ].asObservable();

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

    if (isFilterEnabled(ReitFilter.dividendYield)) {
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

    if (isFilterEnabled(ReitFilter.assetsAmount)) {
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

  @computed
  bool get isSearchEnabled => searchText != null;

  // Filters
  @action
  void toggleFilter(ReitFilter filter) {
    if (enabledFilters.contains(filter)) {
      enabledFilters.remove(filter);
    } else {
      enabledFilters.add(filter);
    }
  }

  bool isFilterEnabled(ReitFilter filter) => enabledFilters.contains(filter);

  @computed
  int get minAssetsAmount =>
      _reitListStore.reitsSortedByAssetsAmount.last.assetsAmount;

  @computed
  int get maxAssetsAmount =>
      _reitListStore.reitsSortedByAssetsAmount.first.assetsAmount;

  // Columns
  @computed
  List<ReitColumn> get enabledColumnsInOrder => tableColumns
      .where((column) => enabledColumns.contains(column.type))
      .toList();

  @action
  void toggleColumn(ReitColumn column) {
    final type = column.type;

    if (enabledColumns.contains(type)) {
      if (enabledColumns.length > 1) {
        enabledColumns.remove(type);
      }
    } else {
      enabledColumns.add(type);
    }
  }

  bool isColumnEnabled(ReitColumn column) =>
      enabledColumns.contains(column.type);
}
