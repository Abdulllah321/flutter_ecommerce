import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/product_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('products')
          .where("isFeatured", isEqualTo: true)
          .limit(4)
          .get();

      final products = snapshot.docs.map((doc) {
        final data = doc.data(); // Extract document data
        return ProductModel.fromSnapshot(
            data); // Use fromSnapshot instead of fromJson
      }).toList();

      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception("Something went wrong. Please try again.");
    }
  }

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('products')
          .where("isFeatured", isEqualTo: true)
          .get();

      final products = snapshot.docs.map((doc) {
        final data = doc.data();
        return ProductModel.fromSnapshot(data);
      }).toList();

      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception("Something went wrong. Please try again.");
    }
  }

  /// Get Products by query
  Future<List<ProductModel>> fetchProductByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception("Something went wrong. Please try again.");
    }
  }

  Future<List<ProductModel>> getBrandProducts({required String brandId, int limit = -1}) async {
    try {
      QuerySnapshot querySnapshot;

      if (limit == -1) {
        querySnapshot = await _db
            .collection('products')
            .where('brand.id', isEqualTo: brandId)
            .get();
      } else {
        querySnapshot = await _db
            .collection('products')
            .where('brand.id', isEqualTo: brandId)
            .limit(limit)
            .get();
      }

      final products = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return ProductModel.fromSnapshot(data);
      }).toList();

      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception("Something went wrong. Please try again.");
    }
  }


  Future<void> uploadDummyProducts(List<ProductModel> dummyData) async {
    try {
      final batch = _db.batch();
      for (var product in dummyData) {
        final docRef = _db.collection('products').doc();
        batch.set(docRef, product.toJson());
      }
      await batch.commit();
      print("Dummy data uploaded successfully!");
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw Exception("Failed to upload dummy data.");
    }
  }
}
