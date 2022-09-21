import 'package:base_src/config/app_config.dart';
import 'package:base_src/import.dart';

class AppPath with BaseMixin {
  static const String icChart = 'assets/icons/ic_chart.svg';
  static const String icInquiry = 'assets/icons/ic_inquiry.svg';
  static const String icOther = 'assets/icons/ic_other.svg';
  static const String icRateList = 'assets/icons/ic_rate_list.svg';
  static const String icTransaction = 'assets/icons/ic_transaction.svg';
  static const String icExternalLink = 'assets/icons/ic_external_link.svg';

  static String icFlags(String symbol) =>
      'assets/icons/flag/${symbol.replaceAll('/', '_').toLowerCase()}.svg';

  static const String orderList = 'assets/icons/ic_order_list.svg';
  static const String openList = 'assets/icons/ic_open_list.svg';
  static const String orderHistory = 'assets/icons/ic_order_history.svg';
  static const String contactHistory = 'assets/icons/ic_contact_history.svg';
  static const String marginStatus = 'assets/icons/ic_margin_status.svg';
  static const String instructionCancellation =
      'assets/icons/ic_instruction_cancellation.svg';
  static const String priceList = 'assets/icons/ic_price_list.svg';
  static const String productInfo = 'assets/icons/ic_product_info.svg';
  static const String swapPoint = 'assets/icons/ic_swap_point.svg';
  static const String icFilter = 'assets/icons/ic_filter.svg';
  static const String icArrowDown = 'assets/icons/ic_arrow_down.svg';
  static const String icArrowUp = 'assets/icons/ic_arrow_up.svg';

  static const String icSelect = 'assets/icons/ic_select.svg';

  static String get logo => AppConfig.config.logo;

  static String get logoLogin => AppConfig.config.logoLogin;
}
