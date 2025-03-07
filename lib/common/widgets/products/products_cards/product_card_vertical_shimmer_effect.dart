import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';

import '../../../../utils/constants/sizes.dart';
import '../../custom_shapes/containers/shimmmer_effect.dart';

class TVerticalProductShimmer extends StatelessWidget {
  const TVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridView(
      itemCount: itemCount, // Fixed case sensitivity
      itemBuilder: (_,__) => const SizedBox(
        width: 188,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            TShimmerEffect(width: 180, height: 180),
            SizedBox(height: TSizes.spaceBtwItems), // Fixed typo

            /// Text
            TShimmerEffect(width: 160, height: 15),
            SizedBox(height: TSizes.spaceBtwItems / 2),
            TShimmerEffect(width: 110, height: 15), // Fixed "haight" typo
          ],
        ),
      ),
    );
  }
}
