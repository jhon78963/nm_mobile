import 'package:nm_mobile/features/sales/domain/entities/sale.dart';
import 'package:nm_mobile/features/sales/domain/entities/sale_enums.dart';

double _readNumber(dynamic value, [double fallback = 0]) {
  final parsed = num.tryParse(value?.toString() ?? '');
  return parsed?.toDouble() ?? fallback;
}

String _readString(dynamic value, [String fallback = '']) {
  return value is String ? value : fallback;
}

String? _readOptionalString(dynamic value) {
  if (value == null) return null;
  final str = value.toString().trim();
  return str.isEmpty ? null : str;
}

String _readCustomerName(dynamic value) {
  if (value is String) return value;
  if (value is Map) {
    return _readString(value['name']);
  }
  return '';
}

Sale adaptSale(dynamic raw) {
  final r = raw as Map<String, dynamic>;

  return Sale(
    id: _readNumber(r['id']).toInt(),
    code: _readString(r['code']),
    creationTime: _readString(
      r['creationTime'] ?? r['creation_time'] ?? r['date'],
    ),
    total: _readNumber(r['total']),
    status: _readString(r['status'], 'ACTIVE'),
    paymentMethod: _readString(r['paymentMethod'] ?? r['payment_method']),
    customer: _readCustomerName(r['customer']),
    documentType: SaleDocumentType.fromApi(
      _readOptionalString(r['document_type'] ?? r['documentType']),
    ),
    fullInvoiceNumber: _readOptionalString(
      r['full_invoice_number'] ?? r['fullInvoiceNumber'],
    ),
    serie: _readOptionalString(r['serie']),
    correlativo: r['correlativo'] != null
        ? _readNumber(r['correlativo']).toInt()
        : null,
    taxableBase: r['taxable_base'] != null || r['taxableBase'] != null
        ? _readNumber(r['taxable_base'] ?? r['taxableBase'])
        : null,
    igvAmount: r['igv_amount'] != null || r['igvAmount'] != null
        ? _readNumber(r['igv_amount'] ?? r['igvAmount'])
        : null,
    sunatStatus: SunatStatus.fromApi(
      _readOptionalString(r['sunat_status'] ?? r['sunatStatus']),
    ),
  );
}

SaleListPage adaptSaleList(dynamic raw) {
  if (raw is Map<String, dynamic> && raw['data'] is Map<String, dynamic>) {
    return adaptSaleList(raw['data']);
  }

  final r = raw as Map<String, dynamic>;
  final dataRaw = r['data'];
  final items = dataRaw is List
      ? dataRaw.map(adaptSale).toList()
      : <Sale>[];

  final paginateRaw = r['paginate'] as Map<String, dynamic>?;

  return SaleListPage(
    data: items,
    paginate: SalePagination(
      total: _readNumber(paginateRaw?['total']).toInt(),
      pages: _readNumber(paginateRaw?['pages'], 1).toInt(),
    ),
  );
}

SaleItem adaptSaleItem(dynamic raw) {
  final r = raw as Map<String, dynamic>;
  final quantity = _readNumber(r['quantity'], 1).toInt();
  final unitPrice = _readNumber(r['unit_price'] ?? r['unitPrice']);
  final subtotal = _readNumber(r['subtotal'], quantity * unitPrice);

  return SaleItem(
    id: r['id'] != null ? _readNumber(r['id']).toInt() : null,
    productName: _readString(r['product_name'] ?? r['productName']),
    descriptionFull: _readString(
      r['description_full'] ?? r['descriptionFull'],
    ),
    quantity: quantity,
    unitPrice: unitPrice,
    subtotal: subtotal,
    productSizeId: r['product_size_id'] != null || r['productSizeId'] != null
        ? _readNumber(r['product_size_id'] ?? r['productSizeId']).toInt()
        : null,
    colorId: r['color_id'] != null || r['colorId'] != null
        ? _readNumber(r['color_id'] ?? r['colorId']).toInt()
        : null,
  );
}

SalePayment adaptSalePayment(dynamic raw) {
  final r = raw as Map<String, dynamic>;
  return SalePayment(
    method: SalePaymentMethod.normalize(_readOptionalString(r['method'])),
    amount: _readNumber(r['amount']),
  );
}

SaleDetail adaptSaleDetail(dynamic raw) {
  if (raw is Map<String, dynamic> && raw['data'] is Map<String, dynamic>) {
    return adaptSaleDetail(raw['data']);
  }

  final r = raw as Map<String, dynamic>;
  final base = adaptSale(r);
  final itemsRaw = r['items'];
  final paymentsRaw = r['payments'];

  var payments = paymentsRaw is List
      ? paymentsRaw.map(adaptSalePayment).toList()
      : <SalePayment>[];

  if (payments.isEmpty && base.paymentMethod.isNotEmpty) {
    payments = [
      SalePayment(
        method: SalePaymentMethod.normalize(base.paymentMethod),
        amount: base.total,
      ),
    ];
  }

  return SaleDetail(
    id: base.id,
    code: base.code,
    creationTime: base.creationTime,
    total: base.total,
    status: base.status,
    paymentMethod: base.paymentMethod,
    customer: base.customer,
    documentType: base.documentType,
    fullInvoiceNumber: base.fullInvoiceNumber,
    serie: base.serie,
    correlativo: base.correlativo,
    taxableBase: base.taxableBase,
    igvAmount: base.igvAmount,
    sunatStatus: base.sunatStatus,
    datetimeIso: _readOptionalString(r['datetime_iso'] ?? r['datetimeIso']),
    items: itemsRaw is List ? itemsRaw.map(adaptSaleItem).toList() : [],
    payments: payments,
  );
}
