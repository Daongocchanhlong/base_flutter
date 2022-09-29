import 'package:base_src/generated/locales.g.dart';
import 'package:base_src/global/app_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalizationService extends Translations {
  static Locale get locale => _getLocaleFromLanguage();

  static List<Locale> locales = <Locale>[
    const Locale(AppConst.langVI, ''),
    const Locale(AppConst.langEN, ''),
  ];

// fallbackLocale là locale default nếu locale được set không nằm trong những Locale support
  static const Locale fallbackLocale = Locale(AppConst.langVI);

  @override
  Map<String, Map<String, String>> get keys => <String, Map<String, String>>{
        AppConst.langEN: Locales.en,
        AppConst.langVI: Locales.vi
      };

  static Future<void> changeLocale(String langCode) async {
    GetStorage().write(AppConst.langID, langCode);
    await Get.updateLocale(Locale(langCode));
  }

  static Locale _getLocaleFromLanguage() {
    final String? langCode = GetStorage().read<String?>(AppConst.langID);
    return Locale(langCode ?? AppConst.langVI);
  }
}
