import 'dart:async';

import 'package:nm_mobile/features/pos/data/pos_data_providers.dart';
import 'package:nm_mobile/features/pos/domain/entities/cart_item.dart';
import 'package:nm_mobile/features/pos/domain/entities/document_type.dart';
import 'package:nm_mobile/features/pos/domain/entities/payment_entry.dart';
import 'package:nm_mobile/features/pos/domain/entities/product.dart';
import 'package:nm_mobile/features/pos/presentation/notifiers/pos_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pos_notifier.g.dart';

@riverpod
class PosNotifier extends _$PosNotifier {
  Timer? _toastTimer;

  @override
  PosState build() {
    ref.onDispose(() => _toastTimer?.cancel());
    return const PosState();
  }

  void showToast(String message, {Duration duration = const Duration(milliseconds: 2500)}) {
    _toastTimer?.cancel();
    state = state.copyWith(toastMessage: message);
    _toastTimer = Timer(duration, () {
      if (state.toastMessage == message) {
        state = state.copyWith(toastMessage: null);
      }
    });
  }

  void clearToast() => state = state.copyWith(toastMessage: null);

  void setDocumentType(DocumentType type) {
    state = state.copyWith(documentType: type);
  }

  void clearCustomer() => state = state.copyWith(customer: null);

  Future<void> searchCustomerByDni(String dni) async {
    state = state.copyWith(isLoading: true);
    try {
      final customer = await ref.read(posRepositoryProvider).searchCustomer(dni);
      if (customer == null) {
        showToast('Cliente no encontrado');
        return;
      }
      state = state.copyWith(customer: customer);
      showToast('Cliente encontrado');
    } on Exception catch (e) {
      showToast(e.toString().replaceFirst('Exception: ', ''));
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<Product?> searchProductBySku(String sku) async {
    state = state.copyWith(isLoading: true);
    try {
      final product = await ref.read(posRepositoryProvider).searchProduct(sku);
      if (product == null) {
        showToast('Producto no encontrado');
        return null;
      }
      return product;
    } on Exception catch (e) {
      showToast(e.toString().replaceFirst('Exception: ', ''));
      return null;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  void openAddModal(Product product) {
    state = state.copyWith(
      selectorModal: SelectorModalState(isOpen: true, product: product),
    );
  }

  Future<void> openEditModal(CartItem item) async {
    final product = await searchProductBySku(item.sku);
    if (product == null) return;
    state = state.copyWith(
      selectorModal: SelectorModalState(
        isOpen: true,
        product: product,
        isEditing: true,
        editingCartItem: item,
      ),
    );
  }

  void closeModal() {
    state = state.copyWith(selectorModal: const SelectorModalState());
  }

  void addItem(CartItem item) {
    state = state.copyWith(cart: [...state.cart, item]);
    showToast('Producto agregado al carrito');
  }

  void updateItem(CartItem updated) {
    state = state.copyWith(
      cart: state.cart
          .map((i) => i.cartId == updated.cartId ? updated : i)
          .toList(),
    );
    showToast('Ítem actualizado');
  }

  void removeItem(int cartId) {
    state = state.copyWith(
      cart: state.cart.where((i) => i.cartId != cartId).toList(),
    );
  }

  void updateQuantity(int cartId, int delta) {
    state = state.copyWith(
      cart: state.cart.map((item) {
        if (item.cartId != cartId) return item;
        final newQty = item.quantity + delta;
        if (newQty <= 0) return item;
        final max = item.color.inventory?.availableQuantity ?? 0;
        if (newQty > max) {
          showToast('Stock máximo: $max unidades');
          return item;
        }
        return item.copyWith(
          quantity: newQty,
          total: newQty * item.unitPrice,
        );
      }).toList(),
    );
  }

  void clearCart() {
    _toastTimer?.cancel();
    state = const PosState();
  }

  Future<void> checkout(List<PaymentEntry> payments) async {
    if (state.cart.isEmpty) {
      showToast('El carrito está vacío');
      return;
    }
    if (payments.isEmpty) {
      showToast('Debe registrar al menos un método de pago');
      return;
    }

    state = state.copyWith(isLoading: true);
    try {
      final result = await ref.read(posRepositoryProvider).checkout(
            documentType: state.documentType,
            serie: state.documentType == DocumentType.ticketInterno
                ? null
                : state.serie,
            customer: state.customer,
            total: state.grandTotal,
            payments: payments,
            items: state.cart,
          );

      if (result.success) {
        final saleId = result.saleId;
        state = PosState(lastSaleId: saleId);
        showToast(
          'Venta #${saleId ?? ''} registrada',
          duration: const Duration(milliseconds: 4000),
        );
        if (saleId != null) {
          showToast(
            'Toca «Imprimir ticket» para el comprobante.',
            duration: const Duration(milliseconds: 6000),
          );
        }
      } else {
        showToast(result.message ?? 'La venta no pudo procesarse');
      }
    } on Exception catch (e) {
      showToast(e.toString().replaceFirst('Exception: ', ''));
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<String?> fetchTicketHtml() async {
    final saleId = state.lastSaleId;
    if (saleId == null) return null;
    state = state.copyWith(isLoading: true);
    try {
      return await ref.read(posRepositoryProvider).fetchTicketHtml(saleId);
    } on Exception catch (e) {
      showToast(e.toString().replaceFirst('Exception: ', ''));
      return null;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  static int nextCartId() =>
      DateTime.now().millisecondsSinceEpoch + (DateTime.now().microsecond % 1000);
}
