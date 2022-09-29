import 'package:base_src/config/app_config.dart';

class Config extends BaseConfig {
  @override
  String get baseUrl => 'https://cheatpts-oyama.tk/api/v1/';

  @override
  String get logo => 'assets/images/logo.png';

  @override
  String get logoLogin => 'assets/images/logo_login_fx.png';

  // Default 30s
  @override
  int get websocketRetryInterval => 30;

  // Default 5m
  @override
  int get websocketRetriesNum => 10;
}
