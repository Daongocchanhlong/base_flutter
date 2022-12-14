import 'package:base_src/domain/model/login_method/login.dart';
import 'package:base_src/domain/model/login_method/login_result.dart';
import 'package:base_src/domain/use_case/Login/login_use_case.dart';
import 'package:base_src/global/app_enum.dart';
import 'package:base_src/global/app_router.dart';
import 'package:base_src/import.dart';

class LoginCtrl extends BaseController {
  // use case
  final LoginUseCase _useCase = LoginUseCase();

  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPass = TextEditingController();
  RxBool isHiddenPassword = RxBool(true);
  RxBool isSaveLogin = RxBool(false);

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {}

  Future<void> submitLogin() async {
    showLoading();
    await _useCase.login(
      param: LoginMethod(
        userName: txtEmail.text,
        password: txtPass.text,
      ),
      onSuccess: (LoginMethodResult data) {
        hideLoading();
      },
      onFailure: (dynamic error) {
        hideLoading();
      },
    );
  }

  void onPress(TypePress type) {
    switch (type) {
      case TypePress.login:
        // submitLogin();
        Get.offAndToNamed(AppRouter.routerHome);
        break;
      case TypePress.register:
        Get.offAndToNamed(AppRouter.routerRegister);
        break;
      case TypePress.forgotPass:
        break;
    }
  }
}
