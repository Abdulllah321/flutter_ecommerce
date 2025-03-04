import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/controllers/user/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/network_manager.dart';
import '../../../../../utils/popups/full_screen_loader.dart';
import '../../../../../utils/popups/loaders.dart';

class ChangeNameController extends GetxController {
  static ChangeNameController get instance => Get.find();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final UserController _userController = UserController.instance;
  final UserRepository _userRepository = UserRepository.instance;
  final GlobalKey<FormState> userFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstNameController.text = _userController.user.value.firstName;
    lastNameController.text = _userController.user.value.lastName;
  }

  Future<void> updateName() async {
    try {
      // Show loading screen
      TFullScreenLoader.openLoadingDialog(
          "We are updating your information...", TImages.docerAnimation);

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
      if (userFormKey.currentState == null ||
          !userFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update Firestore
      Map<String, dynamic> name = {
        "firstName": firstNameController.text.trim(),
        "lastName": lastNameController.text.trim(),
      };
      await _userRepository.updateSingleField(name);

      // Update Local UserController Data
      _userController.user.update((user) {
        if (user != null) {
          user.firstName = firstNameController.text.trim();
          user.lastName = lastNameController.text.trim();
        }
      });

      // Stop loading
      TFullScreenLoader.stopLoading();

      // Show success message
      TLoaders.successSnackBar(
          title: "Congratulations", message: "Your Name has been updated");

      // Delay before navigation (ensure Snack bar is shown)
      await Future.delayed(const Duration(seconds: 1));

      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(
        title: "Data not saved",
        message: e.toString(),
      );
    }
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.onClose();
  }
}
