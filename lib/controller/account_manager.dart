// import 'package:base_src/controller/global_manager.dart';
// import 'package:base_src/data/source/storage/base_storage.dart';
import 'package:base_src/domain/model/login_method/login_result.dart';
// import 'package:base_src/global/app_const.dart';
// import 'package:base_src/global/app_log.dart';
import 'package:base_src/global/app_router.dart';
import 'package:base_src/import.dart';

class AccountManager {
  factory AccountManager() {
    return _singleton;
  }

  AccountManager._internal();

  static final AccountManager _singleton = AccountManager._internal();
  // final BaseStorage _storage = BaseStorage();

  LoginMethodResult? loginMethod;

  void login({required LoginMethodResult? data}) {
    loginMethod = data;
  }

  void loginView() {}

  bool get isLogin => loginMethod != null;

  void logOut() {
    loginMethod = null;
    Get.offAllNamed(AppRouter.routerLogin);
  }
}
