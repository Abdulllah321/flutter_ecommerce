import 'package:flutter/material.dart';
import 'package:t_store/data/repositories/authenticatoin/authentication_repository.dart';
import 'package:t_store/features/authentication/controllers/verify_email_controller.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/signup/success_screen.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(Icons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(TImages.deliveredEmailIllustration),
                width: THelperFunctions.screenWidth() * 0.6,
              ),

              ///Title & SubTitle
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                TTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                TTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              ///Buttons
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerificationStatus(),
                    child: const Text(TTexts.tContinue)),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => controller.sendEmailVerification(),
                    child: const Text(TTexts.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
