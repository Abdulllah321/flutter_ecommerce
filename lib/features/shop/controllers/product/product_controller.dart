import 'package:get/get.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/dummy_product_data.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../../data/repositories/products/product_repository.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final ProductRepository productRepository = Get.put(ProductRepository()); // Register here


  RxBool isLoading = false.obs;
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFeaturedProducts();
  }

  void uploadData() async {
    try {
      await productRepository.uploadDummyProducts(dummyProductData);
    } catch (e) {
      print(e);
    }
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      final products = await productRepository.getFeaturedProducts();
      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //Get All featured Products
  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      final products = await productRepository.getAllFeaturedProducts();
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double latgestPrice = 0.0;
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      for (var variation in product.productVariations!) {
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > latgestPrice) {
          latgestPrice = priceToConsider;
        }
      }
    }

    if (smallestPrice.isEqual(latgestPrice)) {
      return latgestPrice.toString();
    } else {
      return '$smallestPrice - \$$latgestPrice';
    }
  }

  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || originalPrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = (originalPrice - salePrice) / originalPrice * 100;
    return '${percentage.toStringAsFixed(0)}%';
  }

  String geProductStockStatus(int stock) {
    return stock > 0 ? "In Stock" : "Out of Stock";
  }
}
