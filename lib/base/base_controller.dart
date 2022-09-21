import 'package:base_src/base/base_mixin.dart';
import 'package:base_src/import.dart';
import 'package:base_src/widget/bottom_main/loading_wrapper.dart';
import 'package:flutter/scheduler.dart';

export 'package:flutter/material.dart';
export 'package:get/get.dart';

abstract class BaseController extends GetxController with BaseMixin {
  LoadingController get loading => Get.find<LoadingController>();

  final Rx<bool> loadingPage = false.obs;

  // final AppToast toast = AppToast.toast;

  @override
  void onInit() {
    log.debugPrint('BaseController');
    super.onInit();
  }

  void onResumed() {}

  void showLoadingWhenInit() {
    SchedulerBinding.instance.addPostFrameCallback((_) => loading.show());
  }

  void showLoading() {
    loading.show();
  }

  void hideLoading() {
    loading.hide();
  }

  void showLoadingPage() {
    loadingPage.value = true;
  }

  void hideLoadingPage() {
    loadingPage.value = false;
  }

  @override
  void dispose() {
    loadingPage.value = false;
    loading.hideAll();
    super.dispose();
  }
}
