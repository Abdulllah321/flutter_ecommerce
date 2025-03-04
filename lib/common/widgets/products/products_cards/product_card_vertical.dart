import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/icons/brand_title_with_verified_icons.dart';
import 'package:t_store/common/widgets/images/t_rouded_images.dart';
import 'package:t_store/features/shop/screens/product_details/product_detail.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../styles/shadows.dart';
import '../../icons/circular_icons.dart';
import '../../texts/product_title.dart';
import 'package:get/get.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product; // Accepting ProductModel as a parameter

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(product:product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            ///Thumbnail
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(1),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  ///thumbnailImage
                  TRoundedImage(
                    imageUrl: product.thumbnail,
                    applyImageRadius: true,
                    isNetworkImage: true,
                  ),

                  ///Sale Tag
                  if (product.salePrice <
                      product.price) // Check if the product has a sale
                    Positioned(
                      top: 12,
                      left: 6,
                      child: TRoundedContainer(
                        radius: TSizes.sm,
                        backgroundColor: TColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: TSizes.sm, vertical: TSizes.xs),
                        child: Text(
                          "${((product.price - product.salePrice) / product.price * 100).toStringAsFixed(0)}%",
                          // Calculate the discount percentage
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: TColors.black),
                        ),
                      ),
                    ),

                  /// Favorite Icons Button
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: TCircularIcon(
                          icon: Iconsax.heart5, iconColor: Colors.red)),
                ],
              ),
            ),

            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            ///Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                children: [
                  TProductTitleText(
                    title: product.title,
                    smallSize: true,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  TBrandTitleWithVerifiedIcon(
                    title: product.brand?.name ??
                        '', // Dynamically set the brand name
                  )
                ],
              ),
            ),

            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: Text(
                    "\$${product.salePrice}",
                    // Dynamically set the product sale price
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineMedium,
                    maxLines: 1,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: TColors.dark,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(TSizes.cardRadiusMd),
                          bottomRight:
                              Radius.circular(TSizes.productImageRadius))),
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
