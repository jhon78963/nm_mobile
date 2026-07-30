import 'package:json_annotation/json_annotation.dart';
import 'package:nm_mobile/features/pos/domain/entities/checkout_result.dart';

part 'checkout_response_dto.g.dart';

@JsonSerializable(createToJson: false)
final class CheckoutResponseDto {
  CheckoutResponseDto({
    required this.success,
    this.saleId,
    this.message,
    this.error,
  });

  final bool success;

  @JsonKey(name: 'sale_id')
  final int? saleId;

  final dynamic message;
  final dynamic error;

  factory CheckoutResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResponseDtoFromJson(json);

  CheckoutResult toDomain() {
    final raw = message ?? error;
    String? text;
    if (raw is String && raw.trim().isNotEmpty) {
      text = raw.trim();
    } else if (raw is List && raw.isNotEmpty) {
      text = raw.first.toString();
    }

    return CheckoutResult(
      success: success,
      saleId: saleId,
      message: text,
    );
  }
}
