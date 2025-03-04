import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/icons/brand_title_with_verified_icons.dart';
import '../../../../../common/widgets/images/t_rouded_images.dart';
import '../../../../../common/widgets/texts/product_title.dart';

class ProductCartItem extends StatelessWidget {
  final bool showAddRemoveButtons;

  const ProductCartItem({super.key, this.showAddRemoveButtons = true});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        /// Product Image
        TRoundedImage(
          imageUrl: TImages.productImage1, // Example image
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: isDarkMode ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        /// Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Brand Title
              const TBrandTitleWithVerifiedIcon(title: "Hp"),
              const SizedBox(height: TSizes.spaceBtwItems / 2),

              /// Product Title
              const TProductTitleText(
                title: "Black Gaming Laptop",
                maxLines: 1,
              ),

              /// Attributes: Color & Size
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Color: ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: "Green",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: " | Size: UK 08",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        /// Add/Remove Buttons (if enabled)
        if (showAddRemoveButtons)
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  // Handle quantity decrease
                },
              ),
              const Text(
                "1", // Example static quantity, replace with state management
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  // Handle quantity increase
                },
              ),
            ],
          ),
      ],
    );
  }
}
