import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/product/variation_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../models/product_attribute_model.dart';
import 'package:get/get.dart';

class TProductAttributes extends StatelessWidget {
  final ProductModel product; // List of Product Attributes

  const TProductAttributes({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Column(
      children: [

        /// Container with Price & Stock Details
        //Display Variation price and stock when some variation is selected
        Obx(() {
          if (controller.selectedVariation.value.id.isNotEmpty) {
            return TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Variation",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall,
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
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  "\$${controller.selectedVariation.value
                                      .price}",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.apply(
                                      decoration: TextDecoration.lineThrough) ??
                                      const TextStyle(decoration: TextDecoration
                                          .lineThrough),
                                ),
                              const SizedBox(width: TSizes.spaceBtwItems),

                              /// Sale Price
                              TProductPriceText(
                                price: controller.getVariationPrice(),
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
                                controller.variationStockStatus.value,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// Product Description
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TProductTitleText(
                    title: controller.selectedVariation.value.description ?? "",
                    smallSize: true,
                    maxLines: 4,
                  ),
                ],
              ),
            );
          } else
            return const SizedBox(); // Return an empty widget if no variation is selected
        }),

        ///  Attributes Section
        const SizedBox(height: TSizes.spaceBtwItems),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product.productAttributes!
              .map((attribute) =>
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TSectionHeading(title: attribute.name ?? ""),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  // Dynamic choice chips for attribute values
                  Obx(
                        () =>
                        Wrap(
                          spacing: TSizes.spaceBtwItems,
                          children: attribute.values!.map((attributeValue) {
                            final isSelected =
                                controller.selectedAttributes[attribute.name] ==
                                    attributeValue;
                            final available = controller
                                .getAttributesAvailabilityInVariation(
                                product.productVariations!, attribute.name!)
                                .contains(attributeValue);
                            return TChoiceChip(
                              text: attributeValue,
                              selected: isSelected,
                              onSelected: available
                                  ? (selected) {
                                if (selected && available) {
                                  controller.onAttributeSelected(
                                      product,
                                      attribute.name ?? "",
                                      attributeValue);
                                }
                              }
                                  : null,
                            );
                          }).toList(),
                        ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                ],
              ))
              .toList(), // ✅ Convert Iterable to List
        )
      ],
    );
  }
}
