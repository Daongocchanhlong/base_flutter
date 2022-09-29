import 'package:base_src/page/home/home_page.dart';
import 'package:base_src/page/list/list_page.dart';
import 'package:base_src/page/login/login_page.dart';
import 'package:base_src/page/register/register_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRouter {
  static const String routerLogin = '/login';
  static const String routerRegister = '/register';
  static const String routerHome = '/home';
  static const String routerList = '/list';

  static List<GetPage<dynamic>> getPages = <GetPage<dynamic>>[
    GetPage<LoginPage>(
      name: routerLogin,
      page: () => LoginPage(),
    ),
    GetPage<RegisterPage>(
      name: routerRegister,
      page: () => RegisterPage(),
    ),
    GetPage<HomePage>(
      name: routerHome,
      page: () => HomePage(),
    ),
    GetPage<ListPage>(
      name: routerList,
      page: () => ListPage(),
    ),
  ];
}
