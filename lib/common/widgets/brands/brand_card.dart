import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../icons/brand_title_with_verified_icons.dart';
import '../images/t_circular_image.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    this.showBorder = false,
    this.onPressed,
  });

  final bool showBorder;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onPressed,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            ///Icon
            Flexible(
              child: TCircularImage(
                image: TImages.clothIcon,
                overlayColor: isDarkMode ? TColors.white : TColors.dark,
              ),
            ),

            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),

            ///Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // Aligns content to the start
                mainAxisSize: MainAxisSize.min,
                // Prevents extra vertical space
                children: [
                  const TBrandTitleWithVerifiedIcon(
                    title: "Hp",
                    brandTextSize: TSizes.lg,
                  ),
                  Text(
                    "256 Products",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
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
