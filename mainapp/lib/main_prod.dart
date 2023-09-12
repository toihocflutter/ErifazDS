import 'package:flutter/material.dart';
import 'package:ui_ux_pet/main.dart';

import 'config/app_config.dart';

void main() {
  var appConfig = AppConfig(
    appEnvironment: AppEnvironment.prod,
    appName: 'Booking lunch',
    description: 'This is a prod version of Booking lunch app',
    baseUrl: 'https://dev-appname.com/api',
    themeData: ThemeData(
      primarySwatch: Colors.red,
      primaryColor: Colors.blueGrey,
      fontFamily: "NoiGrotesk",
    ),
    child: const MyApp(),
  );
  runApp(appConfig);
}
