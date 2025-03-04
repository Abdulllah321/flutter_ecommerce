import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/dummy_product_data.dart';
import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../products_cards/product_card_vertical.dart';


class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown for sorting
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
            labelText: "Sort By",
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            // Handle sorting logic
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
        TGridView(
          itemCount: dummyProductData.length,
          itemBuilder: (_, index) => TProductCardVertical(
            product: dummyProductData[index], // Pass the product data to the widget
          ),
        )
      ],
    );
  }
}
