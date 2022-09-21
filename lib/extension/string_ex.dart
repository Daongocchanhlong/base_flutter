import 'package:base_src/config/app_config.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

extension StringEx on String {
  String get urlSoap => '${AppConfig.config.baseUrl}$this';

  bool get isString => RegExp('[a-zA-Z]').hasMatch(this);

  int get intFromHEX {
    return int.parse(this, radix: 16);
  }

  // yyyyMMddhhmmssSSS
  DateTime get toDateyyyyMMddhhmmssSSS {
    return DateFormat('yyyyMMddhhmmssSSS').parse(this);
  }

  // 2022-05-24 10:37:33
  DateTime toDate1() {
    return DateFormat('yyyy/MM/dd HH:mm:ss').parse(this);
  }

  // 2022-05-24T10:37:33Z
  DateTime toDate() {
    final DateTime time = DateFormat('yyyy-MM-dd HH:mm:ss.SSS').parse(this);
    return time;
  }

  num formatNumber() {
    return num.tryParse(replaceSemicolon()) ?? 0;
  }

  String replaceSemicolon({String fromDecimal = ',', String toDecimal = ''}) {
    return replaceAll(fromDecimal, toDecimal);
  }
}
