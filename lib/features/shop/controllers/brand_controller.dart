import 'package:get/get.dart';
import 'package:t_store/data/repositories/products/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import '../../../data/repositories/brands/brand_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../models/brand_model.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isLoading = false.obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;

  final BrandRepository brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    super.onInit();
    fetchFeaturedBrands();
  }

  /// Get Brands
  Future<void> fetchFeaturedBrands() async {
    try {
      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();
      allBrands.assignAll(brands);
      featuredBrands.assignAll(
          allBrands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      final brands = await brandRepository.getBrandForCategory(categoryId);
      return brands;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }

  /// Get Brands For Category

  /// Bet Brand Specific Products from your date source
  Future<List<ProductModel>> getBrandProducts(String brandId) async {
    try {
      final products =
          await ProductRepository.instance.getBrandProducts(brandId: brandId);

      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }
}
