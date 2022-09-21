import 'package:base_src/config/config.dart';

class AppConfig {
  static late BaseConfig config;

  static void setEverionment() {
    config = Config();
  }
}

abstract class BaseConfig {
  String get baseUrl;

  String get logo;

  String get logoLogin;

  // Default 30s
  int get websocketRetryInterval;

  // Default 10 times
  int get websocketRetriesNum;
}
