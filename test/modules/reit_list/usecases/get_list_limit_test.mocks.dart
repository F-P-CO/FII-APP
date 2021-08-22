// Mocks generated by Mockito 5.0.13 from annotations
// in fii_app/test/modules/reit_list/usecases/get_list_limit_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:fii_app/modules/reit_list/domain/entities/reit_list_sort_option.dart'
    as _i4;
import 'package:fii_app/modules/reit_list/domain/repositories/reit_list_settings_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [ReitListSettingsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockReitListSettingsRepository extends _i1.Mock
    implements _i2.ReitListSettingsRepository {
  MockReitListSettingsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.ReitListSortOptionType>> getEnabledLists() =>
      (super.noSuchMethod(Invocation.method(#getEnabledLists, []),
              returnValue: Future<List<_i4.ReitListSortOptionType>>.value(
                  <_i4.ReitListSortOptionType>[]))
          as _i3.Future<List<_i4.ReitListSortOptionType>>);
  @override
  _i3.Future<bool> saveEnabledLists(List<_i4.ReitListSortOptionType>? lists) =>
      (super.noSuchMethod(Invocation.method(#saveEnabledLists, [lists]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  int getListLimit() =>
      (super.noSuchMethod(Invocation.method(#getListLimit, []), returnValue: 0)
          as int);
  @override
  _i3.Future<bool> saveListLimit(int? limit) =>
      (super.noSuchMethod(Invocation.method(#saveListLimit, [limit]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  String toString() => super.toString();
}
