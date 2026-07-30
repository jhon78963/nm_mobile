import 'package:json_annotation/json_annotation.dart';
import 'package:nm_mobile/features/auth/domain/entities/user.dart';

part 'me_response_dto.g.dart';

/// Maps the Laravel MeResource JSON response to a Dart object.
/// The backend already returns camelCase keys, so @JsonKey is used
/// only for explicit documentation and future-proofing.
@JsonSerializable()
final class MeResponseDto {
  const MeResponseDto({
    required this.id,
    required this.username,
    required this.email,
    required this.name,
    required this.surname,
    this.profilePicture,
    required this.role,
    this.roles = const [],
    this.permissions = const [],
    this.tenantId,
    this.warehouseId,
    this.mustChangePassword = false,
  });

  final int id;
  final String username;
  final String email;
  final String name;
  final String surname;

  @JsonKey(name: 'profilePicture')
  final String? profilePicture;

  final String role;
  final List<String> roles;
  final List<String> permissions;

  @JsonKey(name: 'tenantId')
  final int? tenantId;

  @JsonKey(name: 'warehouseId')
  final int? warehouseId;

  @JsonKey(name: 'mustChangePassword')
  final bool mustChangePassword;

  factory MeResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MeResponseDtoFromJson(json);

  /// Supports direct MeResource JSON or Laravel `{ data: ... }` wrappers.
  factory MeResponseDto.fromResponseData(dynamic data) {
    if (data is Map<String, dynamic> && data['data'] is Map<String, dynamic>) {
      return MeResponseDto.fromJson(data['data'] as Map<String, dynamic>);
    }

    return MeResponseDto.fromJson(data as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() => _$MeResponseDtoToJson(this);

  /// Maps this DTO to the pure domain [User] entity.
  User toDomain() => User(
        id: id,
        username: username,
        email: email,
        name: name,
        surname: surname,
        profilePicture: profilePicture,
        role: role,
        roles: roles,
        permissions: permissions,
        tenantId: tenantId,
        warehouseId: warehouseId,
        mustChangePassword: mustChangePassword,
      );
}
