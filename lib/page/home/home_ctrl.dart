import 'package:base_src/domain/model/work/work_result.dart';
import 'package:base_src/global/app_enum.dart';
import 'package:base_src/global/app_router.dart';
import 'package:base_src/import.dart';

class HomeCtrl extends BaseController {
  // use case
  RxBool isCheck = RxBool(true);
  RxList<WorkResult> works = <WorkResult>[].obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    for (var i = 0; i < 10; i++) {
      works.add(WorkResult(title: 'Công việc $i', isDone: i % 2 == 0));
    }
  }

  void onPress(TypeMenu type) {
    switch (type) {
      case TypeMenu.list:
        Get.toNamed(AppRouter.routerList);
        break;
      case TypeMenu.doctrine:
        break;
      case TypeMenu.exam:
        break;
      case TypeMenu.fund:
        break;
      case TypeMenu.another:
        break;
      case TypeMenu.skill:
        break;
    }
  }
}
