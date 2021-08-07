import 'package:dio/dio.dart';
import 'package:fii_app/shared/interfaces/http_service_interface.dart';

class AppHttpService implements HttpService {
  @override
  final Dio client = Dio();
}
