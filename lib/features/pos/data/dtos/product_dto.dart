import 'package:json_annotation/json_annotation.dart';
import 'package:nm_mobile/features/pos/data/dtos/variant_dto.dart';
import 'package:nm_mobile/features/pos/domain/entities/product.dart';

part 'product_dto.g.dart';

Map<String, List<VariantDto>> _variantsFromJson(dynamic json) {
  if (json is! Map) return {};
  return (json as Map<String, dynamic>).map(
    (key, value) => MapEntry(
      key,
      (value as List<dynamic>)
          .map((e) => VariantDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
}

@JsonSerializable(createToJson: false)
final class ProductDto {
  ProductDto({
    required this.id,
    required this.sku,
    required this.name,
    required this.basePrice,
    required this.variants,
  });

  final dynamic id;
  final String sku;
  final String name;

  @JsonKey(name: 'basePrice')
  final num basePrice;

  @JsonKey(fromJson: _variantsFromJson)
  final Map<String, List<VariantDto>> variants;

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  Product toDomain() => Product(
        id: id.toString(),
        sku: sku,
        name: name,
        basePrice: basePrice.toDouble(),
        variants: variants.map(
          (key, list) => MapEntry(key, list.map((v) => v.toDomain()).toList()),
        ),
      );
}
