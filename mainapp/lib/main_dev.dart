import 'package:ui_ux_pet/main.dart';

import 'config/app_config.dart';

void main() {
  bookingLunch(
      appEnvironment: AppEnvironment.dev,
      appName: 'Booking lunch Dev',
      description: 'This is a Development version of Booking lunch app',
      baseUrl: 'https://dev-appname.com/api');
}
