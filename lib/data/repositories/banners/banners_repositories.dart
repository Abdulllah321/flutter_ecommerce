import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../features/shop/models/banner_model.dart';

class BannersRepository extends GetxController {
  static BannersRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Get all banners
  Future<List<BannerModel>> getAllBanners() async {
    try {
      final snapshot = await _db.collection('banners').get();
      final banners =
      snapshot.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();
      return banners;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception("Something went wrong. Please try again.");
    }
  }

  /// Upload new banner
  Future<void> uploadBanner(BannerModel banner) async {
    try {
      await _db.collection('banners').add(banner.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception("Something went wrong while uploading banner.");
    }
  }
}
