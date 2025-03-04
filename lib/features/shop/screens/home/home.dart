import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_carousel.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/utils/constants/sizes.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(

              child: Column(
                children: [
                  THomeAppBar(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSearchContainer(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace, bottom: TSizes.spaceBtwSections),
                    child: Column(
                      children: [
                        ///Heading
                        TSectionHeading(
                          title: "Popular Categories",
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),

                        ///Categories
                        HomeCategories()
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

                  ///Popular Products

                  TGridView(
                    itemCount: 10,
                    itemBuilder: (_, index) => const TProductCardVertical(),
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
