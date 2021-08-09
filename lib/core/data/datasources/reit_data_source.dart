import '../models/reit_model.dart';

abstract class ReitDataSource {
  /// Calls API endpoint for fetching all Reits.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<ReitModel>> getAll();
}
