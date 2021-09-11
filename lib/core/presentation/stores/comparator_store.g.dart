// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comparator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ComparatorStore on _ComparatorStoreBase, Store {
  Computed<List<Reit>>? _$textFilteredReitsComputed;

  @override
  List<Reit> get textFilteredReits => (_$textFilteredReitsComputed ??=
          Computed<List<Reit>>(() => super.textFilteredReits,
              name: '_ComparatorStoreBase.textFilteredReits'))
      .value;
  Computed<List<Reit>>? _$currentReitsComputed;

  @override
  List<Reit> get currentReits =>
      (_$currentReitsComputed ??= Computed<List<Reit>>(() => super.currentReits,
              name: '_ComparatorStoreBase.currentReits'))
          .value;
  Computed<bool>? _$isSearchEnabledComputed;

  @override
  bool get isSearchEnabled =>
      (_$isSearchEnabledComputed ??= Computed<bool>(() => super.isSearchEnabled,
              name: '_ComparatorStoreBase.isSearchEnabled'))
          .value;
  Computed<int>? _$minAssetsAmountComputed;

  @override
  int get minAssetsAmount =>
      (_$minAssetsAmountComputed ??= Computed<int>(() => super.minAssetsAmount,
              name: '_ComparatorStoreBase.minAssetsAmount'))
          .value;
  Computed<int>? _$maxAssetsAmountComputed;

  @override
  int get maxAssetsAmount =>
      (_$maxAssetsAmountComputed ??= Computed<int>(() => super.maxAssetsAmount,
              name: '_ComparatorStoreBase.maxAssetsAmount'))
          .value;
  Computed<double>? _$minVacancyComputed;

  @override
  double get minVacancy =>
      (_$minVacancyComputed ??= Computed<double>(() => super.minVacancy,
              name: '_ComparatorStoreBase.minVacancy'))
          .value;
  Computed<double>? _$maxVacancyComputed;

  @override
  double get maxVacancy =>
      (_$maxVacancyComputed ??= Computed<double>(() => super.maxVacancy,
              name: '_ComparatorStoreBase.maxVacancy'))
          .value;
  Computed<List<ReitColumn>>? _$enabledColumnsInOrderComputed;

  @override
  List<ReitColumn> get enabledColumnsInOrder =>
      (_$enabledColumnsInOrderComputed ??= Computed<List<ReitColumn>>(
              () => super.enabledColumnsInOrder,
              name: '_ComparatorStoreBase.enabledColumnsInOrder'))
          .value;

  final _$searchTextAtom = Atom(name: '_ComparatorStoreBase.searchText');

  @override
  String get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  final _$enabledFiltersAtom =
      Atom(name: '_ComparatorStoreBase.enabledFilters');

  @override
  ObservableList<ReitColumn> get enabledFilters {
    _$enabledFiltersAtom.reportRead();
    return super.enabledFilters;
  }

  @override
  set enabledFilters(ObservableList<ReitColumn> value) {
    _$enabledFiltersAtom.reportWrite(value, super.enabledFilters, () {
      super.enabledFilters = value;
    });
  }

  final _$dividendYieldRangeAtom =
      Atom(name: '_ComparatorStoreBase.dividendYieldRange');

  @override
  List<double?> get dividendYieldRange {
    _$dividendYieldRangeAtom.reportRead();
    return super.dividendYieldRange;
  }

  @override
  set dividendYieldRange(List<double?> value) {
    _$dividendYieldRangeAtom.reportWrite(value, super.dividendYieldRange, () {
      super.dividendYieldRange = value;
    });
  }

  final _$assetsAmountRangeAtom =
      Atom(name: '_ComparatorStoreBase.assetsAmountRange');

  @override
  List<double> get assetsAmountRange {
    _$assetsAmountRangeAtom.reportRead();
    return super.assetsAmountRange;
  }

  @override
  set assetsAmountRange(List<double> value) {
    _$assetsAmountRangeAtom.reportWrite(value, super.assetsAmountRange, () {
      super.assetsAmountRange = value;
    });
  }

  final _$vacancyRangeAtom = Atom(name: '_ComparatorStoreBase.vacancyRange');

  @override
  List<double> get vacancyRange {
    _$vacancyRangeAtom.reportRead();
    return super.vacancyRange;
  }

  @override
  set vacancyRange(List<double> value) {
    _$vacancyRangeAtom.reportWrite(value, super.vacancyRange, () {
      super.vacancyRange = value;
    });
  }

  final _$tableColumnsAtom = Atom(name: '_ComparatorStoreBase.tableColumns');

  @override
  ObservableList<ReitColumn> get tableColumns {
    _$tableColumnsAtom.reportRead();
    return super.tableColumns;
  }

  @override
  set tableColumns(ObservableList<ReitColumn> value) {
    _$tableColumnsAtom.reportWrite(value, super.tableColumns, () {
      super.tableColumns = value;
    });
  }

  final _$enabledColumnsAtom =
      Atom(name: '_ComparatorStoreBase.enabledColumns');

  @override
  ObservableList<ReitColumn> get enabledColumns {
    _$enabledColumnsAtom.reportRead();
    return super.enabledColumns;
  }

  @override
  set enabledColumns(ObservableList<ReitColumn> value) {
    _$enabledColumnsAtom.reportWrite(value, super.enabledColumns, () {
      super.enabledColumns = value;
    });
  }

  final _$_ComparatorStoreBaseActionController =
      ActionController(name: '_ComparatorStoreBase');

  @override
  void toggleFilter(ReitColumn filter) {
    final _$actionInfo = _$_ComparatorStoreBaseActionController.startAction(
        name: '_ComparatorStoreBase.toggleFilter');
    try {
      return super.toggleFilter(filter);
    } finally {
      _$_ComparatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleColumn(ReitColumn column) {
    final _$actionInfo = _$_ComparatorStoreBaseActionController.startAction(
        name: '_ComparatorStoreBase.toggleColumn');
    try {
      return super.toggleColumn(column);
    } finally {
      _$_ComparatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchText: ${searchText},
enabledFilters: ${enabledFilters},
dividendYieldRange: ${dividendYieldRange},
assetsAmountRange: ${assetsAmountRange},
vacancyRange: ${vacancyRange},
tableColumns: ${tableColumns},
enabledColumns: ${enabledColumns},
textFilteredReits: ${textFilteredReits},
currentReits: ${currentReits},
isSearchEnabled: ${isSearchEnabled},
minAssetsAmount: ${minAssetsAmount},
maxAssetsAmount: ${maxAssetsAmount},
minVacancy: ${minVacancy},
maxVacancy: ${maxVacancy},
enabledColumnsInOrder: ${enabledColumnsInOrder}
    ''';
  }
}
