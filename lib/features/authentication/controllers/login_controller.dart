import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/personalization/controllers/user/user_controller.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import '../../../data/repositories/authenticatoin/authentication_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/loaders.dart';

class LoginController extends GetxController {
  /// **Variables**
  final rememberMe = false.obs; // ✅ Fixed variable name
  final hidePassword = true.obs;
  final localStorage = GetStorage();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    emailController.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    passwordController.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  /// **Email and Password Sign-in**
  Future<void> emailAndPasswordSignIn() async {
    try {
      // **Start Loading**
      TFullScreenLoader.openLoadingDialog(
          "Logging you in...", TImages.docerAnimation);

      // **Check Internet Connectivity**
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        Get.snackbar("No Internet", "Please check your internet connection.");
        return;
      }

      // **Form Validation**
      if (loginFormKey.currentState == null ||
          !loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Save Data if Rememeber me is checked
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', emailController.text);
        localStorage.write('REMEMBER_ME_PASSWORD', passwordController.text);
      } else {
        localStorage.remove('REMEMBER_ME_EMAIL');
        localStorage.remove('REMEMBER_ME_PASSWORD');
      }

      // **Sign in with Firebase Authentication**
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(emailController.text.trim(), passwordController.text.trim());

      // **Stop Loading & Redirect to Home**
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const NavigationMenu());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Get.snackbar("Login Failed", e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      // ✅ Start Loading
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

      // ✅ Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // ✅ Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // ✅ Stop Loader if Login Successful
      if (userCredentials != null) {
        TFullScreenLoader.stopLoading();
      }
      await userController.saveUserRecord(userCredentials);
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const NavigationMenu());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

}
