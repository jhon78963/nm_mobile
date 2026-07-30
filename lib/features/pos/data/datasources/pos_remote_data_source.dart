import 'package:dio/dio.dart';
import 'package:nm_mobile/features/pos/data/dtos/checkout_response_dto.dart';
import 'package:nm_mobile/features/pos/data/dtos/customer_dto.dart';
import 'package:nm_mobile/features/pos/data/dtos/product_dto.dart';
import 'package:nm_mobile/features/pos/domain/entities/cart_item.dart';
import 'package:nm_mobile/features/pos/domain/entities/checkout_result.dart';
import 'package:nm_mobile/features/pos/domain/entities/customer.dart';
import 'package:nm_mobile/features/pos/domain/entities/document_type.dart';
import 'package:nm_mobile/features/pos/domain/entities/payment_entry.dart';
import 'package:nm_mobile/features/pos/domain/entities/product.dart';

abstract interface class PosRemoteDataSource {
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

final class PosRemoteDataSourceImpl implements PosRemoteDataSource {
  const PosRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  static const _base = 'pos';

  @override
  Future<Product?> searchProduct(String sku) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '$_base/products',
        queryParameters: {'sku': sku},
      );
      return ProductDto.fromJson(response.data!).toDomain();
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      rethrow;
    }
  }

  @override
  Future<PosCustomer?> searchCustomer(String dni) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '$_base/customers',
        queryParameters: {'dni': dni},
      );
      return CustomerDto.fromJson(response.data!).toDomain();
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      rethrow;
    }
  }

  @override
  Future<CheckoutResult> checkout({
    required DocumentType documentType,
    required String? serie,
    required PosCustomer? customer,
    required double total,
    required List<PaymentEntry> payments,
    required List<CartItem> items,
  }) async {
    final payload = {
      'document_type': documentType.apiValue,
      if (serie != null && serie.isNotEmpty) 'serie': serie,
      'customer': customer != null ? {'id': customer.id} : null,
      'total': total,
      'payments': payments
          .map(
            (p) => {
              'method': p.method.apiValue,
              'amount': p.amount,
            },
          )
          .toList(),
      'items': items
          .map(
            (item) => {
              'name': item.name,
              'quantity': item.quantity,
              'unitPrice': item.unitPrice,
              'total': item.total,
              'size': item.size,
              'color': {
                'product_size_id': item.color.productSizeId,
                'color_id': item.color.colorId,
                'colorName': item.color.colorName,
                'hex': item.color.hex,
                if (item.color.inventory != null)
                  'inventory': {
                    'available_quantity':
                        item.color.inventory!.availableQuantity,
                    'warehouse_id': item.color.inventory!.warehouseId,
                  },
              },
            },
          )
          .toList(),
    };

    final response = await _dio.post<Map<String, dynamic>>(
      '$_base/checkout',
      data: payload,
    );

    return CheckoutResponseDto.fromJson(response.data!).toDomain();
  }

  @override
  Future<String> fetchTicketHtml(int saleId) async {
    final response = await _dio.get<String>(
      '$_base/sales/$saleId/ticket',
      options: Options(
        responseType: ResponseType.plain,
        headers: {'Accept': 'text/html,application/xhtml+xml'},
      ),
    );
    return response.data ?? '';
  }
}
