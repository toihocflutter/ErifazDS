import 'package:erifaz_ds/components/button/button_color_state.dart';
import 'package:erifaz_ds/foundation/colors.dart';
import 'package:erifaz_ds/foundation/size.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../foundation/ds_theme.dart';

class Button extends StatefulWidget {
  Button(
      {super.key,
      ButtonType buttonType = ButtonType.primary,
      ButtonSize buttonSize = ButtonSize.large,
      bool disabled = false})
      : _buttonType = buttonType,
        _buttonSize = buttonSize,
        _buttonColorState = buttonType.getButtonState() {
    _buttonColorState = _buttonColorState.copyWith(isDisabled: disabled);
  }

  final ButtonType _buttonType;
  final ButtonSize _buttonSize;
  ButtonColorState _buttonColorState;

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

    return Ink(
      decoration: widget._buttonType.getBoxDecoration(widget._buttonColorState),
      child: InkWell(
        onTap: () {},
        child: MouseRegion(
          cursor: cursor,
          onEnter: handleMouseEnter,
          onExit: handleMouseExit,
          child: Container(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            child: Text(
              'Button',
              style: DSTheme.getTextStyle().copyWith(
                  fontSize: widget._buttonSize.getTextSize(),
                  color: widget._buttonType.getTextColor()),
            ),
          )),
        ),
      ),
    );
  }

  void handleMouseEnter(PointerEnterEvent event) {
    if (!widget._buttonColorState.isDisabled) {
      setState(() => widget._buttonColorState =
          widget._buttonColorState.copyWith(isHovered: true));
    }
  }

  void handleMouseExit(PointerExitEvent event) {
    if (!widget._buttonColorState.isDisabled) {
      setState(() => widget._buttonColorState =
          widget._buttonColorState.copyWith(isHovered: false));
    }
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
  BoxDecoration getBoxDecoration(ButtonColorState buttonColorState) {
    switch (this) {
      case ButtonType.primary:
        {
          Color color = buttonColorState.getBackgroundColor();
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

  ButtonColorState getButtonState() {
    switch (this) {
      case ButtonType.primary:
        return ButtonPrimaryState();
      default:
        return ButtonPrimaryState();
    }
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
