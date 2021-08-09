class NoTableRankingException implements Exception {}

class NoTbodyTrException implements Exception {}

class ServerException implements Exception {
  final String? message;

  ServerException({this.message});
}
