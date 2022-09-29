import 'package:base_src/base/base_widget.dart';
import 'package:base_src/extension/enum_ex.dart';
import 'package:base_src/global/app_enum.dart';
import 'package:base_src/page/list/list_ctrl.dart';

class BottomSheetMember extends BaseWidget<ListCtrl> {
  BottomSheetMember({
    Key? key,
  }) : super(key: key);

  Widget _buildTextRow(TypeButtonMember type) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: () => controller.onPressBottomButton(type),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: color.green),
          borderRadius: BorderRadius.circular(10.0),
          color: color.white,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[
                    color.yellowBgr,
                    color.orangeBgr,
                  ],
                ),
              ),
              child: Icon(
                type.image,
                size: 16.0,
                color: color.black,
              ),
            ),
            const SizedBox(width: 4.0),
            Text(type.title,
                style: textStyle.medium(size: 16.0, color: color.green)),
          ],
        ),
      ),
    );
  }

  @override
  Widget builder() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: TypeButtonMember.values
              .map((TypeButtonMember e) => Column(
                    children: [
                      _buildTextRow(e),
                      const SizedBox(height: 4.0),
                    ],
                  ))
              .toList(),
        ),
      );
}
