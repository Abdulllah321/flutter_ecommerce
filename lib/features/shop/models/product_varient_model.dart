class ProductVariationModel {
  final String id;
  final String sku;
  final String image;
  final String? description;
  final double price;
  final double salePrice;
  final int stock;
  final Map<String, String> attributes;

  ProductVariationModel({
    required this.id,
    required this.sku,
    required this.image,
    this.description,
    required this.price,
    required this.salePrice,
    required this.stock,
    required this.attributes,
  });

  /// 🔹 Factory Constructor for Empty Model
  factory ProductVariationModel.empty() {
    return ProductVariationModel(
      id: '',
      sku: '',
      image: '',
      description: null,
      price: 0.0,
      salePrice: 0.0,
      stock: 0,
      attributes: {},
    );
  }

  /// Convert Firestore snapshot to `ProductVariationModel`
  factory ProductVariationModel.fromSnapshot(Map<String, dynamic> data) {
    return ProductVariationModel(
      id: data['id'] ?? '',
      sku: data['sku'] ?? '',
      image: data['image'] ?? '',
      description: data['description'],
      price: data['price']?.toDouble() ?? 0.0,
      salePrice: data['salePrice']?.toDouble() ?? 0.0,
      stock: data['stock'] ?? 0,
      attributes: Map<String, String>.from(data['attributes'] ?? {}),
    );
  }

  /// Convert model to JSON for uploading to Firestore
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sku': sku,
      'image': image,
      'description': description,
      'price': price,
      'salePrice': salePrice,
      'stock': stock,
      'attributes': attributes,
    };
  }
}
