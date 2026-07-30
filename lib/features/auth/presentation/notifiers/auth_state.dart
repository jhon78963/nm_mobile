import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nm_mobile/features/auth/domain/entities/user.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  /// Initial state before any interaction.
  const factory AuthState.initial() = _AuthStateInitial;

  /// Session restore in progress on app startup.
  const factory AuthState.sessionLoading() = _AuthStateSessionLoading;

  /// Login request in flight.
  const factory AuthState.loading() = _AuthStateLoading;

  /// Credentials validated; [user] contains the authenticated profile.
  const factory AuthState.authenticated(User user) = _AuthStateAuthenticated;

  /// Session was cleared (e.g. after logout).
  const factory AuthState.unauthenticated() = _AuthStateUnauthenticated;

  /// Login failed; [message] contains the human-readable reason.
  const factory AuthState.failure(String message) = _AuthStateFailure;
}
