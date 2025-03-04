import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TOrderListScreen extends StatelessWidget {
  const TOrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);

    return ListView.builder(
      itemCount: 5, // Change this to your actual order count
      padding: const EdgeInsets.all(TSizes.md),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
          padding: const EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
            color: isDarkMode ? TColors.dark : TColors.light,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// **Row 1: Order Status & Date**
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// **1- Icon**
                  Row(
                    children: [
                      const Icon(Iconsax.ship),
                      const SizedBox(width: TSizes.spaceBtwItems / 2),

                      /// **2- Status & Date**
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Processing",
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: TColors.primary, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "10 Nov 2024",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.arrow_right_3),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// **Row 2: Order Details & Shipping Date**
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// **Order ID Section**
                  Row(
                    children: [
                      /// **1- Icon**
                      const Icon(Iconsax.tag),
                      const SizedBox(width: TSizes.spaceBtwItems / 2),

                      /// **2- Order ID**
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            "#2562",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// **Shipping Date Section**
                  Row(
                    children: [
                      /// **1- Icon**
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: TSizes.spaceBtwItems / 2),

                      /// **2- Shipping Date**
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Shipping Date",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            "10 Nov 2024",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
