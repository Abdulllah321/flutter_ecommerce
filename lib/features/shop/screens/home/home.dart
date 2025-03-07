import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/products/products_cards/product_card_vertical_shimmer_effect.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_carousel.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/utils/constants/dummy_product_data.dart';
import 'package:t_store/utils/constants/sizes.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import 'package:get/get.dart';

import '../../controllers/product/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  const THomeAppBar(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSearchContainer(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: TSizes.defaultSpace,
                        bottom: TSizes.spaceBtwSections),
                    child: Column(
                      children: [
                        ///Heading
                        TSectionHeading(
                          title: "Popular Categories",
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),

                        ///Categories
                        const HomeCategories()
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const HomeCarousel(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSectionHeading(
                    title: "Popular Products",
                    onButtonPressed: () => Get.to(() => AllProducts(
                          title: "Popular Products",
                          futureMethod: controller
                              .fetchAllFeaturedProducts(), // ✅ Pass as reference (without calling it)
                        )),
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  ///Popular Products
                  // ElevatedButton(onPressed: controller.uploaddata, child: Text("Upload Data")),
                  Obx(
                    () {
                      if (controller.isLoading.value)
                        return const TVerticalProductShimmer();

                      if (controller.featuredProducts.isEmpty) {
                        return const Center(child: Text("No products found"));
                      }

                      return TGridView(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) => TProductCardVertical(
                          product: controller.featuredProducts[index],
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
