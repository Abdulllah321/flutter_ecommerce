import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/shimmmer_effect.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';

class TBrandsShimmer extends StatelessWidget {
  const TBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridView(
        mainAxisExtent: 80,
        itemCount: itemCount,
        itemBuilder: (_,__) => const TShimmerEffect(width: 300, height: 80));
  }
}
