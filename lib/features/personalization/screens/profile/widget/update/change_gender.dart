import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/user/update/update_gender_controller.dart';

class ChangeGenderScreen extends StatelessWidget {
  const ChangeGenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangeGenderController controller = Get.put(ChangeGenderController());

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Change Gender",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            const Text("Select your gender from the options below:"),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Gender Selection
            Obx(() => Column(
              children: [
                RadioListTile<String>(
                  title: const Text("Male"),
                  value: "Male",
                  groupValue: controller.selectedGender.value,
                  onChanged: (value) => controller.updateGender(value),
                ),
                RadioListTile<String>(
                  title: const Text("Female"),
                  value: "Female",
                  groupValue: controller.selectedGender.value,
                  onChanged: (value) => controller.updateGender(value),
                ),
                RadioListTile<String>(
                  title: const Text("Other"),
                  value: "Other",
                  groupValue: controller.selectedGender.value,
                  onChanged: (value) => controller.updateGender(value),
                ),
              ],
            )),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.saveGender,
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
