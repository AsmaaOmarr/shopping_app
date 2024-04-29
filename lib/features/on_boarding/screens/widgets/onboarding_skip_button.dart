import 'package:flutter/material.dart';
import 'package:shopping_app/features/on_boarding/controller/on_boarding_controller.dart';
import 'package:shopping_app/utils/devices/device_utility.dart';
import 'package:shopping_app/utils/constants/sizes.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: DeviceUtility.getAppBarHeight(),
        right: Sizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text('Skip'),
        ));
  }
}


