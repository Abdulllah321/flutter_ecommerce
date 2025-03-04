import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/features/authentication/models/user_modal.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../data/repositories/authenticatoin/authentication_repository.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Firebase Authentication & Firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Text Field Controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Observables
  final hidePassword = true.obs;
  var agreeToPrivacyPolicy = false.obs;

  /// **Signup Method**
  Future<void> signup() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          "we are processing your information...", TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // 🔴 Ensure validation runs properly
      if (signupFormKey.currentState == null ||
          !signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!agreeToPrivacyPolicy.value) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
            title: "Accept Privacy Policy",
            message: "In order to create an account, you must accept the Privacy Policy & Terms.");
        return;
      }


      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
          emailController.text.trim(), passwordController.text.trim());

      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          username: usernameController.text.trim(),
          email: emailController.text.trim(),
          phoneNumber: phoneController.text.trim(),
          profilePicture: "");

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: "Congratulations",
          message: "Your account has been created! Verify email to continue.");

      Get.to(() => VerifyEmailScreen(email: emailController.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }
}
