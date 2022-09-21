// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

extension IntEx on int {
  String get toHEX => toRadixString(16).padLeft(4, '0').toUpperCase();
}

extension NumEx on num {
  String formatPrice(
      {int decimalDigits = 2,
      bool getAbs = false,

      /// If set to true, function will remove the .00 at the last of value
      /// Eg 69.00 -> 69
      bool trimZero = false,
      bool zeroToEmpty = false,
      String endPoint = ''}) {
    final num value = this;

    if (trimZero) {
      if (value == value.round().toDouble()) {
        // ignore: parameter_assignments
        decimalDigits = 0;
      }
    }

    if (zeroToEmpty && value == 0) {
      return '';
    }

    final NumberFormat format = NumberFormat.currency(
        locale: 'en-US', symbol: '', decimalDigits: decimalDigits);
    String abs = '';

    if (value > 0 && getAbs) {
      abs = '+';
    }

    return abs + format.format(value) + endPoint;
  }

  String formatVolume({
    int decimalDigits = 0,
    bool convertToThounsand = false,
    bool trimBilion = false,
    bool getAbs = false,

    /// If set to true, function will remove the .00 at the last of value
    /// Eg 69.00 -> 69
    bool trimZero = false,
    bool zeroToEmpty = false,
    bool convertAbcs = false,
    bool trimZeroInt = true,
  }) {
    num value = this;
    if (convertToThounsand) {
      value = value / 1000;
    }

    if (trimBilion) {
      value = value / 1000000000;
    }

    if (trimZero) {
      if (value == value.round().toDouble()) {
        // ignore: parameter_assignments
        decimalDigits = 0;
      }
    }

    if (zeroToEmpty && value == 0) {
      return '';
    }

    if (value.toInt() == value && trimZeroInt) {
      decimalDigits = 0;
    }
    final NumberFormat format = NumberFormat.currency(
        locale: 'en-US', symbol: '', decimalDigits: decimalDigits);
    return format.format(value);
  }
}
