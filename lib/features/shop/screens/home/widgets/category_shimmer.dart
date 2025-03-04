import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/shimmmer_effect.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, index) =>
              const SizedBox(width: TSizes.spaceBtwItems),
          itemBuilder: (_, index) => const Column(
            children: [
              TShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: TSizes.spaceBtwItems),
              TShimmerEffect(width: 55, height: 8),
            ],
          ),
        ));
  }
}
