import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
abstract class ProductVariantInventory with _$ProductVariantInventory {
  const factory ProductVariantInventory({
    required int availableQuantity,
    required int warehouseId,
  }) = _ProductVariantInventory;
}

@freezed
abstract class Variant with _$Variant {
  const factory Variant({
    required int productSizeId,
    required int colorId,
    required String colorName,
    required String hex,
    ProductVariantInventory? inventory,
    required double price,
    String? sku,
  }) = _Variant;
}

@freezed
abstract class Product with _$Product {
  const factory Product({
    required String id,
    required String sku,
    required String name,
    required double basePrice,
    required Map<String, List<Variant>> variants,
  }) = _Product;
}
