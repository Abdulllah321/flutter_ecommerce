import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;
  final bool isFeatured;
  final String parentId;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    required this.parentId,
  });

  // Factory constructor to create an object from Firestore
  factory CategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return CategoryModel(
      id: snapshot.id,
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
      parentId: data['parentId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "isFeatured": isFeatured,
      "parentId": parentId,
    };
  }
  // Add this for debugging
  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, image: $image, isFeatured: $isFeatured, parentId: $parentId)';
  }
}
