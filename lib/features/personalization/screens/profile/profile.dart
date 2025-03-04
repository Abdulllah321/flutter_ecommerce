import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/shimmmer_effect.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/screens/profile/widget/update/change_dob.dart';
import 'package:t_store/features/personalization/screens/profile/widget/update/change_gender.dart';
import 'package:t_store/features/personalization/screens/profile/widget/update/change_name.dart';
import 'package:t_store/features/personalization/screens/profile/widget/profile_menu.dart';
import 'package:t_store/features/personalization/screens/profile/widget/update/change_phonenumber.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../controllers/user/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Obx(() {
                            final networkImage =
                                controller.user.value.profilePicture;
                            final image = networkImage.isNotEmpty
                                ? networkImage
                                : TImages.user;
                            return controller.imageUploading.value ?
                            TShimmerEffect(width: 80, height: 80, radius: 80,)
                                :TCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                          }),
                          TextButton(
                              onPressed: () =>
                                  controller.uploadUserProfilePicture(),
                              child: const Text("Change Profile Picture")),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections / 2,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    const TSectionHeading(title: "Profile Information"),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    TProfileMenu(
                        title: "Name",
                        value: controller.user.value.fullName,
                        onPressed: () => Get.to(() => const ChangeName())),
                    TProfileMenu(
                      title: "Username",
                      value: controller.user.value.username,
                      onPressed: () {},
                      icon: Iconsax.lock,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections / 2,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    const TSectionHeading(
                        title: "Personal Information Information"),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    /// Profile Details
                    TProfileMenu(
                      title: "User ID",
                      value: controller.user.value.id,
                      onPressed: () async {
                        await Clipboard.setData(
                            ClipboardData(text: controller.user.value.id));
                        Get.snackbar(
                          "Copied!",
                          "User ID copied to clipboard",
                          snackPosition: SnackPosition.BOTTOM,
                          duration: const Duration(seconds: 2),
                        );
                      },
                      icon: Iconsax.copy,
                    ),
                    TProfileMenu(
                      title: "E-mail",
                      value: controller.user.value.email,
                      onPressed: () {},
                      icon: Iconsax.lock,
                    ),

                    TProfileMenu(
                        title: "Phone Number",
                        value: controller.user.value.phoneNumber,
                        onPressed: () => Get.to(() => const ChangePhone())),

                    TProfileMenu(
                      title: "Gender",
                      value: (controller.user.value.gender ?? "").isEmpty
                          ? "Not Provided"
                          : controller.user.value.gender!,
                      // Ensure non-null value
                      onPressed: () => Get.to(() => const ChangeGenderScreen()),
                      valueStyle: TextStyle(
                        fontStyle:
                            (controller.user.value.gender ?? "").isNotEmpty
                                ? FontStyle.normal
                                : FontStyle.italic, // Italic if "Not Provided"
                      ),
                    ),

                    TProfileMenu(
                      title: "Date of Birth",
                      value: (controller.user.value.dob != null)
                          ? controller.user.value.dob
                              .toString() // Convert to String
                          : "Not Provided",
                      onPressed: () => Get.to(() => const ChangeDOBScreen()),
                      valueStyle: TextStyle(
                        // Grey if "Not Provided"
                        fontStyle: (controller.user.value.dob != null)
                            ? FontStyle.normal
                            : FontStyle.italic, // Italic if "Not Provided"
                      ),
                    ),

                    const Divider(),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    Center(
                        child: TextButton(
                      onPressed: () => controller.deleteAccountWarningPopup(),
                      child: const Text(
                        "Close Account",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
