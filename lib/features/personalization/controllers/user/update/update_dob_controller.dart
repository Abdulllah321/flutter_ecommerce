import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/controllers/user/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/network_manager.dart';
import '../../../../../utils/popups/full_screen_loader.dart';
import '../../../../../utils/popups/loaders.dart';

class ChangeDOBController extends GetxController {
  static ChangeDOBController get instance => Get.find();

  final RxString selectedDOB = "".obs;
  final UserController _userController = UserController.instance;
  final UserRepository _userRepository = UserRepository.instance;

  @override
  void onInit() {
    selectedDOB.value = _userController.user.value.dob != null
        ? DateFormat("yyyy-MM-dd").format(_userController.user.value.dob!)
        : "";
    super.onInit();
  }

  /// Pick Date from DatePicker
  Future<void> pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      selectedDOB.value = DateFormat("yyyy-MM-dd").format(pickedDate);
    }
  }

  /// Save DOB to Firebase
  Future<void> saveDOB() async {
    try {
      // Show loading
      TFullScreenLoader.openLoadingDialog(
          "Updating your date of birth...", TImages.docerAnimation);

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
      Map<String, dynamic> dobData = {"dob": selectedDOB.value};
      await _userRepository.updateSingleField(dobData);

      // Update Local User Data
      _userController.user.update((user) {
        if (user != null) {
          user.dob = selectedDOB.value.isNotEmpty
              ? DateTime.tryParse(selectedDOB.value)
              : null;
        }
      });

      // Stop loading
      TFullScreenLoader.stopLoading();

      // Show success message
      TLoaders.successSnackBar(
          title: "Updated", message: "Your date of birth has been updated.");

      // Delay before navigation
      await Future.delayed(const Duration(seconds: 1));

      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }
}
