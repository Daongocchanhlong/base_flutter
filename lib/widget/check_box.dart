import 'package:base_src/base/base_controller.dart';
import 'package:base_src/base/base_widget.dart';
import 'package:base_src/global/app_theme.dart';

class BaseCheckBox extends BaseWidget<BaseController> {
  BaseCheckBox({
    Key? key,
    required this.value,
    this.textLeft = false,
    this.label,
    required this.onChange,
    this.size = 20.0,
  }) : super(key: key);

  final bool value;
  final bool textLeft;
  final String? label;
  final Function() onChange;
  final double size;
  @override
  Widget builder() => Row(
        children: [
          if (textLeft)
            Text(
              label ?? '',
              style: textStyle.regular(size: 16, color: color.white),
            ).marginOnly(right: 8),
          GestureDetector(
            onTap: onChange,
            child: Container(
              padding: EdgeInsets.all(size / 5),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: color.black),
                borderRadius: BorderRadius.circular((size / 2)),
              ),
              height: size,
              width: size,
              child: value
                  ? Container(
                      width: (size / 2),
                      height: (size / 2),
                      decoration: BoxDecoration(
                        color: color.red,
                        borderRadius: BorderRadius.circular((size / 2)),
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
          if (!textLeft)
            Text(
              label ?? '',
              style: textStyle.regular(size: 16, color: color.white),
            ).marginOnly(left: 8),
        ],
      );
}
