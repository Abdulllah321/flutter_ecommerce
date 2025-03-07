import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/product/images_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/models/product_varient_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = "".obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  ///Select Attribute and variation
  void onAttributeSelected(
      ProductModel product, String attributeName, attributeValue) {
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
        (variation) =>
            _isSameAttributeValues(variation.attributes, selectedAttributes),
        orElse: () {
      return ProductVariationModel.empty();
    });


    if (selectedVariation.id.isNotEmpty && selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value =
          selectedVariation.image;
    }

    this.selectedVariation.value = selectedVariation;
    getProductVariationStockStatus();
  }

  /// -- Check if selected attributes matches ant variation attributes
  bool _isSameAttributeValues(Map<String, String> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) return false;

    for (var key in selectedAttributes.keys) {
      if (!variationAttributes.containsKey(key)) return false;

      // Convert values to String for uniform comparison
      if (variationAttributes[key].toString() !=
          selectedAttributes[key].toString()) {
        return false;
      }
    }
    return true;
  }

  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    final availableVariationAttributesValues = variations
        .where((variation) =>
            variation.attributes[attributeName] != null &&
            variation.attributes[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        .map((variation) => variation.attributes[attributeName])
        .toSet();
    return availableVariationAttributesValues;
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toString();
  }

  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? "In Stock" : "Out of Stock";
  }

  ///Reset Selected Attributes and switching products;
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    selectedVariation.value = ProductVariationModel.empty();
    variationStockStatus.value = "";
  }
}
