import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/screens/brands/brand_products.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/brands/brand_card_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Brands'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const TSectionHeading(title: "Brands"),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Grid Layout for Brands
              Obx(() {
                if (brandController.isLoading.value) {
                  return const TBrandsShimmer();
                }

                if (brandController.allBrands.isEmpty) {
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
                    itemCount: brandController.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand = brandController.allBrands[index];
                      return TBrandCard(
                        showBorder: true,
                        brand: brand,
                        onPressed: () => Get.to(() => BrandProducts(brand: brand,)),
                      );
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
