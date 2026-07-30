enum PaymentMethod {
  cash('CASH'),
  yape('YAPE'),
  card('CARD');

  const PaymentMethod(this.apiValue);

  final String apiValue;

  String get label => switch (this) {
        PaymentMethod.cash => 'Efectivo',
        PaymentMethod.yape => 'Yape / Plin',
        PaymentMethod.card => 'Tarjeta',
      };
}
