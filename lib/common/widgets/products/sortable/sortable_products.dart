import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/controllers/product/all_product_controller.dart';

import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/dummy_product_data.dart';
import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../products_cards/product_card_vertical.dart';
import 'package:get/get.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        /// Dropdown for sorting
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
            labelText: "Sort By",
            border: OutlineInputBorder(),
          ),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
           controller.sortProducts(value!);
          },
          items: [
            "Name",
            "Higher Price",
            "Lower Price",
            "Sale",
            "Newest",
            "Popularity"
          ]
              .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
        ),

        const SizedBox(height: TSizes.spaceBtwSections),

        /// Grid Layout for Products
        Obx(() => TGridView(
              itemCount: controller.products.length,
              itemBuilder: (_, index) => TProductCardVertical(
                product: controller
                    .products[index], // Pass the product data to the widget
              ),
            ))
      ],
    );
  }
}
