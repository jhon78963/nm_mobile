// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
  id: json['id'],
  sku: json['sku'] as String,
  name: json['name'] as String,
  basePrice: json['basePrice'] as num,
  variants: _variantsFromJson(json['variants']),
);
