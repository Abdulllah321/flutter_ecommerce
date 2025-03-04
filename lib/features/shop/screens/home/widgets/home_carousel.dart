import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/home_controller.dart';
import '../../../../../common/widgets/custom_shapes/containers/shimmmer_effect.dart';
import '../../../../../common/widgets/images/t_rouded_images.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../controllers/banner_controller.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final bannerController = Get.put(BannerController());

    return Column(
      children: [
        // Carousel Slider with specified height
        Container(
          height: 150, // Set the height of the carousel
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              onPageChanged: (index, _) => controller.updatePageIndicator(index),
            ),
            items: bannerController.isLoading.value
                ? [
              TShimmerEffect(width: double.infinity, height: 200)
            ] // Wrap it in a list for skeleton loader
                : List.generate(bannerController.activeBanners.length, (index) {
              // Extract the imageUrl from the BannerModel
              final banner = bannerController.activeBanners[index];
              return TRoundedImage(
                imageUrl: banner.imageUrl,
                isNetworkImage: true,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200, // Set the height for individual items
              );
            }),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        // Carousel Indicators
        Obx(
              () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              bannerController.activeBanners.length,
                  (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 6),
                width: controller.carouselCurrentIndex.value == index ? 24 : 8,
                height: 6,
                decoration: BoxDecoration(
                  color: controller.carouselCurrentIndex.value == index
                      ? TColors.primary
                      : TColors.grey,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: controller.carouselCurrentIndex.value == index
                      ? [
                    BoxShadow(
                      color: TColors.primary.withOpacity(0.5),
                      blurRadius: 8,
                      spreadRadius: 2,
                    )
                  ]
                      : [],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
