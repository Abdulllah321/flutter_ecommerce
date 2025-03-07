import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/common/widgets/products/products_cards/product_card_vertical_shimmer_effect.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../models/brand_model.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(brand.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              TBrandCard(
                showBorder: true,
                brand: brand,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Sortable Product List
              FutureBuilder(
                  future: controller.getBrandProducts(brand.id),
                  builder: (context, snapshot) {
                    const loader = TVerticalProductShimmer();

                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    final brandProducts = snapshot.data ?? [];
                    return TSortableProducts(
                      products: brandProducts,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
