import 'package:mobx/mobx.dart';

import '../../domain/entities/reit.dart';
import '../../domain/entities/reit_column.dart';
import 'reit_list_store.dart';

part 'comparator_store.g.dart';

class ComparatorStore = _ComparatorStoreBase with _$ComparatorStore;

abstract class _ComparatorStoreBase with Store {
  final ReitListStore _reitListStore;

  @observable
  String searchText = '';

  // Filters
  @observable
  ObservableList<ReitColumn> enabledFilters = <ReitColumn>[].asObservable();

  @observable
  List<double?> dividendYieldRange = List.filled(2, null);

  @observable
  late List<double> assetsAmountRange = [
    minAssetsAmount.toDouble(),
    maxAssetsAmount.toDouble()
  ];

  @observable
  late List<double> vacancyRange = [
    minVacancy.toDouble(),
    maxVacancy.toDouble()
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
  ObservableList<ReitColumn> enabledColumns = [
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

    if (isFilterEnabled(
      const ReitColumn(type: ReitColumnType.currentDividendYield),
    )) {
      final min = dividendYieldRange.first;
      final max = dividendYieldRange.last;

      if (min != null) {
        reits = reits
            .where(
              (reit) =>
                  reit.currentDividendYield != null &&
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

    if (isFilterEnabled(
      const ReitColumn(type: ReitColumnType.assetsAmount),
    )) {
      reits = reits
          .where(
            (reit) =>
                reit.assetsAmount >= assetsAmountRange.first &&
                reit.assetsAmount <= assetsAmountRange.last,
          )
          .toList();
    }

    if (isFilterEnabled(
      const ReitColumn(type: ReitColumnType.vacancy),
    )) {
      reits = reits
          .where(
            (reit) =>
                reit.vacancy != null &&
                reit.vacancy! >= vacancyRange.first &&
                reit.vacancy! <= vacancyRange.last,
          )
          .toList();
    }

    return reits;
  }

  @computed
  bool get isSearchEnabled => searchText != '';

  // Filters
  @action
  void toggleFilter(ReitColumn filter) {
    if (enabledFilters.contains(filter)) {
      enabledFilters.remove(filter);
    } else {
      enabledFilters.add(filter);
    }
  }

  bool isFilterEnabled(ReitColumn filter) => enabledFilters.contains(filter);

  @computed
  int get minAssetsAmount =>
      _reitListStore.reitsSortedByAssetsAmount.last.assetsAmount;

  @computed
  int get maxAssetsAmount =>
      _reitListStore.reitsSortedByAssetsAmount.first.assetsAmount;

  @computed
  double get minVacancy =>
      _reitListStore.reitsSortedByVacancy.last.vacancy ?? 0;

  @computed
  double get maxVacancy =>
      _reitListStore.reitsSortedByVacancy.first.vacancy ?? 100;

  // Columns
  @computed
  List<ReitColumn> get enabledColumnsInOrder =>
      tableColumns.where((column) => enabledColumns.contains(column)).toList();

  @action
  void toggleColumn(ReitColumn column) {
    if (enabledColumns.contains(column)) {
      if (enabledColumns.length > 1) {
        enabledColumns.remove(column);
      }
    } else {
      enabledColumns.add(column);
    }
  }

  bool isColumnEnabled(ReitColumn column) => enabledColumns.contains(column);
}
