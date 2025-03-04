import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/common/widgets/products/sortable/sortable_products.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text("Hp")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              TBrandCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSections),

              /// Sortable Product List
              TSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
