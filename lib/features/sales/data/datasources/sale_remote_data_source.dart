import 'package:dio/dio.dart';
import 'package:nm_mobile/features/sales/data/adapters/sale_adapter.dart';
import 'package:nm_mobile/features/sales/domain/entities/sale.dart';

abstract interface class SaleRemoteDataSource {
  Future<SaleListPage> getAll({
    required int limit,
    required int page,
    String? search,
  });

  Future<SaleDetail> getOne(int id);

  Future<void> update(int id, SaleUpdatePayload payload);

  Future<void> cancel(int id);

  Future<String> fetchTicketHtml(int saleId);
}

final class SaleRemoteDataSourceImpl implements SaleRemoteDataSource {
  const SaleRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  static const _base = 'sales';

  @override
  Future<SaleListPage> getAll({
    required int limit,
    required int page,
    String? search,
  }) async {
    final response = await _dio.get<dynamic>(
      _base,
      queryParameters: {
        'limit': limit,
        'page': page,
        if (search != null && search.trim().isNotEmpty) 'search': search.trim(),
      },
    );
    return adaptSaleList(response.data);
  }

  @override
  Future<SaleDetail> getOne(int id) async {
    final response = await _dio.get<dynamic>('$_base/$id');
    return adaptSaleDetail(response.data);
  }

  @override
  Future<void> update(int id, SaleUpdatePayload payload) async {
    await _dio.patch<dynamic>(
      '$_base/$id',
      data: {
        'id': payload.id,
        'code': payload.code,
        'total': payload.total,
        'status': payload.status,
        'creationTime': payload.creationTime,
        'items': payload.items
            .map(
              (item) => {
                if (item.id != null) 'id': item.id,
                'quantity': item.quantity,
                'unit_price': item.unitPrice,
                if (item.productSizeId != null)
                  'product_size_id': item.productSizeId,
                if (item.colorId != null) 'color_id': item.colorId,
              },
            )
            .toList(),
        'payments': payload.payments
            .map(
              (p) => {
                'method': p.method,
                'amount': p.amount,
              },
            )
            .toList(),
      },
    );
  }

  @override
  Future<void> cancel(int id) async {
    await _dio.delete<dynamic>('$_base/$id');
  }

  @override
  Future<String> fetchTicketHtml(int saleId) async {
    final response = await _dio.get<String>(
      'pos/sales/$saleId/ticket',
      options: Options(
        responseType: ResponseType.plain,
        headers: {'Accept': 'text/html,application/xhtml+xml'},
      ),
    );
    return response.data ?? '';
  }
}
