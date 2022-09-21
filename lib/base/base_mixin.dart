import 'package:base_src/global/app_log.dart';
import 'package:base_src/global/app_text_style.dart';
import 'package:base_src/global/app_theme.dart';
import 'package:get/get.dart';

export 'package:flutter/material.dart';
export 'package:get/get.dart';

mixin BaseMixin {
  AppTheme get color => Get.find<AppThemeBase>().theme;

  AppTextStyle get textStyle => AppTextStyle.share;

  final AppLog log = AppLog.log;

// AppSized get sized => AppSized.share;
}
