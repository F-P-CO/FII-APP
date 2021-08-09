// Mocks generated by Mockito 5.0.13 from annotations
// in fii_app/test/modules/reit_list/presentation/stores/reit_list_store_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:either_dart/either.dart' as _i3;
import 'package:fii_app/core/domain/entities/reit.dart' as _i7;
import 'package:fii_app/core/domain/repositories/reit_repository.dart' as _i2;
import 'package:fii_app/core/errors/failures.dart' as _i6;
import 'package:fii_app/modules/reit_list/domain/usecases/get_all_reits.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeReitRepository extends _i1.Fake implements _i2.ReitRepository {}

class _FakeEither<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [GetAllReits].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAllReits extends _i1.Mock implements _i4.GetAllReits {
  MockGetAllReits() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ReitRepository get reitRepository =>
      (super.noSuchMethod(Invocation.getter(#reitRepository),
          returnValue: _FakeReitRepository()) as _i2.ReitRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.Reit>>> call() =>
      (super.noSuchMethod(Invocation.method(#call, []),
          returnValue: Future<_i3.Either<_i6.Failure, List<_i7.Reit>>>.value(
              _FakeEither<_i6.Failure, List<_i7.Reit>>())) as _i5
          .Future<_i3.Either<_i6.Failure, List<_i7.Reit>>>);
  @override
  String toString() => super.toString();
}