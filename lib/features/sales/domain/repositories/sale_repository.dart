import 'package:nm_mobile/features/sales/domain/entities/sale.dart';

abstract interface class SaleRepository {
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
