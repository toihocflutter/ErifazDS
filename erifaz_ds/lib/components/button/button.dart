import 'package:erifaz_ds/foundation/colors.dart';
import 'package:erifaz_ds/foundation/size.dart';
import 'package:flutter/cupertino.dart';

import '../../foundation/ds_theme.dart';

class Button extends StatefulWidget {
  const Button({super.key, ButtonType? buttonType, ButtonSize? buttonSize})
      : _buttonType = buttonType ?? ButtonType.primary,
        _buttonSize = buttonSize ?? ButtonSize.large;

  final ButtonType _buttonType;
  final ButtonSize _buttonSize;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: widget._buttonType.getBoxDecoration(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: Text(
            'Button',
            style: DSTheme.getTextStyle().copyWith(
                fontSize: widget._buttonSize.getTextSize(),
                color: widget._buttonType.getTextColor()),
          ),
        ));
  }
}

enum ButtonType { primary, normal, dashed, link, text }

extension ButtonTypeExt on ButtonType {
  BoxDecoration getBoxDecoration() {
    const Color colorPrimary = Color(ErifazDSColor.colorActionPrimary100);
    return const BoxDecoration(color: colorPrimary);
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

enum ButtonState { normal, hovered, focus }
