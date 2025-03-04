import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:t_store/features/authentication/screens/signup/signup.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

import '../../../../../utils/validators/validation.dart';
import '../../../controllers/login_controller.dart'; // ✅ Import Validator

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey, // ✅ Bind Form Key
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
          horizontal: TSizes.spaceBtwItems,
        ),
        child: Column(
          children: [
            // **Email Input**
            TextFormField(
              controller: controller.emailController, // ✅ Bind Controller
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
              validator: TValidator.validateEmail, // ✅ Use Validator
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            // **Password Input**
            Obx(() => TextFormField(
              controller: controller.passwordController, // ✅ Bind Controller
              obscureText: controller.hidePassword.value, // ✅ Toggle Password
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: IconButton(
                  icon: Icon(controller.hidePassword.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye),
                  onPressed: () =>
                  controller.hidePassword.value = !controller.hidePassword.value,
                ),
              ),
              validator: TValidator.validatePassword, // ✅ Use Validator
            )),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            // **Remember Me & Forgot Password**
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // **Remember Me Checkbox**
                Obx(() => Row(
                  children: [
                    Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) =>
                        controller.rememberMe.value = value!),
                    const SizedBox(width: TSizes.sm),
                    const Text(TTexts.rememberMe),
                  ],
                )),
                TextButton(
                    onPressed: () => Get.to(() => const ForgotPassword()),
                    child: const Text(TTexts.forgetPassword))
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // **Login Button**
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.emailAndPasswordSignIn(),
                  child: const Text(TTexts.signIn)),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // **Create Account Button**
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => Get.to(() => const SignupScreen()),
                  child: const Text(TTexts.createAccount)),
            )
          ],
        ),
      ),
    );
  }
}
