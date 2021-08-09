import '../../../../core/domain/entities/reit.dart';
import '../../../../core/domain/repositories/reit_repository.dart';

class GetAllReits {
  final ReitRepository reitRepository;

  GetAllReits({required this.reitRepository});

  Future<List<Reit>> call() async {
    final reits = await reitRepository.getAll();
    return reits;
  }
}
