import 'package:flutter/material.dart';
import 'package:ui_ux_pet/constants/app_colors.dart';

class BookingButton extends StatelessWidget {
  const BookingButton(
      {super.key,
      required String label,
      Color? backgroundColor,
      VoidCallback? onPressed})
      : _label = label,
        _backgroundColor =
            backgroundColor ?? const Color(AppColors.primaryColor),
        _onPressed = onPressed;

  final String _label;
  final Color _backgroundColor;
  final VoidCallback? _onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      onLongPress: () {},
      onFocusChange: (value) {},
      onHover: (value) {},
      style: ElevatedButton.styleFrom(
        backgroundColor: _backgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
      child: Text(
        _label,
        style: const TextStyle(color: Color(AppColors.primaryTextColor)),
      ),
    );
  }
}
