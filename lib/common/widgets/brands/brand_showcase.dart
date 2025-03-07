import 'package:flutter/material.dart';
import 'package:t_store/features/shop/models/brand_model.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkerGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: const EdgeInsets.all(TSizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Ensures left alignment
        children: [
           TBrandCard(brand: BrandModel.empty,),

          /// Row for brand top product images
          Row(
            children: images
                .map((e) => brandTopProductImagesWidget(e, context))
                .expand((widget) => [
              widget,
              const SizedBox(width: TSizes.sm), // Add spacing between items
            ])
                .toList()
              ..removeLast(), // Remove the last SizedBox to avoid extra space
          ),

        ],
      ),
    );
  }

  Widget brandTopProductImagesWidget(String image, BuildContext context) {
    final bool isDarkMode = THelperFunctions.isDarkMode(context);

    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: isDarkMode ? TColors.darkerGrey : TColors.light,
        padding: const EdgeInsets.all(TSizes.md),
      
        /// Image should not be `const` since `image` is dynamic
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image), // Make sure `image` is a valid asset path
        ),
      ),
    );
  }
}
