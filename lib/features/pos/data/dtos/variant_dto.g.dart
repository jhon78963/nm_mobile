// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VariantInventoryDto _$VariantInventoryDtoFromJson(Map<String, dynamic> json) =>
    VariantInventoryDto(
      availableQuantity: (json['available_quantity'] as num).toInt(),
      warehouseId: (json['warehouse_id'] as num).toInt(),
    );

VariantDto _$VariantDtoFromJson(Map<String, dynamic> json) => VariantDto(
  productSizeId: (json['product_size_id'] as num).toInt(),
  colorId: (json['color_id'] as num).toInt(),
  colorName: json['colorName'] as String,
  hex: json['hex'] as String,
  inventory: json['inventory'] == null
      ? null
      : VariantInventoryDto.fromJson(json['inventory'] as Map<String, dynamic>),
  price: json['price'] as num,
  sku: json['sku'] as String?,
);
