import 'package:base_src/data/source/response/client/api_client.dart';
import 'package:base_src/domain/model/login_method/login.dart';
import 'package:base_src/domain/model/login_method/login_result.dart';

abstract class ApiRepository {
  APIClient client = APIClient();
  Future<LoginMethodResult> login(LoginMethod params);
}
