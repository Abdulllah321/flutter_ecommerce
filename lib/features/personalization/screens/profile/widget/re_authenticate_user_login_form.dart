import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/personalization/controllers/user/user_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

import '../../../../../utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.put(UserController());

    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text("Re-Authenticate User"),
      ),
      body: Form(
        key: controller.reAuthFormKey, // ✅ Bind Form Key
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: TSizes.spaceBtwSections,
            horizontal: TSizes.spaceBtwItems,
          ),
          child: Column(
            children: [
              // **Email Input**
              TextFormField(
                controller: controller.verifyEmail, // ✅ Bind Controller
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email,
                ),
                validator: TValidator.validateEmail, // ✅ Use Validator
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
      
              // **Password Input**
              Obx(() => TextFormField(
                controller: controller.verifyPassword, // ✅ Bind Controller
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
      
      
      
              // **Login Button**
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
                    child: const Text(TTexts.signIn)),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
      
            ],
          ),
        ),
      ),
    );
  }
}
