import 'package:fii_app/shared/datasources/funds_explorer_datasource.dart';
import 'package:fii_app/shared/models/reit.dart';
import 'package:get_it/get_it.dart';

abstract class IReitRepository {
  Future<List<Reit>> getAll();
}

class ReitRepository implements IReitRepository {
  final datasource = GetIt.I.get<FundsExplorerDatasource>();

  @override
  Future<List<Reit>> getAll() async {
    final reits = await datasource.getAll();
    return reits;
  }
}
