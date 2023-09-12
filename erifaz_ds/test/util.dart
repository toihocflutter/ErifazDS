import 'package:flutter/material.dart';

class TestUtils {
  static Widget buildTestWidget(Widget child) {
    return MaterialApp(
      home: Material(
        child: child,
      ),
    );
  }
}
