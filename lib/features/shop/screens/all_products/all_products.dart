import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/products/products_cards/product_card_vertical_shimmer_effect.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../controllers/product/all_product_controller.dart';
import '../../models/product_model.dart';
import 'package:get/get.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());

    return Scaffold(
      appBar: TAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductByQuery(query),
              builder: (context, snapshot) {
                const loader = TVerticalProductShimmer(
                  itemCount: 10,
                );
                final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);
                if (widget != null) return widget;

                final products = snapshot.data!;

                return TSortableProducts(
                  products: products,
                );
              }),
        ),
      ),
    );
  }
}
