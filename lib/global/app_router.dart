import 'package:base_src/page/login/login_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRouter {
  static const String routerLogin = '/login';
  static const String routerHome = '/home';
  static const String routerSetupRateList = '/setupRateList';
  static const String routerNotice = '/notice';
  static const String routerNoticeDetail = '/noticeDetail';
  static const String routerSetting = '/setting';
  static const String routerPriceList = '/priceList';
  static const String routerContractHistory = '/contractHistory';
  static const String routerOrderHistory = '/orderHistory';
  static const String routerChangePassword = '/changePassword';
  static const String routerProductInfo = '/productInfo';
  static const String routerMarginStatus = '/marginStatus';
  static const String routerOpenList = '/openList';
  static const String routerSwapPoint = '/swapPoint';
  static const String routerInterestRate = '/interestRate';
  static const String routerSettingChart = '/settingChart';
  static const String routerWithdraw = '/withdraw';
  static const String routerWithdrawConfirm = '/withdrawConfirm';
  static const String routerWithdrawConfirmStepTwo = '/withdrawConfirmStepTwo';
  static const String routerOrderList = '/orderList';
  static const String routerComfirmOrder = '/comfirmOrder';
  static const String routerOrderSuccess = '/orderSuccess';
  static const String routerChangeOpenSuccess = '/changeOpenSuccess';
  static const String routerPaymentOrderConfirm = '/paymentOrderConfirm';
  static const String routerChangeOpenInteresting = '/changeOpenInteresting';
  static const String routerConfirmChangeOpenInteresting =
      '/confirmChangeOpenInteresting';
  static const String routerChangeOrder = '/changeOrder';
  static const String routerTransaction = '/transaction';
  static const String routerDetailOrderList = '/detailOrderList';

  static List<GetPage<dynamic>> getPages = <GetPage<dynamic>>[
    GetPage<LoginPage>(
      name: routerLogin,
      page: () => LoginPage(),
    ),
  ];
}
