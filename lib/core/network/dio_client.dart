import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nm_mobile/core/network/api_constants.dart';
import 'package:nm_mobile/core/network/auth_token_interceptor.dart';

/// Creates a configured [Dio] client for the production API.
Dio createDioClient(FlutterSecureStorage secureStorage) {
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

  dio.interceptors.add(AuthTokenInterceptor(secureStorage));

  return dio;
}

/// App-scoped encrypted key-value storage.
final secureStorageProvider = Provider<FlutterSecureStorage>(
  (_) => const FlutterSecureStorage(),
);

/// App-scoped [Dio] HTTP client wired with auth interceptor.
final dioClientProvider = Provider<Dio>(
  (ref) => createDioClient(ref.watch(secureStorageProvider)),
);
