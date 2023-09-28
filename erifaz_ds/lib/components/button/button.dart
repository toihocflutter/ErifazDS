import 'package:erifaz_ds/components/button/button_utils.dart';
import 'package:erifaz_ds/foundation/colors.dart';
import 'package:erifaz_ds/foundation/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import '../../foundation/ds_theme.dart';

class Button extends StatefulWidget {
  const Button(
      {super.key,
      ButtonType? buttonType,
      ButtonSize? buttonSize,
      ButtonState? buttonState})
      : _buttonType = buttonType ?? ButtonType.primary,
        _buttonSize = buttonSize ?? ButtonSize.large,
        _buttonState = buttonState ?? ButtonState.normal;

  final ButtonType _buttonType;
  final ButtonSize _buttonSize;
  final ButtonState _buttonState;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    MouseCursor cursor = SystemMouseCursors.click;
    // if (widget.disabled || widget.loading) {
    //   cursor = SystemMouseCursors.forbidden;
    // }
    return MouseRegion(
      cursor: cursor,
      onEnter: handleEnter,
      onExit: handleExit,
      child: GestureDetector(
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        child: Container(
            decoration:
                widget._buttonType.getBoxDecoration(widget._buttonState),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
              child: Text(
                'Button',
                style: DSTheme.getTextStyle().copyWith(
                    fontSize: widget._buttonSize.getTextSize(),
                    color: widget._buttonType.getTextColor()),
              ),
            )),
      ),
    );

    // return Container(
    // decoration: widget._buttonType.getBoxDecoration(),
    // child: Padding(
    // padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
    // child: Text(
    // 'Button',
    // style: DSTheme.getTextStyle().copyWith(
    // fontSize: widget._buttonSize.getTextSize(),
    // color: widget._buttonType.getTextColor()),
    // )
    // ,
    // )
    // );
  }

  void handleEnter(PointerEnterEvent event) {
    // if (!widget.disabled && !widget.loading) {
    //   setState(() => hovered = true);
    // }
    print("Handle enter");
  }

  void handleExit(PointerExitEvent event) {
    // if (!widget.disabled && !widget.loading) {
    //   setState(() => hovered = false);
    // }
    print("Handle exit");
  }

  void onTapUp(TapUpDetails tapUpDetails) {
    // if (!widget.disabled && !widget.loading) {
    //   setState(() => hovered = false);
    // }
    print("Handle tap up");
  }

  void onTapDown(TapDownDetails tapDownDetails) {
    // if (!widget.disabled && !widget.loading) {
    //   setState(() => hovered = false);
    // }
    print("Handle on tap down");
  }
}

enum ButtonType { primary, normal, dashed, link, text }

extension ButtonTypeExt on ButtonType {
  BoxDecoration getBoxDecoration(ButtonState state) {
    switch (this) {
      case ButtonType.primary:
        {
          Color color = ButtonUtils.getColorPrimary(state);
          return BoxDecoration(color: color);
        }
      case ButtonType.normal:
        {
          const Color colorPrimary = Color(ErifazDSColor.colorActionPrimary100);
          return BoxDecoration(
              border: Border.all(width: 1, color: colorPrimary));
        }
      default:
        {
          const Color colorPrimary = Color(ErifazDSColor.colorActionPrimary100);
          return const BoxDecoration(color: colorPrimary);
        }
    }
  }

  Color getTextColor() {
    const colors = [
      ErifazDSColor.colorTextNeutral10,
      ErifazDSColor.colorActionSecondary100,
      ErifazDSColor.colorActionSecondary100,
      ErifazDSColor.colorActionSecondary100,
      ErifazDSColor.colorActionSecondary100
    ];
    return Color(colors[index]);
  }
}

enum ButtonSize { large, medium, small }

extension ButtonSizeExt on ButtonSize {
  double getTextSize() {
    const sizes = [
      ErifazDSSize.textWebBodyRegularLgFontSize,
      ErifazDSSize.textWebBodyRegularMDFontSize,
      ErifazDSSize.textWebBodyRegularSmFontSize
    ];
    return sizes[index].toDouble();
  }
}

enum ButtonState { normal, hovered, focus, disabled }
