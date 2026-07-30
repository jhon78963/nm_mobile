/// Production API configuration constants.
abstract final class ApiConstants {
  static const String apiUrl = 'https://api.novedadesmaritex.net.pe/api';

  static const int companyId = 1;

  /// Laravel login endpoint (relative to [apiUrl]).
  /// Change this constant if the backend route changes.
  static const String loginPath = '/auth/login';

  static const String accessTokenKey = 'auth_access_token';

  /// Identifies the app in API logs and helps Cloudflare WAF allow requests.
  static const String userAgent =
      'nm_mobile/1.0.0 (Android; Samsung Galaxy Tab A)';
}
