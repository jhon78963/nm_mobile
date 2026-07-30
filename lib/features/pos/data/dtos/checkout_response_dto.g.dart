// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutResponseDto _$CheckoutResponseDtoFromJson(Map<String, dynamic> json) =>
    CheckoutResponseDto(
      success: json['success'] as bool,
      saleId: (json['sale_id'] as num?)?.toInt(),
      message: json['message'],
      error: json['error'],
    );
