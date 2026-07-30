import 'package:nm_mobile/features/auth/data/dtos/me_response_dto.dart';

/// Result of a successful login HTTP call.
final class AuthLoginResult {
  const AuthLoginResult({
    required this.user,
    required this.accessToken,
  });

  final MeResponseDto user;
  final String accessToken;
}
