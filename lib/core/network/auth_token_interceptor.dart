import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nm_mobile/core/auth/auth_token_store.dart';
import 'package:nm_mobile/core/network/api_constants.dart';

/// Injects `Authorization: Bearer {token}` on authenticated API requests.
final class AuthTokenInterceptor extends Interceptor {
  const AuthTokenInterceptor(this._secureStorage, this._tokenStore);

  final FlutterSecureStorage _secureStorage;
  final AuthTokenStore _tokenStore;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _resolveToken();

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  Future<String?> _resolveToken() async {
    final cached = _tokenStore.token;
    if (cached != null && cached.isNotEmpty) return cached;

    final stored = await _secureStorage.read(key: ApiConstants.accessTokenKey);
    if (stored != null && stored.isNotEmpty) {
      _tokenStore.setToken(stored);
      return stored;
    }

    return null;
  }
}
