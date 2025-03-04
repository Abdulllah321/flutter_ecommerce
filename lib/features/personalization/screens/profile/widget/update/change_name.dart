import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/text_strings.dart';
import '../../../../../../utils/validators/validation.dart';
import '../../../../controllers/user/update/update_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangeNameController controller = Get.put(ChangeNameController());
    return Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text(
            "Change Name",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.userFormKey,
            child: Column(children: [
              ///Headings
              const Text(
                  "Use real name for easy verification. this name will appear on several pages"),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              TextFormField(
                controller: controller.firstNameController,
                validator: (value) =>
                    TValidator.validateEmptyText("First Name", value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: TTexts.firstName,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                controller: controller.lastNameController,
                validator: (value) =>
                    TValidator.validateEmptyText("Last Name", value),
                decoration: const InputDecoration(
                  labelText: TTexts.lastName,
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.updateName,
                    child: const Text("Save"),
                  ))
            ]),
          ),
        ));
  }
}
