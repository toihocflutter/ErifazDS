import 'dart:ui';

import 'package:erifaz_ds/components/button/button.dart';

import '../../foundation/colors.dart';

class ButtonUtils {
  static Color getColorPrimary(ButtonState state) {
    switch (state) {
      case ButtonState.normal:
        {
          return const Color(ErifazDSColor.colorActionPrimary100);
        }
      case ButtonState.hovered:
        {
          return const Color(ErifazDSColor.colorActionPrimary100);
        }
      case ButtonState.focus:
        {
          return const Color(ErifazDSColor.colorActionPrimary100);
        }
      case ButtonState.disabled:
        {
          return const Color(ErifazDSColor.colorActionSecondary50);
        }
      default:
        return const Color(ErifazDSColor.colorActionPrimary100);
    }
  }
}
