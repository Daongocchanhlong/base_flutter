import 'package:base_src/import.dart';

class BaseButton extends BaseWidget<BaseController> {
  BaseButton({
    Key? key,
    @required this.onPressed,
    this.label,
    this.colorButton,
    this.colorText,
    this.rounded = false,
    this.width,
    this.height,
    this.textSize,
    this.padding,
    this.colors,
    this.gradientColor,
    this.border,
  }) : super(key: key);

  final Function? onPressed;
  final String? label;
  final Color? colorButton;
  final Color? colorText;
  final bool rounded;
  final double? width;
  final double? textSize;
  final double? height;
  final double? padding;
  final List<Color>? colors;
  final LinearGradient? gradientColor;
  final Border? border;

  @override
  Widget builder() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: border,
        gradient: gradientColor ??
            LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: colors ??
                  <Color>[
                    color.transparent,
                    color.transparent,
                  ],
            ),
      ),
      height: height ?? 44,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                colorButton ?? color.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(rounded ? 25 : 5),
            ))),
        onPressed: () {
          onPressed!();
        },
        child: Text(
          label ?? '',
          style: textStyle.regular(
              size: textSize ?? 16, color: colorText ?? color.white),
        ),
      ),
    );
  }
}
