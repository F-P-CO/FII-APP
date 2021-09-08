// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reit_list_settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReitListSettingsStore on _ReitListSettingsStoreBase, Store {
  Computed<int>? _$loadingLimitComputed;

  @override
  int get loadingLimit =>
      (_$loadingLimitComputed ??= Computed<int>(() => super.loadingLimit,
              name: '_ReitListSettingsStoreBase.loadingLimit'))
          .value;

  final _$enabledListsAtom =
      Atom(name: '_ReitListSettingsStoreBase.enabledLists');

  @override
  ObservableSet<ReitColumnType> get enabledLists {
    _$enabledListsAtom.reportRead();
    return super.enabledLists;
  }

  @override
  set enabledLists(ObservableSet<ReitColumnType> value) {
    _$enabledListsAtom.reportWrite(value, super.enabledLists, () {
      super.enabledLists = value;
    });
  }

  final _$limitAtom = Atom(name: '_ReitListSettingsStoreBase.limit');

  @override
  int get limit {
    _$limitAtom.reportRead();
    return super.limit;
  }

  @override
  set limit(int value) {
    _$limitAtom.reportWrite(value, super.limit, () {
      super.limit = value;
    });
  }

  final _$_initEnabledListsAsyncAction =
      AsyncAction('_ReitListSettingsStoreBase._initEnabledLists');

  @override
  Future<void> _initEnabledLists() {
    return _$_initEnabledListsAsyncAction.run(() => super._initEnabledLists());
  }

  final _$_ReitListSettingsStoreBaseActionController =
      ActionController(name: '_ReitListSettingsStoreBase');

  @override
  void _initListLimit() {
    final _$actionInfo = _$_ReitListSettingsStoreBaseActionController
        .startAction(name: '_ReitListSettingsStoreBase._initListLimit');
    try {
      return super._initListLimit();
    } finally {
      _$_ReitListSettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleList(ReitColumnType option) {
    final _$actionInfo = _$_ReitListSettingsStoreBaseActionController
        .startAction(name: '_ReitListSettingsStoreBase.toggleList');
    try {
      return super.toggleList(option);
    } finally {
      _$_ReitListSettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void enableList(ReitColumnType option) {
    final _$actionInfo = _$_ReitListSettingsStoreBaseActionController
        .startAction(name: '_ReitListSettingsStoreBase.enableList');
    try {
      return super.enableList(option);
    } finally {
      _$_ReitListSettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void disableList(ReitColumnType option) {
    final _$actionInfo = _$_ReitListSettingsStoreBaseActionController
        .startAction(name: '_ReitListSettingsStoreBase.disableList');
    try {
      return super.disableList(option);
    } finally {
      _$_ReitListSettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLimit(int newLimit) {
    final _$actionInfo = _$_ReitListSettingsStoreBaseActionController
        .startAction(name: '_ReitListSettingsStoreBase.changeLimit');
    try {
      return super.changeLimit(newLimit);
    } finally {
      _$_ReitListSettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
enabledLists: ${enabledLists},
limit: ${limit},
loadingLimit: ${loadingLimit}
    ''';
  }
}
