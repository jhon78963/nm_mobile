import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nm_mobile/features/pos/domain/entities/cart_item.dart';
import 'package:nm_mobile/features/pos/domain/entities/customer.dart';
import 'package:nm_mobile/features/pos/domain/entities/document_type.dart';
import 'package:nm_mobile/features/pos/domain/entities/product.dart';

part 'pos_state.freezed.dart';

@freezed
abstract class SelectorModalState with _$SelectorModalState {
  const factory SelectorModalState({
    @Default(false) bool isOpen,
    Product? product,
    @Default(false) bool isEditing,
    CartItem? editingCartItem,
  }) = _SelectorModalState;
}

@freezed
abstract class PosState with _$PosState {
  const factory PosState({
    @Default([]) List<CartItem> cart,
    PosCustomer? customer,
    @Default(DocumentType.ticketInterno) DocumentType documentType,
    @Default(false) bool isLoading,
    String? toastMessage,
    int? lastSaleId,
    @Default(SelectorModalState()) SelectorModalState selectorModal,
  }) = _PosState;

  const PosState._();

  double get grandTotal =>
      cart.fold(0, (acc, item) => acc + item.total);

  int get totalItems =>
      cart.fold(0, (acc, item) => acc + item.quantity);

  String get serie => documentType.serie;
}
