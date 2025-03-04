import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_address.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_payment.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace / 2),
      child: Column(
        children: [
          /// Subtotal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Subtotal", style: Theme.of(context).textTheme.bodyMedium),
              Text("\$250.0", style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),

          /// Shipping Fee
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Shipping Fee",
                  style: Theme.of(context).textTheme.bodyMedium),
              Text("\$5.6", style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),

          /// Tax Fee
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tax Fee", style: Theme.of(context).textTheme.bodyMedium),
              Text("\$6.0", style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),

          /// Order Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Order Total",
                  style: Theme.of(context).textTheme.bodyMedium),
              Text("\$261.6", style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

          const Divider(),
          const SizedBox(height: TSizes.spaceBtwItems),
          const TBillingPaymentSection(),

          const Divider(),
          const SizedBox(height: TSizes.spaceBtwItems),
          const TBillingAddressSection(),
          const SizedBox(height: TSizes.spaceBtwItems),
        ],
      ),
    );
  }
}
