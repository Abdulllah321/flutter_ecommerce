class BrandModel {
  final String id;
  final String name;
  final String image;
  final bool? isFeatured;
  final int? productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });

  /// Convert Firestore snapshot to `BrandModel`
  factory BrandModel.fromSnapshot(Map<String, dynamic> data) {
    return BrandModel(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      isFeatured: data['isFeatured'],
      productsCount: data['productsCount'],
    );
  }

  /// Convert model to JSON for uploading to Firestore
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'isFeatured': isFeatured,
      'productsCount': productsCount,
    };
  }
}
