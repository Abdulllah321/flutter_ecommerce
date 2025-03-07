import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/constants/sizes.dart';
import '../../../../common/widgets/images/full_screen_image_viewer.dart';
import '../../models/product_model.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  RxString selectedProductImage = ''.obs;
  List<String> productImages = [];

  /// 🔄 Load All Images
  List<String> getAllProductImages(ProductModel product) {
    Set<String> imagesSet = {};
    imagesSet.add(product.thumbnail);
    selectedProductImage.value = product.thumbnail;

    if (product.images != null) imagesSet.addAll(product.images!);
    if (product.productVariations != null &&
        product.productVariations!.isNotEmpty) {
      imagesSet.addAll(
          product.productVariations!.map((variation) => variation.image));
    }
    productImages = imagesSet.toList();
    return productImages;
  }

  /// 🔄 Swipe Left → Next Image
  void nextImage() {
    int currentIndex = productImages.indexOf(selectedProductImage.value);
    int nextIndex =
        (currentIndex + 1) % productImages.length; // Loops back to 0
    selectedProductImage.value = productImages[nextIndex];
  }

  /// 🔄 Swipe Right → Previous Image
  void prevImage() {
    int currentIndex = productImages.indexOf(selectedProductImage.value);
    int prevIndex = (currentIndex - 1 + productImages.length) %
        productImages.length; // Loops back to last image
    selectedProductImage.value = productImages[prevIndex];
  }

  /// 🔍 Show Fullscreen Image
  void showEnlargedImage(String image) {
    int initialIndex = productImages.indexOf(image);

    Get.to(
      () => FullScreenImageViewer(
        images: productImages,
        initialIndex: initialIndex,
      ),
      fullscreenDialog: true,
    );
  }
}
