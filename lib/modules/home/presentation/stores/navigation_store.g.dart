// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NavigationStore on _NavigationStoreBase, Store {
  final _$pagesAtom = Atom(name: '_NavigationStoreBase.pages');

  @override
  List<AppPage> get pages {
    _$pagesAtom.reportRead();
    return super.pages;
  }

  @override
  set pages(List<AppPage> value) {
    _$pagesAtom.reportWrite(value, super.pages, () {
      super.pages = value;
    });
  }

  final _$currentPageIndexAtom =
      Atom(name: '_NavigationStoreBase.currentPageIndex');

  @override
  int get currentPageIndex {
    _$currentPageIndexAtom.reportRead();
    return super.currentPageIndex;
  }

  @override
  set currentPageIndex(int value) {
    _$currentPageIndexAtom.reportWrite(value, super.currentPageIndex, () {
      super.currentPageIndex = value;
    });
  }

  final _$_NavigationStoreBaseActionController =
      ActionController(name: '_NavigationStoreBase');

  @override
  int changePage(int index) {
    final _$actionInfo = _$_NavigationStoreBaseActionController.startAction(
        name: '_NavigationStoreBase.changePage');
    try {
      return super.changePage(index);
    } finally {
      _$_NavigationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pages: ${pages},
currentPageIndex: ${currentPageIndex}
    ''';
  }
}
