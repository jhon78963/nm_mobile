import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nm_mobile/features/sales/domain/entities/sale_enums.dart';

part 'sale.freezed.dart';

@freezed
abstract class Sale with _$Sale {
  const factory Sale({
    required int id,
    required String code,
    required String creationTime,
    required double total,
    @Default('ACTIVE') String status,
    @Default('') String paymentMethod,
    @Default('') String customer,
    SaleDocumentType? documentType,
    String? fullInvoiceNumber,
    String? serie,
    int? correlativo,
    double? taxableBase,
    double? igvAmount,
    SunatStatus? sunatStatus,
  }) = _Sale;
}

@freezed
abstract class SalePagination with _$SalePagination {
  const factory SalePagination({
    required int total,
    @Default(1) int pages,
  }) = _SalePagination;
}

@freezed
abstract class SaleListPage with _$SaleListPage {
  const factory SaleListPage({
    required List<Sale> data,
    required SalePagination paginate,
  }) = _SaleListPage;
}

@freezed
abstract class SaleItem with _$SaleItem {
  const factory SaleItem({
    int? id,
    required String productName,
    required String descriptionFull,
    required int quantity,
    required double unitPrice,
    required double subtotal,
    int? productSizeId,
    int? colorId,
  }) = _SaleItem;
}

@freezed
abstract class SalePayment with _$SalePayment {
  const factory SalePayment({
    required SalePaymentMethod method,
    required double amount,
  }) = _SalePayment;
}

@freezed
abstract class SaleDetail with _$SaleDetail {
  const factory SaleDetail({
    required int id,
    required String code,
    required String creationTime,
    required double total,
    @Default('ACTIVE') String status,
    @Default('') String paymentMethod,
    @Default('') String customer,
    SaleDocumentType? documentType,
    String? fullInvoiceNumber,
    String? serie,
    int? correlativo,
    double? taxableBase,
    double? igvAmount,
    SunatStatus? sunatStatus,
    String? datetimeIso,
    @Default([]) List<SaleItem> items,
    @Default([]) List<SalePayment> payments,
  }) = _SaleDetail;
}

@freezed
abstract class SaleUpdatePayload with _$SaleUpdatePayload {
  const factory SaleUpdatePayload({
    required int id,
    required String code,
    required double total,
    required String status,
    required String creationTime,
    required List<SaleUpdateItem> items,
    required List<SaleUpdatePayment> payments,
  }) = _SaleUpdatePayload;
}

@freezed
abstract class SaleUpdateItem with _$SaleUpdateItem {
  const factory SaleUpdateItem({
    int? id,
    required int quantity,
    required double unitPrice,
    int? productSizeId,
    int? colorId,
  }) = _SaleUpdateItem;
}

@freezed
abstract class SaleUpdatePayment with _$SaleUpdatePayment {
  const factory SaleUpdatePayment({
    required String method,
    required double amount,
  }) = _SaleUpdatePayment;
}
