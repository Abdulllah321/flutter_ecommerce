import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/validators/validation.dart';

import '../../controllers/forget_password_controller.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ForgetPasswordController());

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
          Form(
            key: controller.formKey,
            child: TextFormField(
              controller: controller.email,
              validator: TValidator.validateEmail,
              decoration: const InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Icons.email),
              ),
            ),
          ),

          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          ///Buttons
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.sendPasswordResetEmail(),
                  child: const Text(TTexts.submit)))
        ]),
      ),
    );
  }
}
