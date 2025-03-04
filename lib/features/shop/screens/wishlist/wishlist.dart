import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/icons/circular_icons.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../utils/constants/dummy_product_data.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(
            icon: Iconsax.add, onPressed: ()=>Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TGridView(
              itemCount: dummyProductData.length,
              itemBuilder: (_, index) => TProductCardVertical(
                product: dummyProductData[index], // Pass the product data to the widget
              ),
            )

          ],
        ),),
      ),
    );
  }
}
