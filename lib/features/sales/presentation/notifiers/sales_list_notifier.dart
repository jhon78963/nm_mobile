import 'dart:async';

import 'package:nm_mobile/features/sales/data/sales_data_providers.dart';
import 'package:nm_mobile/features/sales/presentation/notifiers/sales_list_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sales_list_notifier.g.dart';

@riverpod
class SalesListNotifier extends _$SalesListNotifier {
  Timer? _toastTimer;

  @override
  SalesListState build() {
    ref.onDispose(() => _toastTimer?.cancel());
    Future.microtask(load);
    return const SalesListState();
  }

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

  Future<void> load({int? page, String? search}) async {
    final nextPage = page ?? state.page;
    final nextSearch = search ?? state.search;

    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      page: nextPage,
      search: nextSearch,
    );

    try {
      final result = await ref.read(saleRepositoryProvider).getAll(
            limit: state.limit,
            page: nextPage,
            search: nextSearch.isEmpty ? null : nextSearch,
          );

      state = state.copyWith(
        sales: result.data,
        total: result.paginate.total,
        totalPages: result.paginate.pages,
        isLoading: false,
      );
    } on Exception catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  void setSearch(String value) {
    load(page: 1, search: value);
  }

  void goToPage(int page) {
    if (page < 1 || page > state.totalPages || page == state.page) return;
    load(page: page);
  }

  Future<void> cancelSale(int id) async {
    state = state.copyWith(isLoading: true);
    try {
      await ref.read(saleRepositoryProvider).cancel(id);
      showToast('La venta ha sido anulada.');
      final nextPage =
          state.sales.length == 1 && state.page > 1 ? state.page - 1 : state.page;
      await load(page: nextPage);
    } on Exception catch (e) {
      state = state.copyWith(isLoading: false);
      showToast(e.toString().replaceFirst('Exception: ', ''));
    }
  }

  Future<String?> fetchTicketHtml(int saleId) async {
    try {
      return await ref.read(saleRepositoryProvider).fetchTicketHtml(saleId);
    } on Exception catch (e) {
      showToast(e.toString().replaceFirst('Exception: ', ''));
      return null;
    }
  }
}
