import 'package:base_src/base/base_controller.dart';
import 'package:base_src/generated/locales.g.dart';
import 'package:base_src/global/app_enum.dart';
import 'package:base_src/global/app_path.dart';

extension TypeMenuEX on TypeMenu {
  String get title {
    switch (this) {
      case TypeMenu.list:
        return LocaleKeys.home_list.tr;
      case TypeMenu.doctrine:
        return LocaleKeys.home_doctrine.tr;
      case TypeMenu.exam:
        return LocaleKeys.home_exam.tr;
      case TypeMenu.fund:
        return LocaleKeys.home_fund.tr;
      case TypeMenu.another:
        return LocaleKeys.home_another.tr;
      case TypeMenu.skill:
        return LocaleKeys.home_skill.tr;
    }
  }

  String get image {
    switch (this) {
      case TypeMenu.list:
        return AppPath.iconMenu;
      case TypeMenu.doctrine:
        return AppPath.iconLearn;
      case TypeMenu.exam:
        return AppPath.iconExam;
      case TypeMenu.fund:
        return AppPath.iconMenu;
      case TypeMenu.another:
        return AppPath.iconMenu;
      case TypeMenu.skill:
        return AppPath.iconMenu;
    }
  }
}

extension TypeButtonMemberEX on TypeButtonMember {
  String get title {
    switch (this) {
      case TypeButtonMember.edit:
        return "Sửa";
      case TypeButtonMember.remove:
        return "Xóa";
      case TypeButtonMember.addPoint:
        return "Thêm điểm";
      case TypeButtonMember.attendance:
        return "Điểm danh";
      case TypeButtonMember.funding:
        return "Nộp quỹ";
    }
  }

  IconData get image {
    switch (this) {
      case TypeButtonMember.edit:
        return Icons.edit;
      case TypeButtonMember.remove:
        return Icons.remove;
      case TypeButtonMember.addPoint:
        return Icons.add;
      case TypeButtonMember.attendance:
        return Icons.fact_check_outlined;
      case TypeButtonMember.funding:
        return Icons.price_check;
    }
  }
}
