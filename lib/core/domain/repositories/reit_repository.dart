import 'package:dartz/dartz.dart';
import 'package:fii_app/core/errors/failures.dart';

import '../entities/reit.dart';

abstract class ReitRepository {
  Future<Either<Failure, List<Reit>>> getAll();
}
