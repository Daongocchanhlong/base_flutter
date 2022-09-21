import 'dart:convert';

import 'package:base_src/global/app_log.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LogInfoInterceptor implements InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      AppLog.log.printError('====================================>>');

      debugPrint(
          '===> [DioError][${err.response?.realUri.path}] ${err.response} <===');
      AppLog.log.printError('<<====================================');
    }

    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLog.log.debugPrint('====================================>>');
    AppLog.log
        .debugPrint('===> ${options.method} ${options.baseUrl}${options.path}');
    debugPrint('===> HEADER: ${options.headers}');

    if (options.data != null) {
      AppLog.log.debugPrint('===> [REQUEST DATA]: ${options.data}');
    } else if (options.queryParameters.isNotEmpty) {
      AppLog.log.debugPrint(
          '===> [REQUEST queryParameters]: ${options.queryParameters}');
    }
    AppLog.log.debugPrint('<<====================================');
    return handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    AppLog.log.printInfo('====================================>>');

    debugPrint(
        '<=== ${response.statusCode} [${response.requestOptions.method}] ${response.requestOptions.baseUrl}${response.requestOptions.path}');
    AppLog.log
        .debugPrint('<=== [RESPONSE DATA]: ${response.requestOptions.data}');

    if (response.data is Map || response.data is List) {
      debugPrint(jsonEncode(response.data));
    } else {
      debugPrint('${response.data}');
    }
    AppLog.log.printInfo('<<====================================');
    return handler.next(response);
  }
}
