import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/controllers/user/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/network_manager.dart';
import '../../../../../utils/popups/full_screen_loader.dart';
import '../../../../../utils/popups/loaders.dart';

class ChangePhoneNumberController extends GetxController {
  static ChangePhoneNumberController get instance => Get.find();

  final TextEditingController phoneNumberController = TextEditingController();
  final UserController _userController = UserController.instance;
  final UserRepository _userRepository = UserRepository.instance;
  final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializePhoneNumber();
    super.onInit();
  }

  Future<void> initializePhoneNumber() async {
    phoneNumberController.text = _userController.user.value.phoneNumber;
  }

  Future<void> updatePhoneNumber() async {
    try {
      // Show loading screen
      TFullScreenLoader.openLoadingDialog(
          "Updating your phone number...", TImages.docerAnimation);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
            title: "No Internet",
            message: "Please check your internet connection.");
        return;
      }

      // Form Validation
      if (phoneFormKey.currentState == null ||
          !phoneFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update Firestore
      Map<String, dynamic> phone = {
        "phoneNumber": phoneNumberController.text.trim(),
      };
      await _userRepository.updateSingleField(phone);

      // Update Local UserController Data
      _userController.user.update((user) {
        if (user != null) {
          user.phoneNumber = phoneNumberController.text.trim();
        }
      });

      // Stop loading
      TFullScreenLoader.stopLoading();

      // Show success message
      TLoaders.successSnackBar(
          title: "Success", message: "Your phone number has been updated");

      // Delay before navigation (ensure Snack bar is shown)
      await Future.delayed(const Duration(seconds: 1));

      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(
        title: "Error",
        message: e.toString(),
      );
    }
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    super.onClose();
  }
}
