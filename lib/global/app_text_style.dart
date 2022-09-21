import 'package:base_src/import.dart';

import 'app_theme.dart';

class AppTextStyle {
  static final AppTextStyle share = AppTextStyle();

  TextStyle bold({
    double? size,
    Color? color,
    Color? backgroundColor,
  }) =>
      custom(
          fontFamily: 'Roboto-Bold',
          size: size,
          color: color,
          fontWeight: FontWeight.w700,
          backgroundColor: backgroundColor);

  TextStyle semiBold({
    double? size,
    Color? color,
    Color? backgroundColor,
  }) =>
      custom(
          fontFamily: 'Roboto-Bold',
          size: size,
          color: color,
          fontWeight: FontWeight.w600,
          backgroundColor: backgroundColor);

  TextStyle medium({
    double? size,
    Color? color,
    Color? backgroundColor,
  }) =>
      custom(
          fontFamily: 'Roboto-Medium',
          size: size,
          color: color,
          fontWeight: FontWeight.w500,
          backgroundColor: backgroundColor);

  TextStyle regular({
    double? size,
    Color? color,
    Color? backgroundColor,
  }) =>
      custom(
          fontFamily: 'Roboto-Regular',
          size: size,
          color: color,
          fontWeight: FontWeight.w400,
          backgroundColor: backgroundColor);

  TextStyle custom(
      {double? size,
      Color? color,
      Color? backgroundColor,
      FontWeight? fontWeight,
      FontStyle? fontStyle,
      String fontFamily = 'Roboto-Regular'}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      backgroundColor: backgroundColor,
      fontSize: size ?? 12,
      color: color ?? baseColor.black,
    );
  }

// String getFontFamily(FontWeight? fontWeight) {
//   switch (fontWeight) {
//     case FontWeight.w500:
//       return 'Inter500';
//     case FontWeight.w600:
//       return 'Inter600';
//     case FontWeight.w700:
//       return 'Inter700';
//     case FontWeight.w400:
//     default:
//       return 'Inter400';
//   }
// }
}
