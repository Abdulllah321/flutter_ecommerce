import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:t_store/features/shop/models/product_attribute_model.dart';
import 'package:t_store/features/shop/models/product_varient_model.dart';

import 'brand_model.dart';

class ProductModel {
  final String id;
  final int stock;
  final String? sku;
  final double price;
  final String title;
  final DateTime? date;
  final double salePrice;
  final String thumbnail;
  final bool? isFeatured;
  final BrandModel? brand;
  final String? description;
  final String? categoryId;
  final List<String>? images;
  final String productType;
  final List<ProductAttributeModel>? productAttributes;
  final List<ProductVariationModel>? productVariations;
  final int? views;

  ProductModel({
    required this.id,
    required this.stock,
    this.sku,
    required this.price,
    required this.title,
    this.date,
    required this.salePrice,
    required this.thumbnail,
    this.isFeatured,
    this.brand,
    this.description,
    this.categoryId,
    this.images,
    required this.productType,
    this.productAttributes,
    this.productVariations,
    this.views = 0,
  });

  /// Convert Firestore snapshot to `ProductModel`
  factory ProductModel.fromSnapshot(Map<String, dynamic> data) {
    return ProductModel(
      id: data['id'] ?? '',
      stock: data['stock'] ?? 0,
      sku: data['sku'],
      price: data['price']?.toDouble() ?? 0.0,
      title: data['title'] ?? '',
      date: data['date'] != null ? DateTime.parse(data['date']) : null,
      salePrice: data['salePrice']?.toDouble() ?? 0.0,
      thumbnail: data['thumbnail'] ?? '',
      isFeatured: data['jsFeatured'],
      brand:
      data['brand'] != null ? BrandModel.fromSnapshot(data['brand']) : null,
      description: data['description'],
      categoryId: data['categoryId'],
      images: List<String>.from(data['images'] ?? []),
      productType: data['productType'] ?? '',
      productAttributes: (data['productAttributes'] as List?)
          ?.map((e) => ProductAttributeModel.fromSnapshot(e))
          .toList(),
      productVariations: (data['productVariations'] as List?)
          ?.map((e) => ProductVariationModel.fromSnapshot(e))
          .toList(),
      views: data['views'] ?? 0,
    );
  }

  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: data['id'] ?? '',
      stock: data['stock'] ?? 0,
      sku: data['sku'],
      price: data['price']?.toDouble() ?? 0.0,
      title: data['title'] ?? '',
      date: data['date'] != null ? DateTime.parse(data['date']) : null,
      salePrice: data['salePrice']?.toDouble() ?? 0.0,
      thumbnail: data['thumbnail'] ?? '',
      isFeatured: data['jsFeatured'],
      brand:
      data['brand'] != null ? BrandModel.fromSnapshot(data['brand']) : null,
      description: data['description'],
      categoryId: data['categoryId'],
      images: List<String>.from(data['images'] ?? []),
      productType: data['productType'] ?? '',
      productAttributes: (data['productAttributes'] as List?)
          ?.map((e) => ProductAttributeModel.fromSnapshot(e))
          .toList(),
      productVariations: (data['productVariations'] as List?)
          ?.map((e) => ProductVariationModel.fromSnapshot(e))
          .toList(),
      views: data['views'] ?? 0,
    );
  }

  /// Convert model to JSON for uploading to Firestore
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'stock': stock,
      'sku': sku,
      'price': price,
      'title': title,
      'date': date != null ? DateFormat('yyyy-MM-dd').format(date!) : null,
      'salePrice': salePrice,
      'thumbnail': thumbnail,
      'jsFeatured': isFeatured,
      'brand': brand?.toJson(),
      'description': description,
      'categoryId': categoryId,
      'images': images,
      'productType': productType,
      'productAttributes': productAttributes?.map((e) => e.toJson()).toList(),
      'productVariations': productVariations?.map((e) => e.toJson()).toList(),
      'views': views,
    };
  }
}
