import 'package:dio/dio.dart';
import 'package:fii_app/core/errors/http_client_exceptions.dart';

class HttpClient {
  final Dio _client;
  Dio get client => _client;

  HttpClient(this._client);

  /// Fowards GET request to Dio.
  ///
  /// Throws [HttpClientException] on [DioError].
  Future<Response> get(String url, {Options? options}) async {
    try {
      return await _client.get(url, options: options);
    } on DioError catch (e) {
      throw HttpClientException(
        message: e.message,
      );
    } on Exception {
      throw HttpClientException();
    }
  }

  /// Fowards POST request to Dio.
  ///
  /// Throws [HttpClientException] on [DioError].
  Future<Response> post(String url, {dynamic body}) async {
    try {
      return await _client.post(url, data: body);
    } on DioError catch (e) {
      throw HttpClientException(message: e.message);
    } on Exception {
      throw HttpClientException();
    }
  }

  /// Fowards PUT request to Dio.
  ///
  /// Throws [HttpClientException] on [DioError].
  Future<Response> put(String url, {dynamic body}) async {
    try {
      return await _client.put(url, data: body);
    } on DioError catch (e) {
      throw HttpClientException(message: e.message);
    } on Exception {
      throw HttpClientException();
    }
  }

  /// Fowards DELETE request to Dio.
  ///
  /// Throws [HttpClientException] on [DioError].
  Future<Response> delete(String url, {dynamic body}) async {
    try {
      return await _client.delete(url);
    } on DioError catch (e) {
      throw HttpClientException(message: e.message);
    } on Exception {
      throw HttpClientException();
    }
  }
}
