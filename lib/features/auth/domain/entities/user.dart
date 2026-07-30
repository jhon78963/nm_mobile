import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// Pure domain entity — no Flutter imports allowed here.
@freezed
abstract class User with _$User {
  const factory User({
    required int id,
    required String username,
    required String email,
    required String name,
    required String surname,
    String? profilePicture,
    required String role,
    @Default([]) List<String> roles,
    @Default([]) List<String> permissions,
    int? tenantId,
    int? warehouseId,
    @Default(false) bool mustChangePassword,
  }) = _User;
}
