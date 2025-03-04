import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/controllers/onboarding_controller.dart';
import 'package:t_store/features/authentication/screens/onboarding/widget/onboarding_Indicator.dart';
import 'package:t_store/features/authentication/screens/onboarding/widget/onboarding_next_button.dart';
import 'package:t_store/features/authentication/screens/onboarding/widget/onboarding_page.dart';
import 'package:t_store/features/authentication/screens/onboarding/widget/onboarding_skip.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final controller = Get.put(onBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          //horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              onBoardingPage(
                  image: TImages.onBoardingImage1,
                  title: TTexts.onBoardingTitle1,
                  subtitle: TTexts.onBoardingSubTitle1),
              onBoardingPage(
                  image: TImages.onBoardingImage2,
                  title: TTexts.onBoardingTitle2,
                  subtitle: TTexts.onBoardingSubTitle2),
              onBoardingPage(
                  image: TImages.onBoardingImage3,
                  title: TTexts.onBoardingTitle3,
                  subtitle: TTexts.onBoardingSubTitle3),
            ],
          ),

          const OnBoardingSkip(),

          const onBoardingIndicator(),

          const onBoardingNextButton()
        ],
      ),
    );
  }
}

