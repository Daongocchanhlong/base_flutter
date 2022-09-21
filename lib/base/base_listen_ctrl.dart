import 'package:base_src/base/base_controller.dart';
import 'package:base_src/import.dart';

abstract class BaseListenCtrl<T> extends BaseController {
  BaseListenCtrl({required this.currentPage, required this.indexPageChange});

  late final Worker worker;
  final T currentPage;
  final Rx<T> indexPageChange;

  @override
  void onInit() {
    worker = ever(
      indexPageChange,
      (T pageChange) {
        if (pageChange == currentPage) {
          initPage();
        }
      },
    );
    if (indexPageChange.value == currentPage) {
      initPage();
    }

    super.onInit();
  }

  void initPage() {
    worker.dispose();
  }

  bool get isCurrentPage => currentPage == indexPageChange.value;
}
