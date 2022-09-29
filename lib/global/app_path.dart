import 'package:base_src/config/app_config.dart';
import 'package:base_src/import.dart';

class AppPath with BaseMixin {
  static String get logo => AppConfig.config.logo;

  static String get logoLogin => AppConfig.config.logoLogin;

  static String get iconMenu => 'assets/images/list.png';

  static String get iconLearn => 'assets/images/learn.png';
  static String get iconExam => 'assets/images/exam.png';

}
