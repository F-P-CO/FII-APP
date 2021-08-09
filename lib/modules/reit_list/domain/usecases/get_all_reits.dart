import 'package:either_dart/either.dart';
import 'package:fii_app/core/errors/failures.dart';
import 'package:fii_app/core/domain/entities/reit.dart';
import 'package:fii_app/core/domain/repositories/reit_repository.dart';

class GetAllReits {
  final ReitRepository reitRepository;

  GetAllReits({required this.reitRepository});

  Future<Either<Failure, List<Reit>>> call() async {
    final reits = await reitRepository.getAll();
    return reits;
  }
}
