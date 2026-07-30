// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDto _$CustomerDtoFromJson(Map<String, dynamic> json) => CustomerDto(
  id: (json['id'] as num).toInt(),
  dni: json['dni'] as String?,
  documentNumber: json['document_number'] as String?,
  documentType: json['document_type'] as String?,
  name: json['name'] as String,
);
