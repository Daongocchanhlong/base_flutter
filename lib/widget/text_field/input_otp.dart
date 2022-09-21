import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputOtpWidget extends StatefulWidget {
  const InputOtpWidget({
    Key? key,
    required this.appContext,
    required this.length,
    this.hieght = 50,
    required this.textController,
    required this.onChanged,
    this.onCompleted,
    this.backgroundColor = Colors.transparent,
    this.bgColorFocus = Colors.blueAccent,
    this.animationDuration = const Duration(milliseconds: 150),
    this.animationCurve = Curves.easeInOut,
    this.keyboardType = TextInputType.visiblePassword,
    this.autoFocus = false,
    required this.focusNode,
    this.onTap,
    this.enabled = true,
    this.inputFormatters = const <TextInputFormatter>[],
    this.textStyle,
    this.useHapticFeedback = false,
    this.hapticFeedbackTypes = HapticFeedbackTypes.light,
    this.enableActiveFill = false,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.done,
    this.autoDismissKeyboard = true,
    this.autoDisposeControllers = true,
    this.onSubmitted,
    this.beforeTextPaste,
    this.keyboardAppearance,
    this.onSaved,
    this.enablePinAutofill = true,
    this.showCursor = true,
    this.cursorColor,
    this.cursorWidth = 2,
    this.cursorHeight,
    this.readOnly = false,

    /// Default for [AutofillGroup]
    this.onAutoFillDisposeAction = AutofillContextAction.commit,

    /// Default create internal [AutofillGroup]
    this.useExternalAutoFillGroup = false,
  }) : super(key: key);

  /// The [BuildContext] of the application
  final BuildContext appContext;

  /// [TextEditingController] to control the text manually. Sets a default [TextEditingController()] object if none given
  final TextEditingController textController;

  /// Số ô nhập . 3-8 is recommended by me
  final int length;

  /// Chiều cao ô nhập
  final double hieght;

  /// returns the current typed text in the fields
  final ValueChanged<String> onChanged;

  /// returns the typed text when all pins are set
  final ValueChanged<String>? onCompleted;

  /// returns the typed text when user presses done/next action on the keyboard
  final ValueChanged<String>? onSubmitted;

  /// Whether to use haptic feedback or not
  ///
  ///
  final bool useHapticFeedback;

  /// Haptic Feedback Types
  ///
  /// heavy, medium, light links to respective impacts
  /// selection - selectionClick, vibrate - vibrate
  /// check [HapticFeedback] for more
  final HapticFeedbackTypes hapticFeedbackTypes;

  /// the style of the text, default is [ fontSize: 20, fontWeight: FontWeight.bold]
  final TextStyle? textStyle;

  /// background color for the whole row of pin code fields.
  final Color backgroundColor;

  final Color bgColorFocus;

  /// Brightness dark or light choices for iOS keyboard.
  final Brightness? keyboardAppearance;

  /// Duration for the animation. Default is [Duration(milliseconds: 150)]
  final Duration animationDuration;

  /// [Curve] for the animation. Default is [Curves.easeInOut]
  final Curve animationCurve;

  /// [TextInputType] for the pin code fields. default is [TextInputType.visiblePassword]
  final TextInputType keyboardType;

  /// If the pin code field should be autofocused or not. Default is [false]
  final bool autoFocus;

  /// Should pass a [FocusNode] to manage it from the parent
  final FocusNode focusNode;

  /// A list of [TextInputFormatter] that goes to the TextField
  final List<TextInputFormatter> inputFormatters;

  /// Enable or disable the Field. Default is [true]
  final bool enabled;

  /// Enabled Color fill for individual pin fields, default is [false]
  final bool enableActiveFill;

  /// Auto dismiss the keyboard upon inputting the value for the last field. Default is [true]
  final bool autoDismissKeyboard;

  /// Auto dispose the [controller] and [FocusNode] upon the destruction of widget from the widget tree. Default is [true]
  final bool autoDisposeControllers;

  /// Configures how the platform keyboard will select an uppercase or lowercase keyboard.
  /// Only supports text keyboards, other keyboard types will ignore this configuration. Capitalization is locale-aware.
  /// - Copied from 'https://api.flutter.dev/flutter/services/TextCapitalization-class.html'
  /// Default is [TextCapitalization.none]
  final TextCapitalization textCapitalization;

  final TextInputAction textInputAction;

  /// Callback method to validate if text can be pasted. This is helpful when we need to validate text before pasting.
  /// e.g. validate if text is number. Default will be pasted as received.
  final bool Function(String? text)? beforeTextPaste;

  /// Method for detecting a pin_code form tap
  /// work with all form windows
  final Function? onTap;

  /// An optional method to call with the final value when the form is saved via
  /// [FormState.save].
  final FormFieldSetter<String>? onSaved;

  /// Enables pin autofill for TextFormField.
  /// Default is true
  final bool enablePinAutofill;

  /// Whether to show cursor or not
  final bool showCursor;

  /// The color of the cursor, default to Theme.of(context).accentColor
  final Color? cursorColor;

  /// width of the cursor, default to 2
  final double cursorWidth;

  /// Height of the cursor, default to FontSize + 8;
  final double? cursorHeight;

  /// Autofill cleanup action
  final AutofillContextAction onAutoFillDisposeAction;

  /// Use external [AutoFillGroup]
  final bool useExternalAutoFillGroup;

  /// Makes the pin cells readOnly
  final bool readOnly;

  @override
  _PinCodeTextFieldState createState() => _PinCodeTextFieldState();
}

class _PinCodeTextFieldState extends State<InputOtpWidget>
    with TickerProviderStateMixin {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;
  late List<String> _inputList;
  int _selectedIndex = 0;
  BorderRadius? borderRadius;

  // AnimationController for the error animation
  late AnimationController _controller;

  late AnimationController _cursorController;

  StreamSubscription<ErrorAnimationType>? _errorAnimationSubscription;

  // Animation for the error animation
  late Animation<Offset> _offsetAnimation;

  late Animation<double> _cursorAnimation;

  TextStyle get _textStyle => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ).merge(widget.textStyle);

  @override
  void initState() {
    _assignController();

    _focusNode = widget.focusNode;
    //
    _focusNode.addListener(() {
      setState(() {});
    }); // Rebuilds on every change to reflect the correct color on each field.
    _inputList = List<String>.filled(widget.length, '');

    _cursorController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _cursorAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(
      parent: _cursorController,
      curve: Curves.easeIn,
    ));

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(.1, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticIn,
    ));
    if (widget.showCursor) {
      _cursorController.repeat();
    }

    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });

    // If a default value is set in the TextEditingController, then set to UI
    if (_textEditingController.text.isNotEmpty) {
      _setTextToInput(_textEditingController.text);
    }
    super.initState();
  }

  void runHapticFeedback() {
    switch (widget.hapticFeedbackTypes) {
      case HapticFeedbackTypes.heavy:
        HapticFeedback.heavyImpact();
        break;

      case HapticFeedbackTypes.medium:
        HapticFeedback.mediumImpact();
        break;

      case HapticFeedbackTypes.light:
        HapticFeedback.lightImpact();
        break;

      case HapticFeedbackTypes.selection:
        HapticFeedback.selectionClick();
        break;

      case HapticFeedbackTypes.vibrate:
        HapticFeedback.vibrate();
        break;

      default:
        break;
    }
  }

  // Assigning the text controller, if empty assiging a new one.
  void _assignController() {
    _textEditingController = widget.textController;

    //K
    _textEditingController.addListener(() {
      if (widget.useHapticFeedback) {
        runHapticFeedback();
      }

      String currentText = _textEditingController.text;

      if (widget.enabled && _inputList.join('') != currentText) {
        if (currentText.length >= widget.length) {
          if (widget.onCompleted != null) {
            if (currentText.length > widget.length) {
              // removing extra text longer than the length
              currentText = currentText.substring(0, widget.length);
            }
            //  delay the onComplete event handler to give the onChange event handler enough time to complete
            // ignore: always_specify_types
            Future.delayed(const Duration(milliseconds: 150),
                () => widget.onCompleted!(currentText));
          }

          if (widget.autoDismissKeyboard) {
            _focusNode.unfocus();
          } else {
            _focusNode.nextFocus();
          }
        }
        widget.onChanged(currentText);
      }

      _setTextToInput(currentText);
    });
  }

  @override
  void dispose() {
    if (widget.autoDisposeControllers) {
      _textEditingController.dispose();
      _focusNode.dispose();
    }

    _errorAnimationSubscription?.cancel();

    _cursorController.dispose();

    _controller.dispose();
    super.dispose();
  }

  Widget _renderPinField({required int index}) => Text(
        _inputList[index],
        // ignore: always_specify_types
        key: ValueKey(_inputList[index]),
        style: _textStyle,
      );

  // color boder
  Color _getColorFromIndex(int index) {
    if (!widget.enabled) {
      return Colors.grey;
    }
    if (((_selectedIndex == index) ||
            (_selectedIndex == index + 1 && index + 1 == widget.length)) &&
        _focusNode.hasFocus) {
      return Colors.blue;
    } else if (_selectedIndex > index) {
      return Colors.green;
    }

    return Colors.grey;
  }

  /// Builds the widget to be shown
  Widget buildChild(int index) {
    if (((_selectedIndex == index) ||
            (_selectedIndex == index + 1 && index + 1 == widget.length)) &&
        _focusNode.hasFocus &&
        widget.showCursor) {
      final Color cursorColor = widget.cursorColor ?? Colors.greenAccent;
      final double cursorHeight =
          widget.cursorHeight ?? _textStyle.fontSize! + 8;

      if (_selectedIndex == index + 1 && index + 1 == widget.length) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: _textStyle.fontSize! / 1.5),
                child: FadeTransition(
                  opacity: _cursorAnimation,
                  child: CustomPaint(
                    size: Size(0, cursorHeight),
                    painter: CursorPainter(
                      cursorColor: cursorColor,
                      cursorWidth: widget.cursorWidth,
                    ),
                  ),
                ),
              ),
            ),
            _renderPinField(index: index),
          ],
        );
      } else {
        return Center(
          child: FadeTransition(
            opacity: _cursorAnimation,
            child: CustomPaint(
              size: Size(0, cursorHeight),
              painter: CursorPainter(
                cursorColor: cursorColor,
                cursorWidth: widget.cursorWidth,
              ),
            ),
          ),
        );
      }
    }
    return _renderPinField(index: index);
  }

  void _showPasteDialog(String pastedText) {
    final String formattedPastedText = pastedText
        .trim()
        .substring(0, min(pastedText.trim().length, widget.length));

    _textEditingController.text = formattedPastedText;
  }

  @override
  Widget build(BuildContext context) {
    final TextFormField textField = TextFormField(
      textInputAction: widget.textInputAction,
      controller: _textEditingController,
      focusNode: _focusNode,
      enabled: widget.enabled,
      autofillHints: widget.enablePinAutofill && widget.enabled
          ? <String>[AutofillHints.oneTimeCode]
          : null,
      autofocus: widget.autoFocus,
      autocorrect: false,
      keyboardType: widget.keyboardType,
      keyboardAppearance: widget.keyboardAppearance,
      textCapitalization: widget.textCapitalization,
      onSaved: widget.onSaved,
      inputFormatters: <TextInputFormatter>[
        ...widget.inputFormatters,
        LengthLimitingTextInputFormatter(
          widget.length,
        ), // this limits the input length
      ],
      // trigger on the complete event handler from the keyboard
      onFieldSubmitted: widget.onSubmitted,
      enableInteractiveSelection: false,
      showCursor: false,
      // using same as background color so tha it can blend into the view
      cursorWidth: 0.01,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        border: InputBorder.none,
        fillColor: widget.backgroundColor,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      style: const TextStyle(
        color: Colors.transparent,
        height: .01,
        fontSize: kIsWeb
            ? 1
            : 0.01, // it is a hidden textfield which should remain transparent and extremely small
      ),
      readOnly: widget.readOnly,
    );

    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        // adding the extra space at the bottom to show the error text from validator
        height: widget.hieght,
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            AbsorbPointer(
              // this is a hidden textfield under the pin code fields.
              absorbing: true, // it prevents on tap on the text field
              child: widget.useExternalAutoFillGroup
                  ? textField
                  : AutofillGroup(
                      onDisposeAction: widget.onAutoFillDisposeAction,
                      child: textField,
                    ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  if (widget.onTap != null) {
                    widget.onTap!();
                  }
                  _onFocus();
                },
                onLongPress: widget.enabled
                    ? () async {
                        final ClipboardData? data =
                            await Clipboard.getData('text/plain');
                        if (data?.text?.isNotEmpty ?? false) {
                          if (widget.beforeTextPaste != null) {
                            if (widget.beforeTextPaste!(data!.text)) {
                              _showPasteDialog(data.text!);
                            }
                          } else {
                            _showPasteDialog(data!.text!);
                          }
                        }
                      }
                    : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _generateFields(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _generateFields() {
    final List<Widget> result = <Widget>[];
    for (int i = 0; i < widget.length; i++) {
      result.add(
        Container(
            padding: EdgeInsets.zero,
            child: AnimatedContainer(
              curve: widget.animationCurve,
              duration: widget.animationDuration,
              width: 40,
              height: widget.hieght,
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: _getColorFromIndex(i),
                  width: 1,
                ),
              ),
              child: Center(
                child: AnimatedSwitcher(
                  switchInCurve: widget.animationCurve,
                  switchOutCurve: widget.animationCurve,
                  duration: widget.animationDuration,
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: buildChild(i),
                ),
              ),
            )),
      );
    }
    return result;
  }

  void _onFocus() {
    if (_focusNode.hasFocus &&
        MediaQuery.of(widget.appContext).viewInsets.bottom == 0) {
      _focusNode.unfocus();
      // ignore: always_specify_types
      Future.delayed(
          const Duration(microseconds: 1), () => _focusNode.requestFocus());
    } else {
      _focusNode.requestFocus();
    }
  }

  void _setTextToInput(String data) {
    final List<String> replaceInputList =
        List<String>.filled(widget.length, '');

    for (int i = 0; i < widget.length; i++) {
      replaceInputList[i] = data.length > i ? data[i] : '';
    }

    if (mounted) {
      setState(() {
        _selectedIndex = data.length;
        _inputList = replaceInputList;
      });
    }
  }
}

enum PinCodeFieldShape { box, underline, circle }

enum ErrorAnimationType { shake }

enum HapticFeedbackTypes {
  heavy,
  light,
  medium,
  selection,
  vibrate,
}

class CursorPainter extends CustomPainter {
  CursorPainter({this.cursorColor = Colors.black, this.cursorWidth = 2});
  @override
  void paint(Canvas canvas, Size size) {
    const Offset p1 = Offset(0, 0);
    final Offset p2 = Offset(0, size.height);
    final Paint paint = Paint()
      ..color = cursorColor
      ..strokeWidth = cursorWidth;
    canvas.drawLine(p1, p2, paint);
  }

  final Color cursorColor;
  final double cursorWidth;
  @override
  // ignore: avoid_renaming_method_parameters
  bool shouldRepaint(CustomPainter old) => false;
}
