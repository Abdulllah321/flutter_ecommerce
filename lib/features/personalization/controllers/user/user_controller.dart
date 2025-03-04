import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';

import '../../../../data/repositories/authenticatoin/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../authentication/models/user_modal.dart';
import '../../../authentication/screens/login/login.dart';
import '../../screens/profile/widget/re_authenticate_user_login_form.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = true.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  final userRepository = Get.put(UserRepository());
  final imageUploading = false.obs;

  @override
  void onInit() {
    fetchUserRecords();
    super.onInit();
  }

  /// Save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      /// First update Rx User and then check if user data os already stored or not if not store it
      await fetchUserRecords();

      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // ✅ Convert Name to First and Last Name
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? "");
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? "");

          // ✅ Map Data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts.isNotEmpty ? nameParts[0] : '',
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          // ✅ Store user data in Firestore
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      // ✅ Show warning if data not saved
      TLoaders.warningSnackBar(
        title: "Data not saved",
        message: e.toString(),
      );
    }
  }

  Future<void> fetchUserRecords() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      if (user != null) {
        this.user(user);
        profileLoading.value = false;
      }
    } finally {
      profileLoading.value = false;
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(16),
      // Adjust padding as needed
      title: 'Delete Account',
      middleText:
          "Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.",
      confirm: ElevatedButton(
        onPressed: () async {
          await deleteUserAccount();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        child: const Text('Cancel'),
        onPressed: () {
          Get.back(); // Close dialog
        },
      ),
    );
  }

  Future<void> deleteUserAccount() async {
    try {
      // Show loading screen
      TFullScreenLoader.openLoadingDialog(
          "Processing...", TImages.docerAnimation);

      // Get auth instance
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser?.providerData.map((e) => e.providerId).first ?? "";

      if (provider.isNotEmpty) {
        // Re-verify authentication
        if (provider == 'google.com') {
          await auth
              .signInWithGoogle(); // Ensure this completes before deletion
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(
              () => const ReAuthLoginForm()); // Navigate to re-authentication
          return; // Stop further execution until re-auth is completed
        }

        // Now delete the account
        await auth.deleteAccount();
        TFullScreenLoader.stopLoading();
        Get.offAll(
            () => const LoginScreen()); // Navigate to login after deletion
      } else {
        throw Exception("Unknown authentication provider");
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: "Oops!", message: e.toString());
    }
  }

  ///Re AuthenticateBefore Deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      // Show loading screen
      TFullScreenLoader.openLoadingDialog(
          'Processing!', TImages.docerAnimation);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Validate form
      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Re-authenticate user
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
        verifyEmail.text.trim(),
        verifyPassword.text.trim(),
      );

      // Delete user account
      await AuthenticationRepository.instance.deleteAccount();

      // Stop loading and navigate to Login screen
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: "Error", message: e.toString());
    }
  }

  /// Upload Profile Image
  uploadUserProfilePicture() async {
    try {
      imageUploading.value = true;
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        final imageUrl =
            await userRepository.uploadImage("Users/Images/Profile", image);

        ///Update User Image Record
        Map<String, dynamic> json = {"profilePicture": imageUrl};
        await userRepository.updateSingleField(json);
        user.value.profilePicture = imageUrl;
        user.refresh();
        imageUploading.value = false;
        TLoaders.successSnackBar(
            title: "Congratulations",
            message: "Your Profile Image has been updated");
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oops!", message: e.toString());
    }
  }
}
