import 'package:flutter/material.dart';
import 'package:ui_ux_pet/constants/app_colors.dart';

class BookingButton extends StatelessWidget {
  const BookingButton(
      {super.key, required String label, Color? backgroundColor})
      : _label = label,
        _backgroundColor =
            backgroundColor ?? const Color(AppColors.primaryColor);

  final String _label;
  final Color _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
