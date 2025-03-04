import 'package:get/get.dart';
import 'package:t_store/data/repositories/banners/banners_repositories.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../models/banner_model.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  final isLoading = false.obs;
  final _bannersRepository = Get.put(BannersRepository());
  RxList<BannerModel> allBanners = <BannerModel>[].obs;
  RxList<BannerModel> activeBanners = <BannerModel>[].obs;

  @override
  void onInit() {
    getAllBanners();
    super.onInit();
  }

  /// -- Load banners data
  Future<void> getAllBanners() async {
    try {
      // Show loader while loading banners
      isLoading.value = true;

      // Fetch banners from data source
      final banners = await _bannersRepository.getAllBanners();

      // Update the banners list
      allBanners.assignAll(banners);

      // Filter only active banners
      activeBanners.assignAll(
        allBanners.where((banner) => banner.active).toList(),
      );
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
