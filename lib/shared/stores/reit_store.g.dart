// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reit_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReitStore on _ReitStoreBase, Store {
  final _$hasErrorAtom = Atom(name: '_ReitStoreBase.hasError');

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

  final _$reitsAtom = Atom(name: '_ReitStoreBase.reits');

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

  final _$isListLoadingAtom = Atom(name: '_ReitStoreBase.isListLoading');

  @override
  bool get isListLoading {
    _$isListLoadingAtom.reportRead();
    return super.isListLoading;
  }

  @override
  set isListLoading(bool value) {
    _$isListLoadingAtom.reportWrite(value, super.isListLoading, () {
      super.isListLoading = value;
    });
  }

  final _$loadReitsListAsyncAction =
      AsyncAction('_ReitStoreBase.loadReitsList');

  @override
  Future<void> loadReitsList() {
    return _$loadReitsListAsyncAction.run(() => super.loadReitsList());
  }

  @override
  String toString() {
    return '''
hasError: ${hasError},
reits: ${reits},
isListLoading: ${isListLoading}
    ''';
  }
}
