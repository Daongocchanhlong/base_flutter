import 'package:base_src/global/app_enum.dart';
import 'package:base_src/global/app_path.dart';
import 'package:base_src/import.dart';
import 'package:base_src/page/register/register_ctrl.dart';
import 'package:base_src/widget/button.dart';
import 'package:base_src/widget/check_box.dart';
import 'package:base_src/widget/input_text.dart';

class RegisterPage extends BaseScreen<RegisterCtrl> {
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget builder() => Scaffold(
        body: _buildBody(),
      );

  @override
  RegisterCtrl? putController() => RegisterCtrl();

  Widget _buildBody() => Container(
        height: 1.getHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: <Color>[
              color.white,
              color.orangeBgr,
            ],
          ),
        ),
        child: Center(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            children: <Widget>[
              _buildLogo(),
              const SizedBox(height: 64),
              _buildLoginForm(),
              const SizedBox(height: 8),
              _buildSaveAndForgot(),
              const SizedBox(height: 56),
              BaseButton(
                onPressed: () => controller.submitLogin(),
                label: LocaleKeys.register_title.tr,
                colorButton: color.yellowBgr,
                colorText: color.green,
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.login_msgHaveAccount.tr,
                    style: textStyle.regular(
                      size: 14,
                      color: color.white,
                    ),
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      LocaleKeys.login_title.tr,
                      style: textStyle.custom(
                          size: 14,
                          color: color.green,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      );

  Widget _buildLogo() => Image(
        image: AssetImage(
          AppPath.logo,
        ),
      );

  Widget _buildSaveAndForgot() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() => BaseCheckBox(
                value: controller.isSaveLogin.value,
                label: 'Đồng ý với các điều khoản',
                onChange: () => controller.isSaveLogin.value =
                    !controller.isSaveLogin.value,
                type: TypeCheckBox.square,
                size: 10,
              )),
        ],
      );

  Column _buildLoginForm() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildText(LocaleKeys.login_userEmail.tr, controller.txtEmail),
          const SizedBox(height: 8),
          Obx(() => _buildText(LocaleKeys.login_password.tr, controller.txtPass,
                  icon: Icons.lock,
                  isHidden: controller.isHiddenPassword.value, onHidden: () {
                controller.isHiddenPassword.value =
                    !controller.isHiddenPassword.value;
              })),
          const SizedBox(height: 8),
          Obx(() => _buildText(
                  LocaleKeys.register_password.tr, controller.txtRePass,
                  icon: Icons.lock,
                  isHidden: controller.isHiddenPassword.value, onHidden: () {
                controller.isHiddenPassword.value =
                    !controller.isHiddenPassword.value;
              })),
        ],
      );

  Widget _buildText(String text, TextEditingController txtControler,
          {bool isHidden = false,
          IconData icon = Icons.person,
          Function()? onHidden}) =>
      Row(
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: color.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5))),
            child: Icon(
              icon,
              size: 20,
              color: color.black,
            ),
          ),
          const SizedBox(width: 4.0),
          Expanded(
            child: BaseInput(
              textEditingController: txtControler,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
              hintText: text,
              isHidden: isHidden,
              onHidden: onHidden,
            ),
          )
        ],
      );
}
