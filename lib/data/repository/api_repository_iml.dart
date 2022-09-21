import 'package:base_src/data/source/response/url/url.dart';
import 'package:base_src/domain/model/login_method/login_result.dart';
import 'package:base_src/domain/model/login_method/login.dart';
import 'package:base_src/domain/repository/api_repository.dart';

class ApiRepositoryiml extends ApiRepository {
  @override
  Future<LoginMethodResult> login(LoginMethod params) async {
    final Map<String, dynamic> response = await client.post(
      Url().login,
      body: params.toJson,
    );
    return LoginMethodResult.fromMap(response);
  }
}
