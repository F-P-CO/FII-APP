import '../../domain/entities/reit.dart';
import '../../domain/repositories/reit_repository.dart';
import '../datasources/reit_data_source.dart';

class DefaultReitRepository implements ReitRepository {
  final ReitDataSource datasource;

  DefaultReitRepository({required this.datasource});

  @override
  Future<List<Reit>> getAll() async {
    final reits = await datasource.getAll();
    return reits;
  }
}
