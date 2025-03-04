import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/circular_icons.dart';


class TProductQuantityWithAddAndRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddAndRemoveButton({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          size: 32,
          iconSize: TSizes.md,
          iconColor:
          isDarkMode ? TColors.white : TColors.black,
          backgroundColor:
          isDarkMode ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        const Text("1"),
        const SizedBox(width: TSizes.spaceBtwItems),
        const TCircularIcon(
          icon: Iconsax.add,
          size: 32,
          iconSize: TSizes.md,
          iconColor: TColors.white,
          backgroundColor: TColors.primary,
        )
      ],
    );
  }
}
