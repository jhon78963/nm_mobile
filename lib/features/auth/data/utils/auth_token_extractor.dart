import 'package:dio/dio.dart';

/// Extracts the access token from a Laravel login response.
///
/// Priority:
/// 1. JSON body fields: `token`, `access_token`, `accessToken`
/// 2. `Set-Cookie` header: `access_token` (current Laravel backend behavior)
String? extractAccessToken(Response<dynamic> response) {
  final fromJson = _extractFromJson(response.data);
  if (fromJson != null) return fromJson;

  return _extractFromCookies(response.headers['set-cookie']);
}

String? _extractFromJson(dynamic data) {
  if (data is! Map<String, dynamic>) return null;

  for (final key in ['token', 'access_token', 'accessToken']) {
    final value = data[key];
    if (value is String && value.isNotEmpty) return value;
  }

  return null;
}

String? _extractFromCookies(dynamic rawCookies) {
  if (rawCookies == null) return null;

  final cookies = rawCookies is List ? rawCookies : [rawCookies];

  for (final cookie in cookies) {
    if (cookie is! String) continue;

    final nameValue = cookie.split(';').first.trim();
    if (!nameValue.startsWith('access_token=')) continue;

    final token = nameValue.substring('access_token='.length);
    if (token.isNotEmpty) return token;
  }

  return null;
}
