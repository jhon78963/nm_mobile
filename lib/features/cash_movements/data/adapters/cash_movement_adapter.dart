import 'package:nm_mobile/features/cash_movements/domain/entities/cash_movement.dart';
import 'package:nm_mobile/features/cash_movements/domain/entities/cash_movement_enums.dart';

double _toNumber(dynamic value, [double fallback = 0]) {
  final parsed = num.tryParse(value?.toString() ?? '');
  return parsed?.toDouble() ?? fallback;
}

CashMovementItem _adaptMovementItem(Map<String, dynamic> raw) {
  final method = (raw['method'] ?? raw['payment_method'] ?? 'CASH').toString();

  return CashMovementItem(
    id: _toNumber(raw['id']).toInt(),
    time: (raw['time'] ?? '').toString(),
    description: (raw['description'] ?? '').toString(),
    method: method,
    amount: _toNumber(raw['amount']),
    date: raw['date']?.toString(),
    paymentMethod: CashPaymentMethod.fromApi(method),
  );
}

CashDailySummary _adaptSummary(Map<String, dynamic>? raw) {
  final source = raw ?? {};
  return CashDailySummary(
    openingBalance: _toNumber(
      source['opening_balance'] ?? source['openingBalance'],
    ),
    finalBalance: _toNumber(
      source['final_balance'] ?? source['finalBalance'],
    ),
    totalSales: _toNumber(source['total_sales'] ?? source['totalSales']),
    totalIncomes: _toNumber(source['total_incomes'] ?? source['totalIncomes']),
    totalExpenses: _toNumber(
      source['total_expenses'] ?? source['totalExpenses'],
    ),
  );
}

CashDailyReport adaptCashDailyReport(dynamic raw) {
  final data = raw is Map<String, dynamic> && raw['data'] is Map<String, dynamic>
      ? raw['data'] as Map<String, dynamic>
      : raw as Map<String, dynamic>? ?? {};

  final lists = data['lists'] as Map<String, dynamic>? ?? {};

  List<CashMovementItem> mapList(dynamic items) {
    if (items is! List) return [];
    return items
        .map((e) => _adaptMovementItem(e as Map<String, dynamic>))
        .toList();
  }

  return CashDailyReport(
    lists: CashDailyLists(
      sales: mapList(lists['sales']),
      incomes: mapList(lists['incomes']),
      expenses: mapList(lists['expenses']),
    ),
    summary: _adaptSummary(data['summary'] as Map<String, dynamic>?),
  );
}

bool matchesPaymentFilter(String method, PaymentMethodFilter filters) {
  final normalized = method.toUpperCase();
  if (normalized.contains('CASH') || normalized.contains('EFECTIVO')) {
    return filters.cash;
  }
  if (normalized.contains('YAPE') || normalized.contains('PLIN')) {
    return filters.yape;
  }
  if (normalized.contains('CARD') || normalized.contains('TARJETA')) {
    return filters.card;
  }
  return true;
}

String formatIsoDate(DateTime date) {
  final y = date.year.toString().padLeft(4, '0');
  final m = date.month.toString().padLeft(2, '0');
  final d = date.day.toString().padLeft(2, '0');
  return '$y-$m-$d';
}

String formatDateTime(DateTime date) {
  final h = date.hour.toString().padLeft(2, '0');
  final min = date.minute.toString().padLeft(2, '0');
  final s = date.second.toString().padLeft(2, '0');
  return '${formatIsoDate(date)} $h:$min:$s';
}

String formatViewDate(DateTime date) {
  const weekdays = [
    'lunes', 'martes', 'miércoles', 'jueves', 'viernes', 'sábado', 'domingo',
  ];
  const months = [
    'enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio',
    'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre',
  ];
  String cap(String t) =>
      t.isEmpty ? t : t[0].toUpperCase() + t.substring(1);

  final weekday = cap(weekdays[date.weekday - 1]);
  final month = cap(months[date.month - 1]);
  final day = date.day.toString().padLeft(2, '0');
  return '$weekday $day de $month, ${date.year}';
}
