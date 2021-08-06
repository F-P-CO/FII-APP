// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reit_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReitListStore on _ReitListStoreBase, Store {
  Computed<List<Reit>>? _$sortedReitsComputed;

  @override
  List<Reit> get sortedReits =>
      (_$sortedReitsComputed ??= Computed<List<Reit>>(() => super.sortedReits,
              name: '_ReitListStoreBase.sortedReits'))
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

  final _$hasErrorAtom = Atom(name: '_ReitListStoreBase.hasError');

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
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

  final _$currentSortOptionAtom =
      Atom(name: '_ReitListStoreBase.currentSortOption');

  @override
  ReitListSortOption get currentSortOption {
    _$currentSortOptionAtom.reportRead();
    return super.currentSortOption;
  }

  @override
  set currentSortOption(ReitListSortOption value) {
    _$currentSortOptionAtom.reportWrite(value, super.currentSortOption, () {
      super.currentSortOption = value;
    });
  }

  final _$fetchAllAsyncAction = AsyncAction('_ReitListStoreBase.fetchAll');

  @override
  Future<void> fetchAll() {
    return _$fetchAllAsyncAction.run(() => super.fetchAll());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
hasError: ${hasError},
reits: ${reits},
currentSortOption: ${currentSortOption},
sortedReits: ${sortedReits}
    ''';
  }
}
