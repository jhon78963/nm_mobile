import 'package:dio/dio.dart';

/// Extracts the Sanctum access token from a Laravel login response.
///
/// The backend returns tokens in HttpOnly cookies (`access_token`, `refresh_token`)
/// and does not include them in the JSON body (MeResource only).
///
/// Priority:
/// 1. JSON body fields: `token`, `access_token`, `accessToken`
/// 2. `Set-Cookie` header: `access_token=...`
String? extractAccessToken(Response<dynamic> response) {
  final fromJson = _extractFromJson(response.data);
  if (fromJson != null) return fromJson;

  return _extractFromCookies(response.headers);
}

String? _extractFromJson(dynamic data) {
  if (data is! Map<String, dynamic>) return null;

  for (final key in ['token', 'access_token', 'accessToken']) {
    final value = data[key];
    if (value is String && value.isNotEmpty) return value;
  }

  return null;
}

String? _extractFromCookies(Headers headers) {
  final cookies = headers['set-cookie'];
  if (cookies == null || cookies.isEmpty) return null;

  for (final cookie in cookies) {
    final token = _parseAccessTokenCookie(cookie);
    if (token != null) return token;
  }

  return null;
}

String? _parseAccessTokenCookie(String cookie) {
  final nameValue = cookie.split(';').first.trim();
  const prefix = 'access_token=';
  if (!nameValue.startsWith(prefix)) return null;

  final token = Uri.decodeComponent(nameValue.substring(prefix.length));
  return token.isNotEmpty ? token : null;
}
