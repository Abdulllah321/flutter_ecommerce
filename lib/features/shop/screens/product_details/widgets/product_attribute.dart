import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../models/product_attribute_model.dart';



class TProductAttributes extends StatelessWidget {
  final List<ProductAttributeModel> attributes; // List of Product Attributes

  const TProductAttributes({super.key, required this.attributes});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        /// Container with Price & Stock Details
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Variation",
                    style: Theme.of(context).textTheme.headlineSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),

                  /// Column for Price & Stock
                  Column(
                    children: [
                      /// Price Row
                      Row(
                        children: [
                          const TProductTitleText(
                              title: "Price", smallSize: true),
                          const SizedBox(width: TSizes.spaceBtwItems),

                          /// Actual Price
                          Text(
                            "\$25",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.apply(
                                decoration:
                                TextDecoration.lineThrough) ??
                                const TextStyle(
                                    decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),

                          /// Sale Price
                          const TProductPriceText(
                            price: "20",
                            currencySign: "\$", // Required field
                            isLarge: false, // Default size
                            lineThrough: false, // No strike-through
                          ),
                        ],
                      ),

                      /// Stock Row
                      Row(
                        children: [
                          const TProductTitleText(
                              title: "Stock", smallSize: true),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          Text(
                            "In Stock",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// Product Description
              const SizedBox(height: TSizes.spaceBtwItems),
              const TProductTitleText(
                title:
                "This is the Description of the Product and it can go up to max 4 lines",
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),

        /// Dynamic Attributes Section
        const SizedBox(height: TSizes.spaceBtwItems),
        for (var attribute in attributes)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TSectionHeading(title: attribute.name ?? ""), // Display the attribute name (e.g., "Colors", "Sizes")
              const SizedBox(height: TSizes.spaceBtwItems / 2),

              // Dynamic choice chips for attribute values
              Wrap(
                spacing: TSizes.spaceBtwItems,
                children: [
                  // Safely iterate over the list if it's not null
                  for (var value in attribute.values ?? [])
                    TChoiceChip(
                      text: value,
                      selected: false, // You can make this dynamic as well, depending on user selection
                      onSelected: (value) {},
                    ),
                ],
              )

            ],
          ),
      ],
    );
  }
}
