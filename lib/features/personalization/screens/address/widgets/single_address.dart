import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';

class TSingleAddress extends StatelessWidget {
  final bool selectedAddress;

  const TSingleAddress({super.key, required this.selectedAddress});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TRoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(TSizes.md),
      width: double.infinity,
      backgroundColor: selectedAddress
          ? TColors.primary.withOpacity(0.65)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
          ? TColors.darkerGrey
          : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          /// Selected Address Icon (Tick)
          if (selectedAddress)
            Positioned(
              right: 5,
              top: 5,
              child: Icon(
                Iconsax.tick_circle,
                color: dark ? TColors.light : TColors.dark.withOpacity(0.8),
              ),
            ),

          /// Address Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Name
              Text(
                "John Doe",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),

              const SizedBox(height: TSizes.sm / 2),

              /// Phone Number
              const Text(
                "(+123) 456 7890",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: TSizes.sm / 2),

              /// Address
              const Text(
                "82356 Timmy Coves, South Liana, Maine, 87665, USA",
                softWrap: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
