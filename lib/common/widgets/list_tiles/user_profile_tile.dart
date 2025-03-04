import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/controllers/user/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../custom_shapes/containers/shimmmer_effect.dart';
import '../images/t_circular_image.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.find<UserController>();

    return Obx(() {
      if (controller.profileLoading.value) {
        return ListTile(
          leading: const TShimmerEffect(width: 50, height: 50, radius: 25),
          title: const TShimmerEffect(width: 100, height: 20),
          subtitle: const TShimmerEffect(width: 150, height: 16),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.edit, color: TColors.white),
          ),
        );
      } else {
        return ListTile(
          leading: Obx(() {
            final networkImage =
                controller.user.value.profilePicture;
            final image = networkImage.isNotEmpty
                ? networkImage
                : TImages.user;
            return controller.imageUploading.value ?
            const TShimmerEffect(width: 50, height: 50, radius: 50,)
                :TCircularImage(
              image: image,
              width: 50,
              height: 50,
              isNetworkImage: networkImage.isNotEmpty,
            );
          }),
          title: Text(
            controller.user.value.fullName,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.white),
          ),
          subtitle: Text(
            controller.user.value.email,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(color: TColors.white),
          ),
          trailing: IconButton(
            onPressed: () => Get.to(() => const ProfileScreen()),
            icon: const Icon(Iconsax.edit, color: TColors.white),
          ),
        );
      }
    });
  }
}
