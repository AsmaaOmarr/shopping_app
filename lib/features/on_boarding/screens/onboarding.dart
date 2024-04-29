import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/features/on_boarding/controller/on_boarding_controller.dart';
import 'package:shopping_app/features/on_boarding/screens/widgets/onboarding_page.dart';
import 'package:shopping_app/features/on_boarding/screens/widgets/onboarding_next_button.dart';
import 'package:shopping_app/features/on_boarding/screens/widgets/onboarding_skip_button.dart';
import 'package:shopping_app/features/on_boarding/screens/widgets/onboarding_navigation_dots.dart';
import 'package:shopping_app/utils/constants/images.dart';
import 'package:shopping_app/utils/constants/texts.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatedPageIndicator,
          children: const [
            OnBoardingPage(
              image: Images.onBoardingImage1,
              title: Texts.onBoardingTitle1,
              subTitle: Texts.onBoordingSubTitlel,
            ),
            OnBoardingPage(
              image: Images.onBoardingImage2,
              title: Texts.onBoardingTitle2,
              subTitle: Texts.onBoardingSubTitle2,
            ),
            OnBoardingPage(
              image: Images.onBoardingImage3,
              title: Texts.onBoordingTitle3,
              subTitle: Texts.onBoardingSubTitle3,
            )
          ],
        ),
        // skip button
        const OnBoardingSkipButton(),
        //navigation smoothPageIndicator
        const OnBoardingNavigationDots(),
        //main button
        const OnBoardingNextButton()
      ],
    ));
  }
}


