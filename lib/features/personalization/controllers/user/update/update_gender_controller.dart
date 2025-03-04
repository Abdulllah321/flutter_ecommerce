import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/controllers/user/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/network_manager.dart';
import '../../../../../utils/popups/full_screen_loader.dart';
import '../../../../../utils/popups/loaders.dart';

class ChangeGenderController extends GetxController {
  static ChangeGenderController get instance => Get.find();

  final RxString selectedGender = "".obs;
  final UserController _userController = UserController.instance;
  final UserRepository _userRepository = UserRepository.instance;

  @override
  void onInit() {
    selectedGender.value = _userController.user.value.gender ?? "";
    super.onInit();
  }

  void updateGender(String? gender) {
    if (gender != null) {
      selectedGender.value = gender;
    }
  }

  Future<void> saveGender() async {
    try {
      // Show loading
      TFullScreenLoader.openLoadingDialog(
          "Updating your gender...", TImages.docerAnimation);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
            title: "No Internet",
            message: "Please check your internet connection.");
        return;
      }

      // Update Firestore
      Map<String, dynamic> genderData = {"gender": selectedGender.value};
      await _userRepository.updateSingleField(genderData);

      // Update Local User Data
      _userController.user.update((user) {
        if (user != null) {
          user.gender = selectedGender.value;
        }
      });

      // Stop loading
      TFullScreenLoader.stopLoading();

      // Show success message
      TLoaders.successSnackBar(
          title: "Updated", message: "Your gender has been updated.");

      // Delay before navigation
      await Future.delayed(const Duration(seconds: 1));

      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }
}
