import 'package:get/get.dart';
import 'package:t_store/data/repositories/categories/categories_repositories.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoriesRepository = Get.put(CategoriesRepositories());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    getAllCategories();
    super.onInit();
  }

  /// -- Load categories data
  Future<void> getAllCategories() async {
    try {
      //Show loader while loading categories
      isLoading.value = true;

      //fetch categories from data source
      final categories = await _categoriesRepository.getAllCategories();

      //Update the categories list
      allCategories.assignAll(categories);

      //Filter featured categories
      featuredCategories.assignAll(
        allCategories
            .where(
                (category) => category.isFeatured && category.parentId.isEmpty)
            .toList(),
      );
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally{
      isLoading.value = false;
    }
  }
}
