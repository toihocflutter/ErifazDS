import 'package:erifaz_ds/components/status_label.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Define the default brightness and colors.
        fontFamily: "NoiGrotesk",
      ),
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
        ),
        SizedBox(height: 10),
        StatusLabel(
          label: "Status Label",
          color: StatusLabelColor.green,
        ),
        SizedBox(height: 10),
        StatusLabel(
          label: "Status Label",
          color: StatusLabelColor.yellow,
        ),
      ],
    ));
  }
}
