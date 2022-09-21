import 'dart:collection';

// import 'package:base_src/extension/list.dart';
// import 'package:base_src/import.dart';
// import 'package:base_src/widget/base_keyboard.dart';
// import 'package:base_src/widget/cupertino_bottom_sheet/bts_single.dart';
// import 'package:gl_chart/flutter_k_chart.dart';
// import 'package:intl/intl.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:base_src/data/source/response/api_error.dart';
import 'package:url_launcher/url_launcher.dart';

bool isNullOrEmpty(dynamic x) {
  assert(x == null ||
      x is String ||
      x is List ||
      x is Map ||
      x is HashMap ||
      x is Set);

  if (x == null) {
    return true;
  }

  if (x is String) {
    return x.isEmpty;
  }

  if (x is List) {
    return x.isEmpty;
  }

  if (x is Map) {
    return x.isEmpty;
  }

  if (x is HashMap) {
    return x.isEmpty;
  }

  if (x is Set) {
    return x.isEmpty;
  }

  return true;
}

bool isNotNullOrEmpty(dynamic x) {
  assert(x == null ||
      x is String ||
      x is List ||
      x is Map ||
      x is HashMap ||
      x is Set);

  if (x == null) {
    return false;
  }

  if (x is String) {
    return x.isNotEmpty;
  }

  if (x is List) {
    return x.isNotEmpty;
  }

  if (x is Map) {
    return x.isNotEmpty;
  }

  if (x is HashMap) {
    return x.isNotEmpty;
  }

  if (x is Set) {
    return x.isNotEmpty;
  }

  return false;
}

bool isNull(dynamic x) {
  return x == null;
}

bool isNotNull(dynamic x) {
  return x != null;
}

bool rejectIfEqual(List<bool> x) {
  for (final bool xx in x) {
    if (xx) {
      return false;
    }
  }

  return true;
}

String getError(dynamic error, {String mms = ''}) {
  if (error is String) {
    return '$error $mms';
  }

  if (error is ApiError) {
    if (isNotNullOrEmpty(error.message)) {
      return '${error.message ?? 'Đã có lỗi xảy ra'} $mms';
    }

    return 'Đã có lỗi xảy ra $mms';
  }

  if (error is Exception) {
    if (isNull(error)) {
      return 'Đã có lỗi xảy ra $mms';
    }

    return '$error $mms';
  }

  return 'Đã có lỗi xảy ra $mms';
}

void openUrl(String url, {LaunchMode mode = LaunchMode.inAppWebView}) {
  launchUrl(
    Uri.parse(url),
    mode: mode,
  ).catchError((dynamic error) {
    // showPopup(error);
  });
}
