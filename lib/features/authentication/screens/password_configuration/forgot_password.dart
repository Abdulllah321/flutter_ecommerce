import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ///Headings
          Text(
            TTexts.forgetPasswordTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Text(
            TTexts.forgetPasswordSubTitle,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections * 2,
          ),

          ///Text Fields
          TextFormField(
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Icons.email),
            ),
          ),

          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          ///Buttons
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.to(() => const ResetPasswordScreen()),
                  child: const Text(TTexts.submit)))
        ]),
      ),
    );
  }
}
