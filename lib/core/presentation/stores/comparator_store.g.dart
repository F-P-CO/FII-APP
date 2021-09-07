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

  final _$_ComparatorStoreBaseActionController =
      ActionController(name: '_ComparatorStoreBase');

  @override
  void toggleFilter(Filter filter) {
    final _$actionInfo = _$_ComparatorStoreBaseActionController.startAction(
        name: '_ComparatorStoreBase.toggleFilter');
    try {
      return super.toggleFilter(filter);
    } finally {
      _$_ComparatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchText: ${searchText},
enabledFilters: ${enabledFilters},
assetsAmountRange: ${assetsAmountRange},
textFilteredReits: ${textFilteredReits},
currentReits: ${currentReits},
isSearchEnabled: ${isSearchEnabled},
minAssetsAmount: ${minAssetsAmount},
maxAssetsAmount: ${maxAssetsAmount}
    ''';
  }
}
