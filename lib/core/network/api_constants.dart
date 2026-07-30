/// Production API configuration constants.
abstract final class ApiConstants {
  /// Trailing slash is required so Dio resolves relative paths correctly.
  /// Without it, paths starting with '/' would strip the '/api' segment.
  static const String apiUrl = 'https://api.novedadesmaritex.net.pe/api/';

  static const int companyId = 1;

  /// Relative paths must NOT start with '/' when baseUrl has a trailing slash.
  static const String loginPath = 'auth/login';

  static const String mePath = 'auth/me';

  static const String accessTokenKey = 'auth_access_token';

  /// Identifies the app in API logs and helps Cloudflare WAF allow requests.
  static const String userAgent =
      'nm_mobile/1.0.0 (Android; Samsung Galaxy Tab A)';
}
