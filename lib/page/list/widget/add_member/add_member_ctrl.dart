import 'package:base_src/domain/model/work/work_result.dart';
import 'package:base_src/import.dart';

class AddMemberCtrl extends BaseController {
  // use case
  RxBool isCheck = RxBool(true);
  RxList<WorkResult> works = <WorkResult>[].obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {}
}
