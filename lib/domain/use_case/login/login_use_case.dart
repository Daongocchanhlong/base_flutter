import 'package:base_src/controller/account_manager.dart';
import 'package:base_src/data/repository/api_repository_iml.dart';
import 'package:base_src/domain/model/login_method/login.dart';
import 'package:base_src/domain/model/login_method/login_result.dart';
import 'package:base_src/domain/repository/api_repository.dart';
import 'package:base_src/global/app_const.dart';
import 'package:get_storage/get_storage.dart';

class LoginUseCase {
  final ApiRepository _repository = ApiRepositoryiml();
  // final AccountManager _accountManager = AccountManager();

  Future<void> login(
      {required LoginMethod param,
      required Function(LoginMethodResult data) onSuccess,
      required Function(dynamic error) onFailure,
      bool saveLogin = false}) async {
    try {
      // login
      final LoginMethodResult data = await _repository.login(param);
      AccountManager().login(data: data);
      if (saveLogin) {
        saveData(param.userName, param.password);
      } else {
        cleanData();
      }
      AccountManager().loginView();
      onSuccess(data);
    } catch (error) {
      onFailure(error);
    }
  }

  Future<void> saveData(String? userName, String? pass) async {
    GetStorage().write(AppConst.keyLoginID, userName ?? '');
    GetStorage().write(AppConst.keyPasswordCD, pass ?? '');
  }

  Future<void> cleanData() async {
    GetStorage().write(AppConst.keyLoginID, '');
    GetStorage().write(AppConst.keyPasswordCD, '');
  }

  // Future<void> changePassword({
  //   required PasswordHenkoMethod param,
  //   required Function(PasswordHenkoMethodResult data) onSuccess,
  //   required Function(dynamic error) onFailure,
  // }) async {
  //   try {
  //     final PasswordHenkoMethodResult data =
  //         await _repository.passwordHenkoWebService(
  //       param: param,
  //     );
  //     onSuccess(data);
  //   } catch (error) {
  //     onFailure(error);
  //   }
  // }
}
