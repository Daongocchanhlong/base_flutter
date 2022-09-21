// import 'package:base_src/config/app_config.dart';
// import 'package:base_src/controller/account_manager.dart';
// import 'package:base_src/extension/map_ex.dart';
// import 'package:dio/dio.dart';

// class SessionInterceptor implements InterceptorsWrapper {
//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {
//     return handler.next(err);
//   }

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     if (options.method == 'GET') {
//       return handler.next(options);
//     }
//     final String body = options.data;
//     final Map<String, dynamic> parameters = options.queryParameters;

//     final String header = <String, String>{
//       'Ticket': AccountManager().loginMethod?.authenticationTicket ?? '',
//       'LoginID': AccountManager().loginMethod?.kokyakuCD ?? '',
//       'ChannelID': parameters['ChannelID'] ? AppConfig.config.channelID : '',
//       'ApplicationID': AppConfig.config.applicationID,
//     }.toStringXML(keyInput: parameters['keyInput']);

//     options.data =
//         _baseBody(header: header, body: body, keyInPut: parameters['keyInput']);
//     options.queryParameters = <String, dynamic>{};

//     return handler.next(options);
//   }

//   @override
//   void onResponse(
//       Response<dynamic> response, ResponseInterceptorHandler handler) {
//     return handler.next(response);
//   }
// }

// String _baseBody({
//   required String header,
//   required String body,
//   required String keyInPut,
// }) {
//   String soapenvLink = 'http://schemas.xmlsoap.org/response/envelope/';
//   String keySoap = 'soapenv';
//   String keyInputLink = 'http://unisys.co.jp/TIFFE/FX/T4FXWebService';

//   if (keyInPut == 'tem') {
//     soapenvLink = 'http://www.w3.org/2003/05/response-envelope';
//     keySoap = 'response';
//     keyInputLink = 'http://tempuri.org/';
//   }

//   return '''
//   <keySoap:Envelope xmlns:keySoap="soapenvLink" xmlns:keyInput="inputLink">
//     <keySoap:Header>
//       <keyInput:FxHeader>
//          $header
//       </keyInput:FxHeader>
//     </keySoap:Header>
//     <keySoap:Body>
//       $body
//     </keySoap:Body>
//   </keySoap:Envelope>'''
//       .replaceAll('&lt;', '<')
//       .replaceAll('keyInput', keyInPut)
//       .replaceAll('soapenvLink', soapenvLink)
//       .replaceAll('inputLink', keyInputLink)
//       .replaceAll('keySoap', keySoap);
// }
