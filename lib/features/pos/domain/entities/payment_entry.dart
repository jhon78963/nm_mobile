import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nm_mobile/features/pos/domain/entities/payment_method.dart';

part 'payment_entry.freezed.dart';

@freezed
abstract class PaymentEntry with _$PaymentEntry {
  const factory PaymentEntry({
    required PaymentMethod method,
    required double amount,
  }) = _PaymentEntry;
}
