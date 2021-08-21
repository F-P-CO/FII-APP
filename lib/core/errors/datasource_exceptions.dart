// General
class ServerException implements Exception {
  final String? message;

  ServerException({this.message});
}

// Reit List Datasource
class NoTableRankingException implements Exception {}

class NoTbodyTrException implements Exception {}

// Local Datasources
class DataNotFoundException implements Exception {}
