import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/controllers/product/images_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/circular_icons.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TProductDetailImageSlider extends StatelessWidget {
  final ProductModel product;

  const TProductDetailImageSlider({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [

            /// 🖼️ Main Product Image with Gesture Swipe
            GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! < 0) {
                  // Swiped Left → Next Image
                  controller.nextImage();
                } else if (details.primaryVelocity! > 0) {
                  // Swiped Right → Previous Image
                  controller.prevImage();
                }
              },
              child: SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(
                    child: Obx(() {
                      final mainImageUrl =
                          controller.selectedProductImage.value;
                      return GestureDetector(
                        onTap: () => controller.showEnlargedImage(mainImageUrl),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder: (child, animation) =>
                              FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                          child: CachedNetworkImage(
                            key: ValueKey(mainImageUrl),
                            imageUrl: mainImageUrl,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder:
                                (_, __, downloadProgress) =>
                                CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                  color: TColors.primary,
                                ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),

            /// 🖼️ Animated Image Slider
            Positioned(
              bottom: TSizes.defaultSpace,
              left: TSizes.defaultSpace,
              right: TSizes.defaultSpace,
              child: SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                  const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (_, index) =>
                      Obx(() {
                        var isSelected =
                            controller.selectedProductImage.value ==
                                images[index];

                        return GestureDetector(
                          onTap: () {
                            if (isSelected) {
                              controller.showEnlargedImage(images[index]);
                            } else {
                              controller.selectedProductImage.value =
                              images[index];
                            }
                          },

                          onDoubleTap: () {
                            controller.selectedProductImage.value =
                            images[index];
                            controller.showEnlargedImage(images[index]);
                          },

                          onLongPress: () {
                            controller.selectedProductImage.value =
                            images[index];
                            controller.showEnlargedImage(images[index]);
                          },

                          child:
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            width: 90,
                            padding: const EdgeInsets.all(TSizes.sm),
                            decoration: BoxDecoration(
                              color: dark ? TColors.dark : TColors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: isSelected
                                    ? TColors.primary
                                    : Colors.transparent,
                                width: isSelected ? 3 : 1,
                              ),
                              boxShadow: isSelected
                                  ? [
                                BoxShadow(
                                  color: TColors.primary.withOpacity(0.5),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ]
                                  : [],
                            ),
                            child: CachedNetworkImage(
                                imageUrl: images[index], fit: BoxFit.cover)
                            ,
                          )
                          ,
                        );
                      }),
                ),
              ),
            ),

            /// 🔙 AppBar Icons
            const TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(icon: Iconsax.heart5, iconColor: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
