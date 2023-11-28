import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.data});

  final Map<String, dynamic> data;

  String formatSentence(String text) {
    List<String> textSplit = text.split(" ");
    return "${textSplit.sublist(0, textSplit.length - 1).join(" ")} ";
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(
        height: MediaQuery.of(context).size.height / 7,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 2.5,
        child: FadeIn(
            duration: const Duration(seconds: 1),
            child: Lottie.asset(
              "assets/animation/${data["image"]}",
              fit: BoxFit.contain,
            )),
      ),
      const SizedBox(
        height: 50,
      ),
      FadeInLeft(
        child: FadeInUp(
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: formatSentence(data["text"]),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 40,
                  )),
              TextSpan(
                  text: (data["text"].toString().split(" ").last),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 40,
                  )),
            ]),
          ),
        ),
      ),
    ]);
  }
}
