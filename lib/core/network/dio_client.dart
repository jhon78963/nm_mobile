import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nm_mobile/core/auth/auth_token_store.dart';
import 'package:nm_mobile/core/network/api_constants.dart';
import 'package:nm_mobile/core/network/auth_token_interceptor.dart';
import 'package:nm_mobile/core/network/unauthorized_interceptor.dart';

/// Creates a configured [Dio] client for the production API.
Dio createDioClient(
  FlutterSecureStorage secureStorage,
  AuthTokenStore tokenStore,
) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.apiUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'User-Agent': ApiConstants.userAgent,
        'X-Company-Id': ApiConstants.companyId.toString(),
      },
    ),
  );

  dio.interceptors.add(AuthTokenInterceptor(secureStorage, tokenStore));
  dio.interceptors.add(const UnauthorizedInterceptor());

  return dio;
}

/// Shared in-memory token cache (same instance for repo + interceptor).
final authTokenStoreProvider = Provider<AuthTokenStore>(
  (ref) => AuthTokenStore(),
);

/// App-scoped encrypted key-value storage.
final secureStorageProvider = Provider<FlutterSecureStorage>(
  (_) => const FlutterSecureStorage(),
);

/// App-scoped [Dio] HTTP client wired with auth interceptor.
final dioClientProvider = Provider<Dio>(
  (ref) => createDioClient(
    ref.watch(secureStorageProvider),
    ref.watch(authTokenStoreProvider),
  ),
);
