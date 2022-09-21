import 'dart:async';

import 'package:base_src/app.dart';
import 'package:base_src/config/app_config.dart';
import 'package:base_src/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

class BaseRunMain {
  static Future<void> runMainApp() async {
    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations(
          <DeviceOrientation>[DeviceOrientation.portraitUp]);

      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light));

      await GetStorage.init();
      AppConfig.setEverionment();

      await setupLocator();
      runApp(const App());
    }, (Object error, StackTrace stackTrace) {});
  }
}
