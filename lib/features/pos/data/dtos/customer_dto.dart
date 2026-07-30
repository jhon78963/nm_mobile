import 'package:json_annotation/json_annotation.dart';
import 'package:nm_mobile/features/pos/domain/entities/customer.dart';

part 'customer_dto.g.dart';

@JsonSerializable(createToJson: false)
final class CustomerDto {
  CustomerDto({
    required this.id,
    this.dni,
    this.documentNumber,
    this.documentType,
    required this.name,
  });

  final int id;
  final String? dni;

  @JsonKey(name: 'document_number')
  final String? documentNumber;

  @JsonKey(name: 'document_type')
  final String? documentType;

  final String name;

  factory CustomerDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerDtoFromJson(json);

  PosCustomer toDomain() => PosCustomer(
        id: id,
        dni: dni ?? documentNumber ?? '',
        name: name,
        documentType: documentType,
        documentNumber: documentNumber ?? dni,
      );
}
