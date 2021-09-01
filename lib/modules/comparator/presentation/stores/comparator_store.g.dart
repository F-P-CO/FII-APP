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

  final _$filterAtom = Atom(name: '_ComparatorStoreBase.filter');

  @override
  ComparatorFilter get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(ComparatorFilter value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$_ComparatorStoreBaseActionController =
      ActionController(name: '_ComparatorStoreBase');

  @override
  void changeSearchFilter(String value) {
    final _$actionInfo = _$_ComparatorStoreBaseActionController.startAction(
        name: '_ComparatorStoreBase.changeSearchFilter');
    try {
      return super.changeSearchFilter(value);
    } finally {
      _$_ComparatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filter: ${filter},
currentReits: ${currentReits}
    ''';
  }
}
