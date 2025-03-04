import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/icons/brand_title_with_verified_icons.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../styles/shadows.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/circular_icons.dart';
import '../../images/t_rouded_images.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(TSizes.sm),
      decoration: BoxDecoration(
        boxShadow: [TShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: isDarkMode ? TColors.darkGrey : TColors.white,
      ),
      child: Row(
        children: [
          /// **Thumbnail Image**
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: isDarkMode ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                /// **Product Image**
                const SizedBox(
                  width: 120,
                  height: 120,
                  child: TRoundedImage(
                    imageUrl: TImages.productImage1,
                    applyImageRadius: true,
                  ),
                ),

                /// ** Sale Tag **
                Positioned(
                  top: 12,
                  left: 12, // Ensure proper alignment
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      "25%",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: TColors.black),
                    ),
                  ),
                ),

                /// **Favourite Icon Button**
                const Positioned(
                  top: 0,
                  right: 0, // Corrected missing parameter
                  child: TCircularIcon(
                    icon: Iconsax.heart5,
                    iconColor: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: TSizes.spaceBtwItems),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align left properly
              children: [
                /// Product Title and Brand Section
                const TProductTitleText(
                  title: "MacBook Pro 16",
                  smallSize: true,
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const TBrandTitleWithVerifiedIcon(title: "HP"),
                const SizedBox(height: TSizes.spaceBtwItems),
                /// Pricing and Add-to-Cart Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TProductPriceText(price: '256.01'),
                    Container(
                      decoration: const BoxDecoration(
                        color: TColors.dark,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(TSizes.cardRadiusMd),
                          bottomRight: Radius.circular(TSizes.productImageRadius),
                        ),
                      ),
                      child: const SizedBox(
                        width: TSizes.iconLg * 1.2,
                        height: TSizes.iconLg * 1.2,
                        child: Center(
                          child: Icon(
                            Iconsax.add,
                            color: TColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
