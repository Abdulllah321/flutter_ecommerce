import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';

import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../utils/constants/dummy_product_data.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTabs extends StatelessWidget {
  const TCategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              /// -Brands
              const TBrandShowcase(
                images: [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage3,
                ],
              ),

              /// ---Products
              TSectionHeading(
                title: "You might list",
                onButtonPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              TGridView(
                itemCount: dummyProductData.length,
                itemBuilder: (_, index) =>
                    TProductCardVertical(
                      product: dummyProductData[index], // Pass the product data to the widget
                    ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
