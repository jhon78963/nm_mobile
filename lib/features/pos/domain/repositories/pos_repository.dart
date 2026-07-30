import 'package:nm_mobile/features/pos/domain/entities/cart_item.dart';
import 'package:nm_mobile/features/pos/domain/entities/checkout_result.dart';
import 'package:nm_mobile/features/pos/domain/entities/customer.dart';
import 'package:nm_mobile/features/pos/domain/entities/document_type.dart';
import 'package:nm_mobile/features/pos/domain/entities/payment_entry.dart';
import 'package:nm_mobile/features/pos/domain/entities/product.dart';

abstract interface class PosRepository {
  Future<Product?> searchProduct(String sku);

  Future<PosCustomer?> searchCustomer(String dni);

  Future<CheckoutResult> checkout({
    required DocumentType documentType,
    required String? serie,
    required PosCustomer? customer,
    required double total,
    required List<PaymentEntry> payments,
    required List<CartItem> items,
  });

  Future<String> fetchTicketHtml(int saleId);
}
