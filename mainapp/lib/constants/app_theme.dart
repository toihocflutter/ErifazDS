import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      primarySwatch: Colors.blueGrey,
      primaryColor: const Color(AppColors.primaryColor),
      fontFamily: "NoiGrotesk",
    );
  }
}
