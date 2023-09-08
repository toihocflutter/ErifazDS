import 'package:flutter/material.dart';
import 'package:ui_ux_pet/components/StatusLabel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainActivity(),
    );
  }
}

class MainActivity extends StatelessWidget {
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
