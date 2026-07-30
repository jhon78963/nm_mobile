import 'package:dio/dio.dart';
import 'package:nm_mobile/features/auth/data/utils/dio_exception_mapper.dart';
import 'package:nm_mobile/features/pos/data/datasources/pos_remote_data_source.dart';
import 'package:nm_mobile/features/pos/domain/entities/cart_item.dart';
import 'package:nm_mobile/features/pos/domain/entities/checkout_result.dart';
import 'package:nm_mobile/features/pos/domain/entities/customer.dart';
import 'package:nm_mobile/features/pos/domain/entities/document_type.dart';
import 'package:nm_mobile/features/pos/domain/entities/payment_entry.dart';
import 'package:nm_mobile/features/pos/domain/entities/product.dart';
import 'package:nm_mobile/features/pos/domain/repositories/pos_repository.dart';

final class PosRepositoryImpl implements PosRepository {
  const PosRepositoryImpl({required this.remoteDataSource});

  final PosRemoteDataSource remoteDataSource;

  @override
  Future<Product?> searchProduct(String sku) async {
    try {
      return await remoteDataSource.searchProduct(sku);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<PosCustomer?> searchCustomer(String dni) async {
    try {
      return await remoteDataSource.searchCustomer(dni);
    } on DioException catch (e) {
      throw mapDioException(e);
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
    try {
      return await remoteDataSource.checkout(
        documentType: documentType,
        serie: serie,
        customer: customer,
        total: total,
        payments: payments,
        items: items,
      );
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<String> fetchTicketHtml(int saleId) async {
    try {
      return await remoteDataSource.fetchTicketHtml(saleId);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }
}
