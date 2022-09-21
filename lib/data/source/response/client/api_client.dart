import 'package:base_src/config/app_config.dart';
import 'package:base_src/data/source/response/client/rest_client.dart';
import 'package:dio/dio.dart';

class APIClient extends RestClient {
  factory APIClient() {
    _singleton ??=
        APIClient._internal(AppConfig.config.baseUrl, interceptors: null);
    return _singleton!;
  }

  APIClient._internal(String baseUrl, {List<Interceptor>? interceptors})
      : super(baseUrl, interceptors);

  static APIClient? _singleton;
}
