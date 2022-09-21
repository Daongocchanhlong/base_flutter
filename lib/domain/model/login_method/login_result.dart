import 'package:base_src/extension/map_ex.dart';

class LoginMethodResult {
  LoginMethodResult({
    this.userId,
    this.username,
    this.token,
  });

  factory LoginMethodResult.fromMap(Map<String, dynamic> map) =>
      LoginMethodResult(
        userId: map.getData('userId') as String?,
        username: map.getData('username') as String?,
        token: map.getData('token') as String?,
      );

  String? userId;
  String? username;
  String? token;
}
