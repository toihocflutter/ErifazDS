import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_color.dart';

class PlantShopAppTheme {
  static final ThemeData apptheme = ThemeData(
    cupertinoOverrideTheme: const CupertinoThemeData(
      textTheme:
          CupertinoTextThemeData(textStyle: TextStyle(color: Colors.white)),
      brightness: Brightness.dark,
    ),
    splashColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.black,
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
    brightness: Brightness.light,
    primaryColor: AppColor.primary,
    cardColor: Colors.white,
    iconTheme: const IconThemeData(color: Color(0xff046bfb)),
    unselectedWidgetColor: Colors.grey,
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: AppColor.darkGrey,
      labelColor: Colors.blue,
      labelPadding: EdgeInsets.symmetric(vertical: 12),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
    colorScheme: const ColorScheme(
            background: Colors.white,
            onPrimary: Colors.white,
            onBackground: Colors.black,
            onError: Colors.white,
            onSecondary: Colors.white,
            onSurface: Colors.black,
            error: Colors.red,
            primary: Colors.blue,
            secondary: AppColor.secondary,
            surface: Colors.white,
            brightness: Brightness.light)
        .copyWith(background: AppColor.white),
  );
}
