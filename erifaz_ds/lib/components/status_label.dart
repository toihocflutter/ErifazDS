import 'package:erifaz_ds/foundation/ds_theme.dart';
import 'package:flutter/material.dart';

import '../foundation/colors.dart';
import '../foundation/size.dart';

class StatusLabel extends StatelessWidget {
  const StatusLabel(
      {Key? key,
      required this.label,
      this.color = StatusLabelColor.neutral,
      this.size = StatusLabelSize.medium})
      : super(key: key);

  final String label;
  final StatusLabelColor color;
  final StatusLabelSize size;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      direction: Axis.horizontal,
      children: [
        Container(
          alignment: Alignment.center,
          height: size.circleSize,
          width: size.circleSize,
          decoration: BoxDecoration(color: color.color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: DSTheme.getTextStyle().copyWith(
              fontSize: size.textSize,
              color: const Color(ErifazDSColor.colorTextNeutral50)),
        )
      ],
    );
  }
}

enum StatusLabelColor { neutral, red, green, yellow, blue }

extension StatusLabelColorExt on StatusLabelColor {
  Color get color {
    const hexCodes = [
      ErifazDSColor.colorActionSecondary70,
      ErifazDSColor.colorAccentDanger60,
      ErifazDSColor.colorAccentSuccess80,
      ErifazDSColor.colorAccentWarning60,
      ErifazDSColor.colorAccentInfo70,
    ];
    return Color(hexCodes[index]);
  }
}

enum StatusLabelSize { medium, small }

extension StatusLabelSizeExt on StatusLabelSize {
  double get circleSize {
    const sizes = [
      12.0,
      10.0,
    ];
    return sizes[index];
  }

  double get textSize {
    const sizes = [
      ErifazDSSize.textWebBodyRegularSmFontSize,
      ErifazDSSize.textWebBodyRegularXsFontSize,
    ];
    return sizes[index].toDouble();
  }
}
