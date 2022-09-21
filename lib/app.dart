// import 'package:base_src/data/source/firebase/firebase_manager.dart';
import 'package:base_src/global/app_router.dart';
// import 'package:base_src/global/app_router.dart';
import 'package:base_src/global/app_theme.dart';
import 'package:base_src/import.dart';
import 'package:base_src/utils/localization_service.dart';
import 'package:base_src/widget/bottom_main/bottom_main.dart';
// import 'package:base_src/widget/bottom_main/bottom_main.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with BaseMixin {
  @override
  void initState() {
    _bind();
    super.initState();
  }

  Future<void> _bind() async {
    // FirebaseManager.share.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      translations: LocalizationService(),
      translationsKeys: AppTranslation.translations,
      locale: LocalizationService.locale,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: LocalizationService.locales,
      fallbackLocale: LocalizationService.fallbackLocale,
      color: color.black,
      debugShowCheckedModeBanner: false,
      title: 'Base Src',
      theme: Get.find<AppThemeBase>().themeData,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: BottomMainPage(child),
        );
      },
      initialRoute: AppRouter.routerLogin,
      getPages: AppRouter.getPages,
    );
  }
}
