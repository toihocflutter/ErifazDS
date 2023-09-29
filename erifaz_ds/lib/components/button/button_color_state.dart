import 'dart:ui';

import 'package:equatable/equatable.dart';

import '../../foundation/colors.dart';

abstract class ButtonColorState extends Equatable {
  ButtonColorState(
      {required this.isHovered,
      required this.isFocused,
      required this.isDisabled});

  final bool isHovered;
  final bool isFocused;
  final bool isDisabled;

  Color getBackgroundColor();

  @override
  List<Object?> get props => [isHovered, isFocused, isDisabled];

  ButtonColorState copyWith(
      {bool? isHovered, bool? isFocused, bool? isDisabled});
}

class ButtonPrimaryState extends ButtonColorState {
  ButtonPrimaryState(
      {bool isHovered = false, bool isFocused = false, bool isDisabled = false})
      : super(
            isHovered: isHovered, isFocused: isFocused, isDisabled: isDisabled);

  @override
  Color getBackgroundColor() {
    Color backgroundColor = const Color(ErifazDSColor.colorActionPrimary100);
    if (isHovered) {
      backgroundColor = const Color(ErifazDSColor.colorActionPrimary80);
    }
    if (isFocused) {
      backgroundColor = const Color(ErifazDSColor.colorActionPrimary50);
    }
    if (isDisabled) {
      backgroundColor = const Color(ErifazDSColor.colorActionSecondary50);
    }
    return backgroundColor;
  }

  @override
  ButtonColorState copyWith(
      {bool? isHovered, bool? isFocused, bool? isDisabled}) {
    return ButtonPrimaryState(
        isHovered: isHovered ?? this.isHovered,
        isFocused: isFocused ?? this.isFocused,
        isDisabled: isDisabled ?? this.isDisabled);
  }
}
