import 'package:base_src/global/app_theme.dart';
import 'package:base_src/import.dart';
import 'package:base_src/page/login/login_ctrl.dart';
import 'package:base_src/widget/button.dart';
import 'package:base_src/widget/check_box.dart';
import 'package:base_src/widget/text_field/input_price.dart';

class LoginPage extends BaseScreen<LoginCtrl> {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget builder() => Scaffold(
        backgroundColor: baseColor.black,
        body: Center(child: _buildBody()),
      );

  @override
  LoginCtrl? putController() => LoginCtrl();

  Widget _buildBody() => ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: <Widget>[
          _buildLoginForm(),
          const SizedBox(height: 16),
          Obx(() => BaseCheckBox(
                value: controller.isSaveLogin.value,
                label: 'Save Login',
                onChange: () => controller.isSaveLogin.value =
                    !controller.isSaveLogin.value,
              )),
          const SizedBox(height: 16),
          BaseButton(
            onPressed: () => controller.submitLogin(),
            colors: <Color>[baseColor.red, baseColor.red10],
            label: 'Click',
          )
        ],
      );

  Column _buildLoginForm() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildText('Email'),
          const SizedBox(height: 4),
          // BaseInput(textEditingController: controller.txtEmail),
          PriceWidget(
            textEditingController: controller.txtEmail,
            focusNodeCurrent: controller.emailFocusNode,
            visible: false,
          ),
          const SizedBox(height: 8),
          _buildText('Password'),
          const SizedBox(height: 4),
          // BaseInput(textEditingController: controller.txtPass),
          const SizedBox(height: 4),
        ],
      );

  Text _buildText(String text) => Text(
        text,
        style: textStyle.regular(size: 16, color: baseColor.white),
      );
}
