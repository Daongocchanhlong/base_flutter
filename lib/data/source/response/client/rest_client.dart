// import 'dart:convert';

import 'package:base_src/controller/account_manager.dart';
import 'package:base_src/data/source/response/api_error.dart';
import 'package:base_src/data/source/response/interceptor/loginfo_interceptors.dart';
// import 'package:base_src/data/source/response/interceptor/session_interceptor.dart';
// import 'package:base_src/extension/list.dart';
import 'package:base_src/extension/map_ex.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
// import 'package:get/get_utils/src/extensions/internacionalization.dart';
// import 'package:xml2json/xml2json.dart';

class RestClient {
  RestClient(
    this.baseUrl,
    List<Interceptor>? interceptors, {
    Duration timeout = defaultTimeout,
    String? contentType,
  }) {
    final BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: timeout.inMilliseconds,
      receiveTimeout: timeout.inMilliseconds,
      contentType: contentType ?? formUrlEncodedContentType,
      responseType: ResponseType.json,
    );

    _dio = Dio(options);
    final CookieJar cookieJar = CookieJar();
    _dio.interceptors.add(CookieManager(cookieJar));
    _dio.interceptors.addAll(<Interceptor>[
      // SessionInterceptor(),
      LogInfoInterceptor(),
      ...interceptors ?? <Interceptor>[]
    ]);
    // _dio.interceptors.add(RefreshTokenInterceptor(_dio));
  }

  static const Duration defaultTimeout = Duration(seconds: 30);
  static const String formUrlEncodedContentType =
      'application/json; charset=utf-8';
  final String baseUrl;
  late Dio _dio;

  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response<dynamic> response = await _dio.get<dynamic>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } catch (e) {
      throw _mapError(e);
    }
  }

  Future<dynamic> post(
    String path, {
    dynamic body,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response<dynamic> response = await _dio.post<dynamic>(
        path,
        data: body,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return _mapResponse(response);
    } catch (e) {
      throw _mapError(e);
    }
  }
  
  ApiError _mapError(dynamic e) {
    if (e is DioError) {
      final String? code = e.response?.statusCode.toString();

      switch (e.type) {
        case DioErrorType.sendTimeout:
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.response:
          return ApiError(
              errorCode: code,
              message: 'Có lỗi kết nối đến server. Quý khách vui lòng thử lại');
        case DioErrorType.cancel:
        case DioErrorType.other:
        default:
          return ApiError(
            errorCode: '${e.error}',
            message: 'Có lỗi kết nối đến server. Quý khách vui lòng thử lại',
            extraData: e.response?.data,
          );
      }
    }

    if (e is ApiError) {
      return e;
    }

    return ApiError(
      errorCode: '${e.errorCode}',
      message: 'Có lỗi kết nối đến server. Quý khách vui lòng thử lại',
      extraData: e?.data,
    );
  }

  Map<String, dynamic> _mapResponse(dynamic response) {
    Map<String, dynamic>? data = response['data'];

    if (data == null) {
      throw const ApiError(
          message: 'Có lỗi kết nối đến server. Quý khách vui lòng thử lại');
    }

    final bool? success = data.getData('success') as bool?;
    if (success ?? false) {
      if (AccountManager().isLogin) {
        AccountManager().logOut();
      }

      throw ApiError(errorCode: '500', message: data.getData('message'));
    }

    return data;
  }

  // String _getCode(String? code) =>
  //     (code != null && code.isNotEmpty && !code.contains('null'))
  //         ? '[$code]'
  //         : '';
}
