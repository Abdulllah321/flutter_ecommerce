import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../address/address.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                TAppBar(
                    title: Text(
                  "Account",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .apply(color: TColors.white),
                )),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const TUserProfileTile(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(title: "Account Settings"),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(
                    icon: Iconsax.home,
                    title: "My Addresses",
                    subtitle: "Set shopping delivery address",
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),

                  const TSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: "My Cart",
                    subtitle: "Add, remove products, and move to checkout",
                  ),

                  const TSettingsMenuTile(
                    icon: Iconsax.box_tick,
                    title: "My Orders",
                    subtitle: "In-progress and completed orders",
                  ),

                  const TSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: "Bank Account",
                    subtitle: "Withdraw balance to registered bank account",
                  ),

                  const TSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: "My Coupons",
                    subtitle: "List of all the discounted coupons",
                  ),

                  const TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: "Notifications",
                    subtitle: "Set any kind of notification message",
                  ),

                  const TSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: "Account Privacy",
                    subtitle: "Manage data usage and connected accounts",
                  ),

                  /// App Settings
                  const SizedBox(height: TSizes.spaceBtwSections),

                  const TSectionHeading(
                      title: "App Settings"),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Load Data",
                    subtitle: "Upload data to your Cloud Firebase",
                    trailing: Switch(value: true, onChanged: (value){}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Safe Mode",
                    subtitle: "Search result is safe for all apps",
                    trailing: Switch(value: false, onChanged: (value){}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: "HD Image Quality",
                    subtitle: "Set image quality to being seen",
                    trailing: Switch(value: false, onChanged: (value){}),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
