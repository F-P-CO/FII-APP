import 'package:dio/dio.dart';
import 'package:fii_app/shared/interfaces/http_service_interface.dart';
import 'package:get_it/get_it.dart';

Dio useHttpService() {
  final dio = GetIt.I.get<HttpService>().client as Dio;

  return dio;
}
