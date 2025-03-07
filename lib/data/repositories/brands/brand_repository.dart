import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/brand_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  ///Get all Brands
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('brands').get();
      final brands = snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return BrandModel.fromSnapshot(data);
      }).toList();
      return brands;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception("Something went wrong. Please try again.");
    }
  }

  ///Get Brand for Category
  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      // Fetch brand IDs associated with the category
      QuerySnapshot brandCategoryQuery = await _db
          .collection('brandCategory')
          .where('categoryId', isEqualTo: categoryId)
          .get();

      List<String> brandIds = brandCategoryQuery.docs
          .map((doc) => doc['brandId'] as String)
          .toList();

      // If no brand IDs found, return an empty list
      if (brandIds.isEmpty) return [];

      // Fetch brand details using brand IDs
      final brandQuery = await _db
          .collection('brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();

      // Map the fetched data into BrandModel
      List<BrandModel> brands = brandQuery.docs
          .map((doc) => BrandModel.fromSnapshot(doc as Map<String, dynamic>))
          .toList();

      return brands; // Ensure the function returns the list
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception("Something went wrong. Please try again.");
    }
  }
}
