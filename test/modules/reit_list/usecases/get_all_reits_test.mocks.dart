// Mocks generated by Mockito 5.0.13 from annotations
// in fii_app/test/modules/reit_list/usecases/get_all_reits_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:fii_app/core/domain/entities/reit.dart' as _i6;
import 'package:fii_app/core/domain/repositories/reit_repository.dart' as _i3;
import 'package:fii_app/core/errors/failures.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [ReitRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockReitRepository extends _i1.Mock implements _i3.ReitRepository {
  MockReitRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Reit>>> getAll() =>
      (super.noSuchMethod(Invocation.method(#getAll, []),
          returnValue: Future<_i2.Either<_i5.Failure, List<_i6.Reit>>>.value(
              _FakeEither<_i5.Failure, List<_i6.Reit>>())) as _i4
          .Future<_i2.Either<_i5.Failure, List<_i6.Reit>>>);
  @override
  String toString() => super.toString();
}
