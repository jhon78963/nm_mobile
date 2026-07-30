import 'package:json_annotation/json_annotation.dart';
import 'package:nm_mobile/features/pos/domain/entities/product.dart';

part 'variant_dto.g.dart';

@JsonSerializable(createToJson: false)
final class VariantInventoryDto {
  VariantInventoryDto({
    required this.availableQuantity,
    required this.warehouseId,
  });

  @JsonKey(name: 'available_quantity')
  final int availableQuantity;

  @JsonKey(name: 'warehouse_id')
  final int warehouseId;

  factory VariantInventoryDto.fromJson(Map<String, dynamic> json) =>
      _$VariantInventoryDtoFromJson(json);

  ProductVariantInventory toDomain() => ProductVariantInventory(
        availableQuantity: availableQuantity,
        warehouseId: warehouseId,
      );
}

@JsonSerializable(createToJson: false)
final class VariantDto {
  VariantDto({
    required this.productSizeId,
    required this.colorId,
    required this.colorName,
    required this.hex,
    this.inventory,
    required this.price,
    this.sku,
  });

  @JsonKey(name: 'product_size_id')
  final int productSizeId;

  @JsonKey(name: 'color_id')
  final int colorId;

  final String colorName;
  final String hex;
  final VariantInventoryDto? inventory;
  final num price;
  final String? sku;

  factory VariantDto.fromJson(Map<String, dynamic> json) =>
      _$VariantDtoFromJson(json);

  Variant toDomain() => Variant(
        productSizeId: productSizeId,
        colorId: colorId,
        colorName: colorName,
        hex: hex,
        inventory: inventory?.toDomain(),
        price: price.toDouble(),
        sku: sku,
      );
}
