import 'package:nm_mobile/features/auth/domain/entities/user.dart';

/// Abstract contract for authentication — pure Dart, no framework dependency.
abstract interface class AuthRepository {
  /// Authenticates the user against the Laravel API.
  /// Throws an [Exception] with a human-readable message on failure.
  Future<User> login(String username, String password);

  Future<void> logout();

  /// Returns true if a valid session token exists in secure storage.
  Future<bool> hasActiveSession();
}
