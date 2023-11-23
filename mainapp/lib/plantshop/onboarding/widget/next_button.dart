import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_ux_pet/plantshop/config/app_color.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton(
      {super.key,
      required this.current,
      required this.carouselController,
      required this.animationController});

  final int current;
  final CarouselController carouselController;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80.0),
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return buildButton(context);
        },
        child: buildButton(context),
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return Hero(
        tag: "back_next",
        child: GestureDetector(
          onTap: () {
            HapticFeedback.mediumImpact();
            carouselController.jumpToPage(current + 1);
            animationController.forward(from: 0.0);
          },
          child: ScaleTransition(
            scale: Tween<double>(begin: 1.0, end: 1.1).animate(CurvedAnimation(
              parent: animationController,
              curve: Curves.easeOut,
            )),
            child: RotationTransition(
              turns: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  curve: Curves.easeOut,
                  parent: animationController,
                ),
              ),
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColor.primary),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: AppColor.white,
                  size: 45,
                ),
              ),
            ),
          ),
        ));
  }
}
