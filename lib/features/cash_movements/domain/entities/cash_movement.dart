import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nm_mobile/features/cash_movements/domain/entities/cash_movement_enums.dart';

part 'cash_movement.freezed.dart';

@freezed
abstract class CashMovementItem with _$CashMovementItem {
  const factory CashMovementItem({
    required int id,
    required String time,
    required String description,
    required String method,
    required double amount,
    String? date,
    CashPaymentMethod? paymentMethod,
  }) = _CashMovementItem;
}

@freezed
abstract class CashDailySummary with _$CashDailySummary {
  const factory CashDailySummary({
    @Default(0) double openingBalance,
    @Default(0) double finalBalance,
    @Default(0) double totalSales,
    @Default(0) double totalIncomes,
    @Default(0) double totalExpenses,
  }) = _CashDailySummary;
}

@freezed
abstract class CashDailyLists with _$CashDailyLists {
  const factory CashDailyLists({
    @Default([]) List<CashMovementItem> sales,
    @Default([]) List<CashMovementItem> incomes,
    @Default([]) List<CashMovementItem> expenses,
  }) = _CashDailyLists;
}

@freezed
abstract class CashDailyReport with _$CashDailyReport {
  const factory CashDailyReport({
    required CashDailyLists lists,
    required CashDailySummary summary,
  }) = _CashDailyReport;

  static const empty = CashDailyReport(
    lists: CashDailyLists(),
    summary: CashDailySummary(),
  );
}

@freezed
abstract class MovementPayload with _$MovementPayload {
  const factory MovementPayload({
    required MovementType type,
    required MovementCategory category,
    required double amount,
    required String description,
    required String date,
    required CashPaymentMethod paymentMethod,
  }) = _MovementPayload;
}

@freezed
abstract class PaymentMethodFilter with _$PaymentMethodFilter {
  const factory PaymentMethodFilter({
    @Default(true) bool cash,
    @Default(true) bool yape,
    @Default(true) bool card,
  }) = _PaymentMethodFilter;
}
