import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_attribute.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:t_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/enums.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Slider Section with dynamic data
            TProductDetailImageSlider(
              product: product,
            ),

            /// Product Detail
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Share Button
                  const TRatingAndShare(),

                  TProductMetaData(
                    product: product,
                  ),

                  /// Attributes
                  // if (product.productType == ProductType.variable.toString())
                    TProductAttributes(
                      product: product,
                    ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Checkout
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Checkout")),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Description Section with dynamic content
                  const TSectionHeading(title: "Description"),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  ReadMoreText(
                    product.description ?? "",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Show More",
                    trimExpandedText: "Less",
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// Reviews
                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Reviews (199)", // Dynamic reviews count
                          style: Theme.of(context).textTheme.headlineSmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        IconButton(
                          onPressed: () =>
                              Get.to(() => const ProductReviewsScreen()),
                          icon: const Icon(Iconsax.arrow_right_3),
                        ),
                      ],
                    ),
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
