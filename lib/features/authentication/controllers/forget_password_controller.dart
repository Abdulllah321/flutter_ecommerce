import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../data/repositories/authenticatoin/authentication_repository.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  ///Variables
  final email = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //Send Email
  sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          "Processing your request...", TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      };

      if (!formKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(
          email.text.trim());
      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: "Email Sent",
          message: "Email Link Sent to Reset your Password");
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));


      if (formKey.currentState!.validate()) {}
    } catch(e){
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: "Ohh!",
          message: e.toString());
    }
  }

}