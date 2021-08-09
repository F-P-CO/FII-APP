import 'package:dio/dio.dart';

class HttpClient {
  final Dio _client;
  Dio get client => _client;

  HttpClient(this._client);

  Future<Response> get(String url, {Options? options}) =>
      _client.get(url, options: options);

  Future<Response> post(String url, {dynamic body}) =>
      _client.post(url, data: body);

  Future<Response> put(String url, {dynamic body}) =>
      _client.put(url, data: body);

  Future<Response> delete(String url, {dynamic body}) => _client.delete(url);
}
