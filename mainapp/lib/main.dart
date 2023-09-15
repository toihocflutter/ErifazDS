import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_ux_pet/constants/app_theme.dart';

import 'config/app_bloc_observer.dart';
import 'config/app_config.dart';
import 'features/main/booking_lunch_app.dart';

void bookingLunch(
    {required AppEnvironment appEnvironment,
    required String appName,
    required String description,
    required String baseUrl}) {
  Bloc.observer = const AppBlocObserver();
  var appConfig = AppConfig(
    appEnvironment: appEnvironment,
    appName: appName,
    description: description,
    baseUrl: baseUrl,
    themeData: AppTheme.getAppTheme(),
    child: BookingLunchApp(),
  );
  runZonedGuarded(
    () => runApp(appConfig),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
