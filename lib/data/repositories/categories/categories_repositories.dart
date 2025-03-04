import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/category_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class CategoriesRepositories extends GetxController {
  static CategoriesRepositories get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// ✅ Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('categories').get();
      final categories =
      snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
      return categories;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception("Something went wrong. Please try again.");
    }
  }

  /// ✅ Get subcategories by parent ID
  Future<List<CategoryModel>> getSubCategories(String parentId) async {
    try {
      final snapshot = await _db
          .collection('categories')
          .where('parentId', isEqualTo: parentId)
          .get();
      final subcategories =
      snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
      return subcategories;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception("Something went wrong. Please try again.");
    }
  }

  /// ✅ Upload category or subcategory
  Future<void> uploadCategory(CategoryModel category) async {
    try {
      await _db.collection('categories').doc(category.id).set(category.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception("Something went wrong. Please try again.");
    }
  }
}
