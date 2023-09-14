import 'package:flutter/material.dart';
import 'package:ui_ux_pet/main.dart';

import 'config/app_config.dart';

void main() {
  bookingLunch(
    appEnvironment: AppEnvironment.staging,
    appName: 'Booking lunch staging',
    description: 'This is a Staging version of Booking lunch app',
    baseUrl: 'https://dev-appname.com/api',
  );
}
