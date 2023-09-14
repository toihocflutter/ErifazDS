import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final double? height;

  const LoadingView({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: const SizedBox(
        width: 35,
        height: 35,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
