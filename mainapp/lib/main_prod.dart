import 'package:ui_ux_pet/main.dart';

import 'config/app_config.dart';

Future<void> main() async {
  bookingLunch(
    appEnvironment: AppEnvironment.prod,
    appName: 'Booking lunch',
    description: 'This is a prod version of Booking lunch app',
    baseUrl: 'https://dev-appname.com/api',
  );
}
