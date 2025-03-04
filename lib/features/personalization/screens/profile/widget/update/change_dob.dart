import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/user/update/update_dob_controller.dart';

class ChangeDOBScreen extends StatelessWidget {
  const ChangeDOBScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangeDOBController controller = Get.put(ChangeDOBController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          "Change Date of Birth",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            const Text("Select your date of birth below:"),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// DOB Selection
            Obx(() => ListTile(
                  title: Text(
                    controller.selectedDOB.value.isNotEmpty
                        ? controller.selectedDOB.value
                        : "Select Date of Birth",
                    style: TextStyle(
                      color: controller.selectedDOB.value.isNotEmpty
                          ? dark
                              ? TColors.light
                              : TColors.dark
                          : TColors.grey, // Grey if not selected
                    ),
                  ),
                  leading: const Icon(Iconsax.calendar),
                  onTap: () => controller.pickDate(context),
                )),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.saveDOB,
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
