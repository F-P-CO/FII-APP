// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reit_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReitListStore on _ReitListStoreBase, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_ReitListStoreBase.hasError'))
          .value;
  Computed<int>? _$totalReitsComputed;

  @override
  int get totalReits =>
      (_$totalReitsComputed ??= Computed<int>(() => super.totalReits,
              name: '_ReitListStoreBase.totalReits'))
          .value;
  Computed<List<Reit>>? _$reitsSortedByNetWorthComputed;

  @override
  List<Reit> get reitsSortedByNetWorth => (_$reitsSortedByNetWorthComputed ??=
          Computed<List<Reit>>(() => super.reitsSortedByNetWorth,
              name: '_ReitListStoreBase.reitsSortedByNetWorth'))
      .value;
  Computed<List<Reit>>? _$reitsSortedByAssetsAmountComputed;

  @override
  List<Reit> get reitsSortedByAssetsAmount =>
      (_$reitsSortedByAssetsAmountComputed ??= Computed<List<Reit>>(
              () => super.reitsSortedByAssetsAmount,
              name: '_ReitListStoreBase.reitsSortedByAssetsAmount'))
          .value;
  Computed<List<Reit>>? _$reitsSortedByCurrentDividendYieldComputed;

  @override
  List<Reit> get reitsSortedByCurrentDividendYield =>
      (_$reitsSortedByCurrentDividendYieldComputed ??= Computed<List<Reit>>(
              () => super.reitsSortedByCurrentDividendYield,
              name: '_ReitListStoreBase.reitsSortedByCurrentDividendYield'))
          .value;

  final _$isLoadingAtom = Atom(name: '_ReitListStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_ReitListStoreBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$reitsAtom = Atom(name: '_ReitListStoreBase.reits');

  @override
  List<Reit> get reits {
    _$reitsAtom.reportRead();
    return super.reits;
  }

  @override
  set reits(List<Reit> value) {
    _$reitsAtom.reportWrite(value, super.reits, () {
      super.reits = value;
    });
  }

  final _$loadReitListAsyncAction =
      AsyncAction('_ReitListStoreBase.loadReitList');

  @override
  Future<void> loadReitList() {
    return _$loadReitListAsyncAction.run(() => super.loadReitList());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
reits: ${reits},
hasError: ${hasError},
totalReits: ${totalReits},
reitsSortedByNetWorth: ${reitsSortedByNetWorth},
reitsSortedByAssetsAmount: ${reitsSortedByAssetsAmount},
reitsSortedByCurrentDividendYield: ${reitsSortedByCurrentDividendYield}
    ''';
  }
}
