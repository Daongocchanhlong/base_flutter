import 'package:base_src/domain/model/login_method/login.dart';
import 'package:base_src/domain/model/login_method/login_result.dart';
import 'package:base_src/domain/use_case/Login/login_use_case.dart';
import 'package:base_src/import.dart';

class LoginCtrl extends BaseController {
  // use case
  final LoginUseCase _useCase = LoginUseCase();

  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPass = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
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
}
