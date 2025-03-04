import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/t_rouded_images.dart';
import '../../../../common/widgets/products/products_cards/product_card_horizontal.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text("Sports"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// **Banner**
              const TRoundedImage(
                width: double.infinity,
                imageUrl: TImages.promoBanner3, // Ensure this variable exists
                applyImageRadius: true,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// **Sub-Categories**
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// **Heading**
                  TSectionHeading(
                    title: "Sports Shirts",
                    onButtonPressed: () {}, // Add functionality here
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  /// **Horizontal Product List**
                  SizedBox(
                    height: 140, // Set a fixed height for ListView
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, __) => const SizedBox(
                        width: TSizes.defaultSpace/2,
                      ),
                      itemBuilder: (context, index) =>
                          const TProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
