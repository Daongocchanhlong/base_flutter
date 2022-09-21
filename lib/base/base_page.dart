import 'package:base_src/import.dart';

export 'package:flutter/material.dart';

abstract class BaseScreen<T extends GetxController> extends StatelessWidget
    with BaseMixin, RouteAware {
  BaseScreen({T? screenController, this.tag, bool isKeep = false, Key? key})
      : super(key: key) {
    if (screenController == null) {
      setController(isKeep: isKeep);
    } else {
      setController(screenController: screenController, isKeep: isKeep);
    }
  }

  late final String? tag;
  late final T controller;

  late final BuildContext context = Get.context!;

  T? putController();

  String? screenName() => '';

  String? get getTag => tag;

  void setController({T? screenController, bool isKeep = false}) {
    T? tempC;
    if (screenController != null) {
      tempC = screenController;
    } else if (!Get.isRegistered<T>(tag: getTag)) {
      tempC = putController();
    }

    if (tempC != null) {
      controller = GetInstance().put<T>(tempC, permanent: isKeep, tag: getTag);
    } else {
      controller = GetInstance().find<T>(tag: getTag);
    }
  }

  @override
  Widget build(BuildContext context) {
    return builder();
  }

  Widget builder();

  @override
  void didPush() {
    _sendCurrentTabToAnalytics();
  }

  @override
  void didPopNext() {
    _sendCurrentTabToAnalytics();
  }

  void _sendCurrentTabToAnalytics() {}
}
