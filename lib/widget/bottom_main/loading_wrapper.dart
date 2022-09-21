import 'package:base_src/import.dart';

class LoadingWrapper extends BaseScreen<LoadingController> {
  LoadingWrapper({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return Obx(() => Visibility(
        visible: controller.loadingCtrl.value,
        child: ColoredBox(
            color: const Color(0xFF131615).withOpacity(0.5),
            child: Center(
                child: CircularProgressIndicator(color: color.red)))));
  }

  @override
  LoadingController? putController() => LoadingController();
}

class LoadingController extends GetxController {
  Rx<bool> loadingCtrl = Rx<bool>(false);
  int _count = 0;

  void show() {
    _count += 1;

    if (_count == 1) {
      loadingCtrl.value = true;
    }
  }

  void hide() {
    if (_count > 0) {
      _count--;
    }

    if (_count == 0) {
      loadingCtrl.value = false;
    }
  }

  void hideAll() {
    _count = 0;

    loadingCtrl.value = false;
  }
}
