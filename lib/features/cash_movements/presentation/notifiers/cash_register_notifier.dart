import 'dart:async';

import 'package:nm_mobile/features/cash_movements/data/adapters/cash_movement_adapter.dart';
import 'package:nm_mobile/features/cash_movements/data/cash_movement_data_providers.dart';
import 'package:nm_mobile/features/cash_movements/domain/entities/cash_movement.dart';
import 'package:nm_mobile/features/cash_movements/presentation/notifiers/cash_register_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cash_register_notifier.g.dart';

@riverpod
class CashRegisterNotifier extends _$CashRegisterNotifier {
  Timer? _toastTimer;

  @override
  CashRegisterState build() {
    ref.onDispose(() => _toastTimer?.cancel());
    Future.microtask(loadReport);
    return CashRegisterState(selectedDate: DateTime.now());
  }

  String get _dateIso => formatIsoDate(state.selectedDate);

  void showToast(String message) {
    _toastTimer?.cancel();
    state = state.copyWith(toastMessage: message);
    _toastTimer = Timer(const Duration(seconds: 3), () {
      if (state.toastMessage == message) {
        state = state.copyWith(toastMessage: null);
      }
    });
  }

  void clearToast() => state = state.copyWith(toastMessage: null);

  Future<void> loadReport() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final report =
          await ref.read(cashMovementRepositoryProvider).loadDailyReport(_dateIso);
      state = state.copyWith(report: report, isLoading: false);
    } on Exception catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  void changeDate(int days) {
    final next = state.selectedDate.add(Duration(days: days));
    state = state.copyWith(selectedDate: next);
    loadReport();
  }

  void goToToday() {
    state = state.copyWith(selectedDate: DateTime.now());
    loadReport();
  }

  void toggleFilter(PaymentMethodFilter Function(PaymentMethodFilter) updater) {
    state = state.copyWith(paymentFilters: updater(state.paymentFilters));
  }

  Future<void> registerMovement(MovementPayload payload) async {
    state = state.copyWith(isLoading: true);
    try {
      final report = await ref
          .read(cashMovementRepositoryProvider)
          .registerMovement(payload, _dateIso);
      state = state.copyWith(report: report, isLoading: false);
      showToast('Movimiento registrado.');
    } on Exception catch (e) {
      state = state.copyWith(isLoading: false);
      showToast(e.toString().replaceFirst('Exception: ', ''));
    }
  }

  Future<void> updateMovement(int id, MovementPayload payload) async {
    state = state.copyWith(isLoading: true);
    try {
      final report = await ref
          .read(cashMovementRepositoryProvider)
          .updateMovement(id, payload, _dateIso);
      state = state.copyWith(report: report, isLoading: false);
      showToast('Movimiento actualizado.');
    } on Exception catch (e) {
      state = state.copyWith(isLoading: false);
      showToast(e.toString().replaceFirst('Exception: ', ''));
    }
  }

  Future<void> deleteMovement(int id) async {
    state = state.copyWith(isLoading: true);
    try {
      final report = await ref
          .read(cashMovementRepositoryProvider)
          .deleteMovement(id, _dateIso);
      state = state.copyWith(report: report, isLoading: false);
      showToast('Movimiento eliminado.');
    } on Exception catch (e) {
      state = state.copyWith(isLoading: false);
      showToast(e.toString().replaceFirst('Exception: ', ''));
    }
  }

  List<CashMovementItem> filteredSales() =>
      _filterList(state.report.lists.sales);

  List<CashMovementItem> filteredIncomes() =>
      _filterList(state.report.lists.incomes);

  List<CashMovementItem> filteredExpenses() =>
      _filterList(state.report.lists.expenses);

  double get filteredTotalIncomes =>
      filteredSales().fold(0.0, (s, i) => s + i.amount) +
      filteredIncomes().fold(0.0, (s, i) => s + i.amount);

  double get filteredTotalExpenses =>
      filteredExpenses().fold(0.0, (s, i) => s + i.amount);

  double get filteredFinalBalance =>
      state.report.summary.openingBalance +
      filteredTotalIncomes -
      filteredTotalExpenses;

  List<CashMovementItem> _filterList(List<CashMovementItem> list) =>
      list.where((i) => matchesPaymentFilter(i.method, state.paymentFilters)).toList();
}
