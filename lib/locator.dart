import 'package:base_src/controller/global_manager.dart';
import 'package:base_src/global/app_theme.dart';
import 'package:base_src/import.dart';

Future<void> setupLocator() async {
  GlobalManager();
  Get.put<AppThemeBase>(AppThemeBase());
}
