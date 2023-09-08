import 'package:flutter/material.dart';
import 'package:ui_ux_pet/components/StatusLabel.dart';
import 'package:ui_ux_pet/foundation/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.getTheme(),
      home: const MainActivity(),
    );
  }
}

class MainActivity extends StatelessWidget {
  const MainActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        SizedBox(height: 50),
        StatusLabel(
          label: "Status Label",
        ),
        SizedBox(height: 10),
        StatusLabel(
          label: "Status Label",
          color: StatusLabelColor.blue,
        )
      ],
    ));
  }
}
