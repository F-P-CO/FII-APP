// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reit_list_settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReitListSettingsStore on _ReitListSettingsStoreBase, Store {
  final _$enabledListsAtom =
      Atom(name: '_ReitListSettingsStoreBase.enabledLists');

  @override
  ObservableList<ReitListSortOptionType> get enabledLists {
    _$enabledListsAtom.reportRead();
    return super.enabledLists;
  }

  @override
  set enabledLists(ObservableList<ReitListSortOptionType> value) {
    _$enabledListsAtom.reportWrite(value, super.enabledLists, () {
      super.enabledLists = value;
    });
  }

  final _$_ReitListSettingsStoreBaseActionController =
      ActionController(name: '_ReitListSettingsStoreBase');

  @override
  void toggleList(ReitListSortOptionType option) {
    final _$actionInfo = _$_ReitListSettingsStoreBaseActionController
        .startAction(name: '_ReitListSettingsStoreBase.toggleList');
    try {
      return super.toggleList(option);
    } finally {
      _$_ReitListSettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void enableList(ReitListSortOptionType option) {
    final _$actionInfo = _$_ReitListSettingsStoreBaseActionController
        .startAction(name: '_ReitListSettingsStoreBase.enableList');
    try {
      return super.enableList(option);
    } finally {
      _$_ReitListSettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool disableList(ReitListSortOptionType option) {
    final _$actionInfo = _$_ReitListSettingsStoreBaseActionController
        .startAction(name: '_ReitListSettingsStoreBase.disableList');
    try {
      return super.disableList(option);
    } finally {
      _$_ReitListSettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
enabledLists: ${enabledLists}
    ''';
  }
}
