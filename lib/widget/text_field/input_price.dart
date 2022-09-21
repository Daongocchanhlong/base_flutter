import 'package:base_src/extension/base_value_notify.dart';
import 'package:base_src/extension/num_ex.dart';
import 'package:base_src/extension/string_ex.dart';
import 'package:base_src/global/app_enum.dart';
import 'package:flutter/services.dart';
import 'package:base_src/import.dart';

typedef OnTapCalculator = void Function(TypeCalcalator type);

class PriceWidget extends BaseWidget<BaseController> {
  PriceWidget({
    Key? key,
    this.onTapCalculator,
    required this.textEditingController,
    required this.focusNodeCurrent,
    this.focusNodeNext,
    this.formatter,
    this.onTextChange,
    this.hintText = '',
    this.width,
    this.visible = true,
    this.scrollPadding = 20.0,
    this.enabled = true,
    int decimalDigits = 2,
    this.autofocus,
  }) : super(key: key) {
    focusNodeCurrent.addListener(() {
      if (!textEditingController.text.isString && !focusNodeCurrent.hasFocus) {
        textEditingController.text = textEditingController.text
            .formatNumber()
            .formatPrice(decimalDigits: decimalDigits);
        textEditingController.selection = TextSelection.fromPosition(
            TextPosition(offset: textEditingController.text.length));
      }
      isFocus.value = focusNodeCurrent.hasFocus;
    });
  }

  final OnTapCalculator? onTapCalculator;
  final TextEditingController textEditingController;
  final Function(String value)? onTextChange;
  final FocusNode focusNodeCurrent;
  final FocusNode? focusNodeNext;
  final TextInputFormatter? formatter;
  final RxNotify<bool> isFocus = false.objective;
  final String hintText;
  final bool enabled;
  final bool visible;
  final double? width;
  final double scrollPadding;
  final bool? autofocus;

  @override
  Widget builder() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: ValueListenableBuilder<bool>(
            valueListenable: isFocus,
            builder: (BuildContext context, bool value, Widget? child) {
              return Container(
                  color: color.white,
                  width: width ?? 1.getWidth,
                  height: 40.0,
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        width: 1, color: value ? color.red : color.black),
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, bottom: 8, left: 8),
                            child: TextField(
                              enabled: enabled,
                              autofocus: autofocus ?? false,
                              scrollPadding:
                                  EdgeInsets.only(bottom: scrollPadding),
                              focusNode: focusNodeCurrent,
                              onEditingComplete: () {
                                if (focusNodeNext != null) {
                                  focusNodeNext!.requestFocus();
                                } else {
                                  focusNodeCurrent.unfocus();
                                }
                              },
                              cursorColor: color.red,
                              controller: textEditingController,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      signed: false, decimal: true),
                              style: textStyle.custom(),
                              onChanged: (String value) {
                                if (onTextChange != null) {
                                  onTextChange!(value);
                                }
                              },
                              inputFormatters: <TextInputFormatter>[
                                if (formatter != null) formatter!,
                                FilteringTextInputFormatter.deny(
                                    RegExp(r'\s\b|\b\s'))
                              ],
                              decoration: InputDecoration(
                                fillColor: color.black,
                                hintText: hintText,
                                hintStyle: textStyle.custom(
                                    size: 12, color: color.white),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                                isDense: true,
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: visible,
                          child: IgnorePointer(
                            ignoring: !enabled,
                            child: ButtonCaculator(
                              onDercement: () =>
                                  onTapCalculatorW(TypeCalcalator.decrement),
                              onIncrement: () =>
                                  onTapCalculatorW(TypeCalcalator.increment),
                            ),
                          ),
                        )
                      ],
                    ),
                  ));
            }));
  }

  void onTapCalculatorW(TypeCalcalator calcalator) {
    if (onTapCalculator != null) {
      onTapCalculator!(calcalator);
      textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
    }
  }
}

class ButtonCaculator extends BaseWidget<BaseController> {
  ButtonCaculator(
      {Key? key, required this.onIncrement, required this.onDercement})
      : super(key: key);

  final Function() onIncrement;
  final Function() onDercement;

  @override
  Widget builder() {
    return Container(
      color: color.black,
      child: Row(
        children: <Widget>[
          _buildButton(label: '-', onTap: onDercement),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            color: color.black,
            width: 0.6,
          ),
          _buildButton(label: '+', onTap: onIncrement),
        ],
      ),
    );
  }

  Widget _buildButton({required String label, required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 36,
        alignment: Alignment.center,
        child: Text(
          label,
          style: textStyle.bold(color: color.white, size: 20),
        ),
      ),
    );
  }
}
