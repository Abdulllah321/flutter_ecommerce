class ProductAttributeModel {
  final String? name;
  final List<String>? values;

  ProductAttributeModel({
    this.name,
    this.values,
  });

  /// Convert Firestore snapshot to `ProductAttributeModel`
  factory ProductAttributeModel.fromSnapshot(Map<String, dynamic> data) {
    return ProductAttributeModel(
      name: data['name'] ?? '',
      values: List<String>.from(data['values'] ?? []),
    );
  }

  /// Convert model to JSON for uploading to Firestore
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'values': values,
    };
  }
}
