import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nm_mobile/features/cash_movements/domain/entities/cash_movement.dart';

part 'cash_register_state.freezed.dart';

@freezed
abstract class CashRegisterState with _$CashRegisterState {
  const factory CashRegisterState({
    required DateTime selectedDate,
    @Default(CashDailyReport.empty) CashDailyReport report,
    @Default(PaymentMethodFilter()) PaymentMethodFilter paymentFilters,
    @Default(false) bool isLoading,
    String? errorMessage,
    String? toastMessage,
  }) = _CashRegisterState;
}
