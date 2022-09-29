import 'package:base_src/global/app_theme.dart';
import 'package:base_src/import.dart';
import 'package:flutter/services.dart';

class BaseInput extends BaseWidget<BaseController> {
  BaseInput({
    Key? key,
    @required this.textEditingController,
    this.inputType,
    this.icon,
    this.fillColor,
    this.borderColor,
    this.hintColor,
    this.hintText,
    this.height,
    this.onChange,
    this.onHidden,
    this.isHidden = false,
    this.inputFormatters,
    this.maxLength,
    this.maxLine,
    this.obscureText,
    this.readOnly,
    this.suffixIcon,
    this.borderRadius,
    this.paddingContent,
    this.width,
    this.label,
    this.enabled,
    this.textAlign,
    this.textColor,
    this.scrollPadding,
    this.textSize,
    this.fontWeight,
  }) : super(key: key);

  final TextEditingController? textEditingController;
  final TextInputType? inputType;
  final Widget? icon;
  final Color? fillColor;
  final Color? borderColor;
  final Color? hintColor;
  final String? hintText;
  final Function(String value)? onChange;
  final Function()? onHidden;
  final double? height;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? maxLine;
  final bool? obscureText;
  final bool isHidden;
  final bool? readOnly;
  final Widget? suffixIcon;
  final BorderRadius? borderRadius;
  final EdgeInsets? paddingContent;
  final String? label;
  final double? width;
  final bool? enabled;
  final TextAlign? textAlign;
  final Color? textColor;
  final EdgeInsets? scrollPadding;
  final double? textSize;
  final FontWeight? fontWeight;

  @override
  Widget builder() {
    return SizedBox(
      height: height ?? 40,
      child: TextField(
          textAlign: textAlign ?? TextAlign.start,
          controller: textEditingController,
          keyboardType: inputType ?? TextInputType.visiblePassword,
          onChanged: onChange,
          style: TextStyle(
              color: textColor ?? Colors.black,
              fontSize: textSize ?? 15,
              fontWeight: fontWeight ?? FontWeight.normal),
          obscureText: isHidden,
          inputFormatters: inputFormatters ?? <TextInputFormatter>[],
          decoration: InputDecoration(
            counterText: '',
            suffixIcon: onHidden != null
                ? IconButton(
                    onPressed: onHidden,
                    color: baseColor.black.withOpacity(0.8),
                    icon: Icon(
                      isHidden ? Icons.visibility : Icons.visibility_off,
                    ))
                : null,
            fillColor: fillColor ?? baseColor.white,
            filled: true,
            contentPadding: paddingContent ??
                const EdgeInsets.only(top: 10, left: 10, bottom: 8),
            enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(5),
                borderSide: BorderSide(
                    color: borderColor ?? baseColor.white, width: 1.0)),
            disabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(5),
                borderSide: BorderSide(
                    color: borderColor ?? baseColor.white, width: 1.0)),
            focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(5),
                borderSide: BorderSide(
                    color: borderColor ?? baseColor.white, width: 1.0)),
            hintStyle: TextStyle(color: hintColor ?? baseColor.black),
            hintText: hintText,
          )),
    );
  }
}
