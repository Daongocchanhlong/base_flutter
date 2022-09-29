import 'package:base_src/base/base_controller.dart';
import 'package:base_src/base/base_widget.dart';
import 'package:base_src/global/app_enum.dart';

class BaseCheckBox extends BaseWidget<BaseController> {
  BaseCheckBox({
    Key? key,
    required this.value,
    this.textLeft = false,
    this.label,
    required this.onChange,
    this.size = 20.0,
    this.type = TypeCheckBox.circle,
  }) : super(key: key);

  final bool value;
  final bool textLeft;
  final String? label;
  final Function() onChange;
  final double size;
  final TypeCheckBox type;
  @override
  Widget builder() => Row(
        children: [
          if (textLeft)
            Text(
              label ?? '',
              style: textStyle.regular(size: 14, color: color.white),
            ).marginOnly(right: 8),
          GestureDetector(
            onTap: onChange,
            child: _buildCheckBox(),
          ),
          if (!textLeft)
            Text(
              label ?? '',
              style: textStyle.regular(size: 14, color: color.white),
            ).marginOnly(left: 8),
        ],
      );

  Widget _buildCheckBox() {
    switch (type) {
      case TypeCheckBox.circle:
        return Container(
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
                    color: color.green,
                    borderRadius: BorderRadius.circular((size / 2)),
                  ),
                )
              : const SizedBox(),
        );
      case TypeCheckBox.square:
        return Container(
          padding: EdgeInsets.all(size / 5),
          decoration: BoxDecoration(
            color: value ? color.green : color.white.withOpacity(0.7),
            borderRadius: const BorderRadius.all(
              Radius.circular(2),
            ),
          ),
          child: Icon(
            Icons.check_sharp,
            color: value ? color.white : color.white.withOpacity(0.7),
            size: 16,
          ),
        );
    }
  }
}
