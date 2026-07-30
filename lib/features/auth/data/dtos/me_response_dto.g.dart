// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeResponseDto _$MeResponseDtoFromJson(Map<String, dynamic> json) =>
    MeResponseDto(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      profilePicture: json['profilePicture'] as String?,
      role: json['role'] as String,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      permissions:
          (json['permissions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      tenantId: (json['tenantId'] as num?)?.toInt(),
      warehouseId: (json['warehouseId'] as num?)?.toInt(),
      mustChangePassword: json['mustChangePassword'] as bool? ?? false,
    );

Map<String, dynamic> _$MeResponseDtoToJson(MeResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'name': instance.name,
      'surname': instance.surname,
      'profilePicture': instance.profilePicture,
      'role': instance.role,
      'roles': instance.roles,
      'permissions': instance.permissions,
      'tenantId': instance.tenantId,
      'warehouseId': instance.warehouseId,
      'mustChangePassword': instance.mustChangePassword,
    };
