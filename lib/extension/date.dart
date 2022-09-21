// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

extension FormatDate on DateTime {
  String formatDDMMYYYY({String pattern = '/'}) {
    final DateFormat formatter = DateFormat('dd${pattern}MM${pattern}yyyy');
    return formatter.format(this);
  }

  String formatHHMMSS({String pattern = ':'}) {
    final DateFormat formatter = DateFormat('HH${pattern}mm${pattern}ss');
    return formatter.format(this);
  }

  String formatYYYYMMDD({String pattern = '/'}) {
    final DateFormat formatter = DateFormat('yyyy${pattern}MM${pattern}dd');
    return formatter.format(this);
  }

  String formatTimeToServer() {
    final DateFormat formatter = DateFormat('yyyyMMdd');
    return formatter.format(this);
  }
}
