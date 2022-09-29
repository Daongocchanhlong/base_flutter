import 'package:base_src/global/app_path.dart';
import 'package:base_src/global/app_theme.dart';
import 'package:base_src/import.dart';

class _Widget with BaseMixin {
  Widget title(String? text) => Text(
        text ?? '',
        style: textStyle.bold(size: 18.0, color: color.black),
      );

  Widget leading(String? title, Function? func) {
    final bool isDisable = title != null;
    if (title != null) {
      return InkWell(
        onTap: () {
          if (isDisable) {
            if (func == null) {
              Get.back();
            } else {
              func();
            }
          }
        },
        child: isDisable
            ? Row(
                children: <Widget>[
                  const Icon(Icons.arrow_back_ios).paddingOnly(left: 15.0),
                  Text(
                    title,
                    style: textStyle.regular(size: 14.0),
                  )
                ],
              )
            : const SizedBox(),
      );
    }
    return Padding(
      padding: EdgeInsets.only(left: 10.width),
      child: Image.asset(AppPath.logo),
    );
  }
}

class AppBarCustom extends AppBar {
  AppBarCustom({
    Key? key,
    required String textTitle,
    String? textLeading,
    double? leadingWidth,
    Widget? actionsWidget,
    Function? backFunction,
  }) : super(
            key: key,
            title: _Widget().title(textTitle),
            leading: _Widget().leading(textLeading, backFunction),
            leadingWidth:
                leadingWidth ?? ((textLeading != null) ? 120.width : 80.width),
            actions: <Widget>[actionsWidget ?? const SizedBox()],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: <Color>[baseColor.yellowBgr, baseColor.orangeBgr]),
              ),
            ));
}
