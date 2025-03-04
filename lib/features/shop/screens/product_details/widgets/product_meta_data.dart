import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/icons/brand_title_with_verified_icons.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/texts/product_title.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/texts/product_price_text.dart';

class TProductMetaData extends StatelessWidget {
  final String discount;
  final String originalPrice;
  final String productTitle;
  final String status;
  final String brand;
  final String brandLogoUrl;

  const TProductMetaData({
    super.key,
    required this.discount,
    required this.originalPrice,
    required this.productTitle,
    required this.status,
    required this.brand,
    required this.brandLogoUrl,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Discount Badge
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary,
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.sm,
                vertical: TSizes.xs,
              ),
              child: Text(
                discount,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: TColors.black),
              ),
            ),

            const SizedBox(width: TSizes.spaceBtwItems),

            /// Original Price (Strikethrough)
            TProductPriceText(price: originalPrice),
          ],
        ),

        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// Title
        TProductTitleText(title: productTitle),

        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        /// Stack Status
        Row(
          children: [
            const TProductTitleText(title: "Status"),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              status,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        /// Brand
        Row(
          children: [
            TCircularImage(
              image: brandLogoUrl,
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.black,
              isNetworkImage: true,
            ),
            TBrandTitleWithVerifiedIcon(
              title: brand,
              brandTextSize: TSizes.md,
            ),
          ],
        ),
      ],
    );
  }
}
