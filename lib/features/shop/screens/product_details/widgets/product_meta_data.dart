import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/icons/brand_title_with_verified_icons.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/texts/product_title.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/texts/product_price_text.dart';

class TProductMetaData extends StatelessWidget {
  final ProductModel product;

  const TProductMetaData({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);

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
                salePercentage!,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: TColors.black),
              ),
            ),

            const SizedBox(width: TSizes.spaceBtwItems),

            /// Original Price (Strikethrough)
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text("\$${product.price}",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(decoration: TextDecoration.lineThrough)),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0) SizedBox(width: TSizes.spaceBtwItems,),
            TProductPriceText(price: controller.getProductPrice(product)),
          ],
        ),

        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// Title
        TProductTitleText(title: product.title),

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
              controller.geProductStockStatus(product.stock),
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
              image: product.brand!.image,
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.black,
              isNetworkImage: true,
            ),
            TBrandTitleWithVerifiedIcon(
              title: product.brand!.name,
              brandTextSize: TSizes.md,
            ),
          ],
        ),
      ],
    );
  }
}
