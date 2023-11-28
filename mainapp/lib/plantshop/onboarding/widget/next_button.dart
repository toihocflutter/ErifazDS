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
          if (current == 2) {
            double rotateValue = Tween<double>(begin: 0, end: 180)
                .animate(CurvedAnimation(
                  curve: Curves.easeOut,
                  parent: animationController,
                ))
                .value;
            double scaleValue = Tween<double>(begin: 1.0, end: 0.5)
                .animate(CurvedAnimation(
                  curve: Curves.easeOut,
                  parent: animationController,
                ))
                .value;
            double slideValue = Tween<double>(begin: 0, end: -120)
                .animate(
                  CurvedAnimation(
                    curve: Curves.easeOut,
                    parent: animationController,
                  ),
                )
                .value;
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Transform.translate(
                  offset: Offset(slideValue, 0),
                  child: Transform.rotate(
                    angle: rotateValue * (3.14159265359 / 180),
                    child: Transform.scale(
                      scale: scaleValue,
                      child: child,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1,
                          color: AppColor.primary,
                        ),
                      ),
                      child: TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   CupertinoPageRoute<Widget>(
                          //     builder: (BuildContext context) => NamePage(
                          //       key: key,
                          //       carouselController: carouselController,
                          //     ),
                          //   ),
                          // );
                        },
                        child: const Text(
                          'Signup',
                          style: TextStyle(
                            color: AppColor.primary,
                            fontSize: 28,
                          ),
                        ),
                      ),
                    ),
                    // sh(15),
                    // FadeInUp(
                    //   child: RichText(
                    //     textAlign: TextAlign.center,
                    //     text: TextSpan(
                    //       children: <TextSpan>[
                    //         TextSpan(
                    //           text: l(context).alreadyAccount,
                    //           style: const TextStyle(
                    //             color: Color.fromARGB(255, 96, 96, 96),
                    //             fontSize: 16,
                    //             fontWeight: FontWeight.w600,
                    //           ),
                    //         ),
                    //         TextSpan(
                    //           text: l(context).login,
                    //           style: const TextStyle(
                    //             color: Colors.blue,
                    //             decoration: TextDecoration.underline,
                    //             fontWeight: FontWeight.w400,
                    //           ),
                    //           recognizer: TapGestureRecognizer()
                    //             ..onTap = () async {
                    //               Navigator.push(
                    //                 context,
                    //                 CupertinoPageRoute<Widget>(
                    //                   builder: (BuildContext context) =>
                    //                       SignInPage(
                    //                     key: key,
                    //                     carouselController: carouselController,
                    //                   ),
                    //                 ),
                    //               );
                    //             },
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            );
          } else {
            return buildButton(context);
          }
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
