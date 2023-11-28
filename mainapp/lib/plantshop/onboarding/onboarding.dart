import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ui_ux_pet/plantshop/const/app_const.dart';
import 'package:ui_ux_pet/plantshop/onboarding/widget/dot_indicator.dart';
import 'package:ui_ux_pet/plantshop/onboarding/widget/next_button.dart';

import '../config/app_color.dart';
import 'onboarding_page.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> onboardPages(BuildContext context) =>
      <Map<String, dynamic>>[
        {'text': appLocalizations(context).firstOnboard, 'image': '1.json'},
        {'text': appLocalizations(context).secondOnboard, 'image': '2.json'},
        {'text': appLocalizations(context).thirdOnboard, 'image': '3.json'}
      ];

  int current = 0;
  final CarouselController _carouselController = CarouselController();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: Text(
              appLocalizations(context).skip,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          CarouselSlider(
            items: onboardPages(context)
                .map((page) => OnboardingPage(
                      data: page,
                    ))
                .toList(),
            carouselController: _carouselController,
            options: CarouselOptions(
                scrollPhysics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                enlargeCenterPage: false,
                aspectRatio: MediaQuery.of(context).size.width /
                    MediaQuery.of(context).size.height,
                onPageChanged: (page, reason) {
                  setState(() {
                    current = page;
                  });
                },
                height: double.maxFinite),
          ),
          DotIndicator(key: widget.key, current: current)
        ],
      ),
      bottomNavigationBar: OnboardingNextButton(
        animationController: _animationController,
        carouselController: _carouselController,
        current: current,
      ),
    );
  }
}
