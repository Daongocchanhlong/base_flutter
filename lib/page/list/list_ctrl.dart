import 'package:base_src/global/app_enum.dart';
import 'package:base_src/import.dart';
import 'package:base_src/page/list/widget/add_member/add_member_page.dart';
import 'package:base_src/page/list/widget/bottom_sheet_member.dart';
import 'package:base_src/page/list/widget/info_member.dart';
import 'package:base_src/widget/show_popup.dart';

class ListCtrl extends BaseController {
  // use case

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {}

  void openPopUp() {
    ShowPopup().custom(content: InfoMember());
  }

  void openAddPopUp() {
    ShowPopup().custom(content: AddMemberPage());
  }

  void openBottom() {
    Get.bottomSheet(BottomSheetMember());
  }

  void onPressBottomButton(TypeButtonMember type) {
    switch (type) {
      case TypeButtonMember.edit:
        break;
      case TypeButtonMember.remove:
        break;
      case TypeButtonMember.addPoint:
        break;
      case TypeButtonMember.attendance:
        break;
      case TypeButtonMember.funding:
        break;
    }
  }
}
