import 'package:flutter/material.dart';

enum AppEnvironment { dev, staging, prod }

class AppConfig extends InheritedWidget {
  final AppEnvironment appEnvironment;
  final String appName;
  final String description;
  final String baseUrl;
  final ThemeData themeData;
  final Widget child;

  const AppConfig({
    super.key,
    required this.appEnvironment,
    required this.appName,
    required this.description,
    required this.baseUrl,
    required this.themeData,
    required this.child,
  }) : super(child: child);

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
