enum CashPaymentMethod {
  cash('CASH'),
  yape('YAPE'),
  card('CARD');

  const CashPaymentMethod(this.apiValue);
  final String apiValue;

  String get label => switch (this) {
        CashPaymentMethod.cash => 'Efectivo',
        CashPaymentMethod.yape => 'Yape / Plin',
        CashPaymentMethod.card => 'Tarjeta',
      };

  static CashPaymentMethod fromApi(String? value) {
    final raw = value?.toUpperCase().trim() ?? '';
    if (raw.contains('YAPE') || raw.contains('PLIN')) return CashPaymentMethod.yape;
    if (raw.contains('CARD') || raw.contains('TARJETA')) {
      return CashPaymentMethod.card;
    }
    return CashPaymentMethod.cash;
  }
}

enum MovementType {
  income('INCOME'),
  expense('EXPENSE');

  const MovementType(this.apiValue);
  final String apiValue;
}

enum MovementCategory {
  store('STORE'),
  administrative('ADMINISTRATIVE'),
  accumulated('ACCUMULATED');

  const MovementCategory(this.apiValue);
  final String apiValue;
}
