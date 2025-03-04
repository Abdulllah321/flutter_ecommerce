import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/progress_indicator.dart';

import '../../../../../utils/constants/sizes.dart';


class OverallProductRating extends StatelessWidget {
  const OverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            "4.8",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgressIndicator(
                text: "5",
                value: 1.0,
              ),
              TRatingProgressIndicator(
                text: "4",
                value: 0.8,
              ),
              TRatingProgressIndicator(
                text: "3",
                value: 0.6,
              ),
              TRatingProgressIndicator(
                text: "2",
                value: 0.5,
              ),
              TRatingProgressIndicator(
                text: "1",
                value: 0.1,
              ),
              // Add similar rows for other ratings (4 stars, 3 stars, etc.)
            ],
          ),
        ),
      ],
    );
  }
}

