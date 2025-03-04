import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/text_strings.dart';
import '../../../../../../utils/validators/validation.dart';
import '../../../../controllers/user/update/update_phone_controller.dart';

class ChangePhone extends StatelessWidget {
  const ChangePhone({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangePhoneNumberController controller = Get.put(ChangePhoneNumberController());

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Change Phone Number",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
          key: controller.phoneFormKey,
          child: Column(
            children: [
              /// Headings
              const Text("Ensure your phone number is valid for authentication & notifications."),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Phone Number Input
              TextFormField(
                controller: controller.phoneNumberController,
                keyboardType: TextInputType.phone,
                validator: (value) => TValidator.validatePhoneNumber(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.call),
                  labelText: "Phone Number",
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.updatePhoneNumber,
                  child: const Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
