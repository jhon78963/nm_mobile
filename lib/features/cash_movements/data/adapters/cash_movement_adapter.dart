import 'package:nm_mobile/features/cash_movements/domain/entities/cash_movement.dart';
import 'package:nm_mobile/features/cash_movements/domain/entities/cash_movement_enums.dart';

double _toNumber(dynamic value, [double fallback = 0]) {
  final parsed = num.tryParse(value?.toString() ?? '');
  return parsed?.toDouble() ?? fallback;
}

Map<String, dynamic>? _asStringKeyMap(dynamic value) {
  if (value is Map<String, dynamic>) return value;
  if (value is Map) {
    return value.map((key, val) => MapEntry(key.toString(), val));
  }
  return null;
}

CashMovementItem _adaptMovementItem(dynamic raw) {
  final map = _asStringKeyMap(raw) ?? {};
  final method =
      (map['method'] ?? map['payment_method'] ?? 'CASH').toString();

  return CashMovementItem(
    id: _toNumber(map['id']).toInt(),
    time: (map['time'] ?? '').toString(),
    description: (map['description'] ?? '').toString(),
    method: method,
    amount: _toNumber(map['amount']),
    date: map['date']?.toString(),
    paymentMethod: CashPaymentMethod.fromApi(method),
  );
}

CashDailySummary _adaptSummary(dynamic raw) {
  final source = _asStringKeyMap(raw) ?? {};
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

/// Normalizes list payloads from Laravel (array, numeric-key map, or JsonResource).
List<dynamic> _coerceToRawList(dynamic items) {
  if (items == null) return const [];

  if (items is List) return items;

  final map = _asStringKeyMap(items);
  if (map == null) return const [];

  // JsonResource-style wrapper: { "data": [ ... ] }
  final nested = map['data'];
  if (nested is List) return nested;

  // PHP/Laravel object-style arrays: { "0": {...}, "1": {...} }
  if (map.isNotEmpty && map.values.every((v) => v is Map || _asStringKeyMap(v) != null)) {
    return map.values.toList();
  }

  return const [];
}

List<CashMovementItem> _mapMovementList(dynamic items) {
  return _coerceToRawList(items).map(_adaptMovementItem).toList();
}

CashDailyReport adaptCashDailyReport(dynamic raw) {
  final root = _asStringKeyMap(raw) ?? {};
  final data = _asStringKeyMap(root['data']) ?? root;
  final lists = _asStringKeyMap(data['lists']) ?? {};

  return CashDailyReport(
    lists: CashDailyLists(
      sales: _mapMovementList(lists['sales']),
      incomes: _mapMovementList(lists['incomes']),
      expenses: _mapMovementList(lists['expenses']),
    ),
    summary: _adaptSummary(data['summary']),
  );
}

bool matchesPaymentFilter(String method, PaymentMethodFilter filters) {
  final normalized = method.toUpperCase();

  // Ventas MIXTO ya vienen filtradas por método en el backend.
  if (normalized.contains('MIXTO')) {
    return filters.cash || filters.yape || filters.card;
  }

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
