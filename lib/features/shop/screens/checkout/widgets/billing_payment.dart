import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        /// Section Title with Change Button
        TSectionHeading(
          title: "Payment Method",
          buttonTitle: "Change",
          onButtonPressed: () {
            // Handle payment method change
          },
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// Payment Method Display
        Row(
          children: [
            /// Payment Icon Container
            TRoundedContainer(
              width: 50,
              height: 35,
              backgroundColor: isDarkMode ? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: const Image(
                image: AssetImage(TImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),

            /// Payment Method Text
            Text(
              "PayPal",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}
