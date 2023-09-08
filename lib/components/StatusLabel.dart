import 'package:flutter/material.dart';
import 'package:ui_ux_pet/foundation/colors.dart';

class StatusLabel extends StatelessWidget {
  const StatusLabel(
      {Key? key, required this.label, this.color = StatusLabelColor.neutral})
      : super(key: key);

  final String label;

  final StatusLabelColor color;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(color: color.color, shape: BoxShape.circle),
        ),
        Text(label)
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
  int get circleSize {
    const sizes = [
      12,
      10,
    ];
    return sizes[index];
  }

  int get textSize {
    const sizes = [
      12,
      10,
    ];
    return sizes[index];
  }
}
