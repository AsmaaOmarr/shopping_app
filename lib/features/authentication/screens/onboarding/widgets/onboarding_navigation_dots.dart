import 'package:flutter/material.dart';
import 'package:shopping_app/features/authentication/controllers/on_boarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shopping_app/units/devices/device_utility.dart';
import 'package:shopping_app/units/constants/sizes.dart';
import 'package:shopping_app/units/constants/colors.dart';

class OnBoardingNavigationDots extends StatelessWidget {
  const OnBoardingNavigationDots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    
    return Positioned(
      bottom: DeviceUtility.getBottomNavigationBarHeight() + 25,
      left: Sizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: const ExpandingDotsEffect(
            activeDotColor: AppColors.dark, dotHeight: 6),
      ),
    );
  }
}
