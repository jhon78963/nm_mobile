import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nm_mobile/features/pos/domain/entities/product.dart';

part 'cart_item.freezed.dart';

@freezed
abstract class CartItem with _$CartItem {
  const factory CartItem({
    required int cartId,
    required String productId,
    required String sku,
    required String name,
    required String size,
    required Variant color,
    required int quantity,
    required double unitPrice,
    required double total,
  }) = _CartItem;
}
