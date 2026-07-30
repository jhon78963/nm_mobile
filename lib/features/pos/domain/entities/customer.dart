import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.freezed.dart';

@freezed
abstract class PosCustomer with _$PosCustomer {
  const factory PosCustomer({
    required int id,
    required String dni,
    required String name,
    String? documentType,
    String? documentNumber,
  }) = _PosCustomer;
}
