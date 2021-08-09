import 'package:either_dart/either.dart';
import 'package:fii_app/core/errors/datasource_exceptions.dart';
import 'package:fii_app/core/errors/failures.dart';

import '../../domain/entities/reit.dart';
import '../../domain/repositories/reit_repository.dart';
import '../datasources/reit_data_source.dart';

class ReitRepository {
  final ReitDataSource datasource;

  ReitRepository({required this.datasource});

  @override
  Future<Either<Failure, List<Reit>>> getAll() async {
    try {
      final reits = await datasource.getAll();
      return Right(reits);
    } on ServerException catch (e) {
      return Left(ServerFailure(exception: e));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(exception: e));
    }
  }
}
