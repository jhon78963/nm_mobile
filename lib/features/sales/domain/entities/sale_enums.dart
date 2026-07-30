enum SunatStatus {
  pending('PENDING'),
  sent('SENT'),
  accepted('ACCEPTED'),
  rejected('REJECTED'),
  voided('VOIDED');

  const SunatStatus(this.apiValue);
  final String apiValue;

  static SunatStatus? fromApi(String? value) {
    return switch (value) {
      'PENDING' => SunatStatus.pending,
      'SENT' => SunatStatus.sent,
      'ACCEPTED' => SunatStatus.accepted,
      'REJECTED' => SunatStatus.rejected,
      'VOIDED' => SunatStatus.voided,
      _ => null,
    };
  }
}

enum SaleDocumentType {
  boleta('BOLETA'),
  factura('FACTURA'),
  ticketInterno('TICKET_INTERNO');

  const SaleDocumentType(this.apiValue);
  final String apiValue;

  static SaleDocumentType? fromApi(String? value) {
    return switch (value) {
      'BOLETA' => SaleDocumentType.boleta,
      'FACTURA' => SaleDocumentType.factura,
      'TICKET_INTERNO' => SaleDocumentType.ticketInterno,
      _ => null,
    };
  }
}

enum SalePaymentMethod {
  cash('CASH'),
  yape('YAPE'),
  card('CARD');

  const SalePaymentMethod(this.apiValue);
  final String apiValue;

  String get label => switch (this) {
        SalePaymentMethod.cash => 'Efectivo',
        SalePaymentMethod.yape => 'Yape / Plin',
        SalePaymentMethod.card => 'Tarjeta',
      };

  static SalePaymentMethod normalize(String? value) {
    final raw = value?.toUpperCase().trim() ?? '';
    if (raw.isEmpty || raw == 'CASH' || raw == 'EFECTIVO') {
      return SalePaymentMethod.cash;
    }
    if (raw == 'YAPE' ||
        raw == 'YAPE/PLIN' ||
        raw == 'PLIN' ||
        raw.contains('YAPE') ||
        raw.contains('PLIN')) {
      return SalePaymentMethod.yape;
    }
    if (raw == 'CARD' || raw == 'TARJETA') return SalePaymentMethod.card;
    return SalePaymentMethod.cash;
  }
}
