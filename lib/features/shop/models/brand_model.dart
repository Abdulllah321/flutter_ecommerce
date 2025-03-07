class BrandModel {
  final String id;
  final String name;
  final String image;
  final bool? isFeatured;
  final int? productsCount;
  final List<dynamic> variants;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
    this.variants = const [],
  });

  /// Static empty instance
  static final empty = BrandModel(
    id: '',
    name: '',
    image: '',
    isFeatured: false,
    productsCount: 0,
    variants: [],
  );

  /// Convert Firestore snapshot to `BrandModel`
  factory BrandModel.fromSnapshot(Map<String, dynamic> data) {
    return BrandModel(
      id: data['id'].toString(), // Ensure ID is always a string
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
      productsCount: (data['productsCount'] is int)
          ? data['productsCount']
          : int.tryParse(data['productsCount'].toString()) ?? 0, // Convert to int
      variants: data['variants'] ?? [],
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
      'variants': variants,
    };
  }
}
