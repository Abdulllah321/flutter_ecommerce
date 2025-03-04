import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authenticatoin/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/signup/success_screen.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../utils/constants/text_strings.dart';
import '../screens/login/login.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: "Email Sent",
          message: "Please Check your inbox and verify your email.");
    } catch (e) {
      TLoaders.errorSnackBar(title: "OnShap!", message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
              title: TTexts.yourAccountCreatedTitle,
              subTitle: TTexts.yourAccountCreatedSubTitle,
              imagePath: TImages.staticSuccessIllustration,
              buttonText: TTexts.tContinue,
              onButtonPressed: (() =>
                  AuthenticationRepository.instance.screenRedirect()),
            ));
      }
    });

    ///Manually Check Email Verified
  }

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await currentUser.reload();
      if (currentUser.emailVerified) {
        Get.off(() => SuccessScreen(
              title: TTexts.yourAccountCreatedTitle,
              subTitle: TTexts.yourAccountCreatedSubTitle,
              imagePath: TImages.staticSuccessIllustration,
              buttonText: TTexts.tContinue,
              onButtonPressed: (() =>
                  AuthenticationRepository.instance.screenRedirect()),
            ));
      }
    }
  }
}
