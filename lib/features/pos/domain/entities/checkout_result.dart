import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_result.freezed.dart';

@freezed
abstract class CheckoutResult with _$CheckoutResult {
  const factory CheckoutResult({
    required bool success,
    int? saleId,
    String? message,
  }) = _CheckoutResult;
}
