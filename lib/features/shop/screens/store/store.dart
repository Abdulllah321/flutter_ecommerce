import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/appbar/tabbar.dart';
import 'package:t_store/common/widgets/brands/brand_card_shimmer.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/brands/all_brands.dart';
import 'package:t_store/features/shop/screens/store/widget/category_tabs.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../controllers/brand_controller.dart';
import 'package:get/get.dart';

import '../brands/brand_products.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: const Text("Store"),
          actions: [TCartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.black
                      : TColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ///Searchbar
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        const TSearchContainer(
                          hintText: "Search in Store",
                          showBorder: true,
                          showBackground: false,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),

                        /// -- Featured Brands
                        TSectionHeading(
                          title: "Featured Brands",
                          onButtonPressed: () => Get.to(() => AllBrandsScreen()),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems / 1.5,
                        ),

                        ///Brands Grid
                        Obx(() {
                          if (brandController.isLoading.value) {
                            return const TBrandsShimmer();
                          }

                          if (brandController.featuredBrands.isEmpty) {
                            return Center(
                              child: Text(
                                "No Data Found!",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(color: TColors.white),
                              ),
                            );
                          }

                          return TGridView(
                              itemCount: brandController.featuredBrands.length,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                final brand =
                                    brandController.featuredBrands[index];
                                return TBrandCard(
                                  showBorder: true,
                                  onPressed: () => Get.to(() => BrandProducts(brand: brand,)),
                                  brand: brand,
                                );
                              });
                        })
                      ],
                    ),
                  ),
                  bottom: const TTabBar(tabs: [
                    Tab(
                      child: Text("Sport"),
                    ),
                    Tab(
                      child: Text("Furniture"),
                    ),
                    Tab(
                      child: Text("Electronics"),
                    ),
                    Tab(
                      child: Text("Clothes"),
                    ),
                    Tab(
                      child: Text("Sport"),
                    ),
                  ]),
                )
              ];
            },
            body: const TabBarView(children: [
              TCategoryTabs(),
              TCategoryTabs(),
              TCategoryTabs(),
              TCategoryTabs()
            ])),
      ),
    );
  }
}
