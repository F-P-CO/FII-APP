// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comparator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ComparatorStore on _ComparatorStoreBase, Store {
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
  Computed<bool>? _$isDividendYieldFilterEnabledComputed;

  @override
  bool get isDividendYieldFilterEnabled =>
      (_$isDividendYieldFilterEnabledComputed ??= Computed<bool>(
              () => super.isDividendYieldFilterEnabled,
              name: '_ComparatorStoreBase.isDividendYieldFilterEnabled'))
          .value;
  Computed<bool>? _$isAssetsAmountFilterEnabledComputed;

  @override
  bool get isAssetsAmountFilterEnabled =>
      (_$isAssetsAmountFilterEnabledComputed ??= Computed<bool>(
              () => super.isAssetsAmountFilterEnabled,
              name: '_ComparatorStoreBase.isAssetsAmountFilterEnabled'))
          .value;
  Computed<double>? _$minDividendYieldComputed;

  @override
  double get minDividendYield => (_$minDividendYieldComputed ??=
          Computed<double>(() => super.minDividendYield,
              name: '_ComparatorStoreBase.minDividendYield'))
      .value;
  Computed<double>? _$maxDividendYieldComputed;

  @override
  double get maxDividendYield => (_$maxDividendYieldComputed ??=
          Computed<double>(() => super.maxDividendYield,
              name: '_ComparatorStoreBase.maxDividendYield'))
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

  final _$searchTextAtom = Atom(name: '_ComparatorStoreBase.searchText');

  @override
  String? get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String? value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  final _$dividendYieldRangeAtom =
      Atom(name: '_ComparatorStoreBase.dividendYieldRange');

  @override
  List<double>? get dividendYieldRange {
    _$dividendYieldRangeAtom.reportRead();
    return super.dividendYieldRange;
  }

  @override
  set dividendYieldRange(List<double>? value) {
    _$dividendYieldRangeAtom.reportWrite(value, super.dividendYieldRange, () {
      super.dividendYieldRange = value;
    });
  }

  final _$assetsAmountRangeAtom =
      Atom(name: '_ComparatorStoreBase.assetsAmountRange');

  @override
  List<double>? get assetsAmountRange {
    _$assetsAmountRangeAtom.reportRead();
    return super.assetsAmountRange;
  }

  @override
  set assetsAmountRange(List<double>? value) {
    _$assetsAmountRangeAtom.reportWrite(value, super.assetsAmountRange, () {
      super.assetsAmountRange = value;
    });
  }

  final _$enabledFiltersAtom =
      Atom(name: '_ComparatorStoreBase.enabledFilters');

  @override
  ObservableList<Filter> get enabledFilters {
    _$enabledFiltersAtom.reportRead();
    return super.enabledFilters;
  }

  @override
  set enabledFilters(ObservableList<Filter> value) {
    _$enabledFiltersAtom.reportWrite(value, super.enabledFilters, () {
      super.enabledFilters = value;
    });
  }

  final _$_ComparatorStoreBaseActionController =
      ActionController(name: '_ComparatorStoreBase');

  @override
  void toggle(Filter filter) {
    final _$actionInfo = _$_ComparatorStoreBaseActionController.startAction(
        name: '_ComparatorStoreBase.toggle');
    try {
      return super.toggle(filter);
    } finally {
      _$_ComparatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchText: ${searchText},
dividendYieldRange: ${dividendYieldRange},
assetsAmountRange: ${assetsAmountRange},
enabledFilters: ${enabledFilters},
currentReits: ${currentReits},
isSearchEnabled: ${isSearchEnabled},
isDividendYieldFilterEnabled: ${isDividendYieldFilterEnabled},
isAssetsAmountFilterEnabled: ${isAssetsAmountFilterEnabled},
minDividendYield: ${minDividendYield},
maxDividendYield: ${maxDividendYield},
minAssetsAmount: ${minAssetsAmount},
maxAssetsAmount: ${maxAssetsAmount}
    ''';
  }
}
