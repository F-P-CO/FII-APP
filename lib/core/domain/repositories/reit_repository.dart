import '../entities/reit.dart';

abstract class ReitRepository {
  Future<List<Reit>> getAll();
}
