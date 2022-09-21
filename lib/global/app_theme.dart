import 'package:base_src/global/app_color_base.dart';
import 'package:base_src/global/app_const.dart';
import 'package:base_src/global/app_theme_black.dart';
import 'package:base_src/global/app_theme_bright.dart';

import 'package:base_src/import.dart';
import 'package:get_storage/get_storage.dart';

enum AppThemeType { black, bright }

AppTheme baseColor = AppThemeBlack();

abstract class AppTheme with AppColorBase {
  ThemeData get theme;
}

class AppThemeBase {
  AppThemeBase() {
    ever(_appTheme, (AppThemeType type) {
      baseColor = theme;

      Get.changeTheme(theme.theme);
      Get.forceAppUpdate();
    });

    _initThemeModeFromSharedPrefs();
  }

  static final Rx<AppThemeType> _appTheme = AppThemeType.black.obs;

  AppThemeType get appTheme => _appTheme.value;

  AppTheme get theme =>
      appTheme == AppThemeType.black ? AppThemeBlack() : AppThemeBright();

  ThemeData get themeData => theme.theme;

  void changeAppTheme(AppThemeType appThemeType) {
    saveThemeModeInSharedPrefs(appThemeType);
  }

  Future<void> _initThemeModeFromSharedPrefs() async {
    final String? themeModeFromPrefs = GetStorage().read(AppConst.keyThemeMode);

    _appTheme.value = themeModeFromPrefs == null ||
            themeModeFromPrefs == AppThemeType.black.toString()
        ? AppThemeType.black
        : AppThemeType.bright;

    baseColor = theme;
  }

  static Future<void> saveThemeModeInSharedPrefs(AppThemeType type) async {
    if (_appTheme.value != type) {
      _appTheme.value = type;
      GetStorage().write(AppConst.keyThemeMode, type.toString());
    }
  }
}
