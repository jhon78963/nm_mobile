import 'package:intl/intl.dart';
import 'package:nm_mobile/features/sales/domain/entities/sale_enums.dart';

abstract final class SaleFormatters {
  static final _money = NumberFormat('#,##0.00', 'es_PE');

  static String money(double value) => 'S/ ${_money.format(value)}';

  static String date(String? value) {
    if (value == null || value.isEmpty) return '—';

    final iso = DateTime.tryParse(value);
    if (iso != null) {
      return DateFormat('dd/MM/yyyy', 'es_PE').format(iso);
    }

    if (value.contains('/')) {
      final parts = value.split(' ');
      return parts.first;
    }

    final normalized = value.length >= 10 ? value.substring(0, 10) : value;
    final parts = normalized.split('-');
    if (parts.length == 3) {
      return '${parts[2]}/${parts[1]}/${parts[0]}';
    }

    return value;
  }

  static String statusLabel(String status) => switch (status) {
        'ACTIVE' => 'Activa',
        'CANCELED' => 'Anulada',
        _ => status,
      };

  static String sunatLabel(SunatStatus? status) => switch (status) {
        SunatStatus.accepted => 'Aceptado',
        SunatStatus.pending => 'Pendiente',
        SunatStatus.sent => 'Enviado',
        SunatStatus.rejected => 'Rechazado',
        SunatStatus.voided => 'Anulado',
        null => '—',
      };

  static String documentTypeLabel(SaleDocumentType? type) => switch (type) {
        SaleDocumentType.boleta => 'Boleta',
        SaleDocumentType.factura => 'Factura',
        SaleDocumentType.ticketInterno => 'Ticket interno',
        null => '—',
      };
}
