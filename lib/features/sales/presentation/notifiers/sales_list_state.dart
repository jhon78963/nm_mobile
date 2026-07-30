import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nm_mobile/features/sales/domain/entities/sale.dart';

part 'sales_list_state.freezed.dart';

@freezed
abstract class SalesListState with _$SalesListState {
  const factory SalesListState({
    @Default([]) List<Sale> sales,
    @Default(1) int page,
    @Default(10) int limit,
    @Default(0) int total,
    @Default(1) int totalPages,
    @Default('') String search,
    @Default(false) bool isLoading,
    String? errorMessage,
    String? toastMessage,
  }) = _SalesListState;
}
