import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart' as dio;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/data/repositories/authenticatoin/authentication_repository.dart';

import '../../../features/authentication/models/user_modal.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore db = FirebaseFirestore.instance;

  /// **Function to save user data to Firestore**
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await db.collection("users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again.";
    }
  }

  /// **Function to fetch user details based on user ID**
  Future<UserModel?> fetchUserDetails() async {
    try {
      final doc = await db
          .collection("users")
          .doc(AuthenticationRepository.instance.authUser!.uid)
          .get();
      if (doc.exists) {
        return UserModel.fromSnapshot(doc);
      }
      return null;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again.";
    }
  }

  /// **Function to update user data in Firestore**
  Future<void> updateUserRecord(UserModel data) async {
    try {
      await db.collection("users").doc(data.id).update(data.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again.";
    }
  }

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await db
          .collection("users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again.";
    }
  }

  /// **Function to remove user data from Firestore**
  removeUserRecord(String userId) async {
    try {
      await db.collection("users").doc(userId).delete();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception("Something went wrong. Please try again.");
    }
  }

  /// **Upload Image to Cloudinary**
  Future<String> uploadImage(String path, XFile image) async {
    try {
      const String cloudName = "dh6rm1bj6"; // Replace with your Cloudinary Cloud Name
      const String uploadPreset = "images_presets"; // Replace with your Upload Preset

      String url = "https://api.cloudinary.com/v1_1/$cloudName/image/upload";

      dio.FormData formData;

      if (kIsWeb) {
        Uint8List imageBytes = await image.readAsBytes();
        formData = dio.FormData.fromMap({
          "file": dio.MultipartFile.fromBytes(imageBytes, filename: "upload.jpg"),
          "upload_preset": uploadPreset,
          'folder': '$path/'
        });
      } else {
        formData = dio.FormData.fromMap({
          "file": await dio.MultipartFile.fromFile(image.path),
          "upload_preset": uploadPreset,
        });
      }

      dio.Response response = await dio.Dio().post(url, data: formData);

      if (response.statusCode == 200) {
        return response.data['secure_url']; // Return the Cloudinary image URL
      } else {
        throw Exception("Failed to upload image");
      }
    } on FormatException {
      throw Exception("Invalid file format.");
    } catch (e) {
      throw Exception("Something went wrong. Please try again.");
    }
  }

}
