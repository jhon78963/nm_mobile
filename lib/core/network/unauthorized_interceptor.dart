import 'package:dio/dio.dart';
import 'package:nm_mobile/core/network/api_constants.dart';
import 'package:nm_mobile/core/network/unauthorized_handler.dart';

/// Logs the user out when the API returns 401 on an authenticated request.
final class UnauthorizedInterceptor extends Interceptor {
  const UnauthorizedInterceptor();

  static const _publicPaths = [
    ApiConstants.loginPath,
    ApiConstants.mePath,
  ];

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401 &&
        !_isPublicRequest(err) &&
        _hadAuthorizationHeader(err)) {
      await _handleUnauthorized();
    }
    handler.next(err);
  }

  bool _isPublicRequest(DioException err) {
    final path = err.requestOptions.path;
    return _publicPaths.any(path.contains);
  }

  /// Only logout when the request was sent with a token that the server rejected.
  /// If no token was attached, it is a client-side issue — do not kick the user out.
  bool _hadAuthorizationHeader(DioException err) {
    final auth = err.requestOptions.headers['Authorization'];
    return auth is String && auth.startsWith('Bearer ') && auth.length > 7;
  }

  Future<void> _handleUnauthorized() async {
    if (UnauthorizedHandler.isHandling) return;
    final callback = UnauthorizedHandler.onUnauthorized;
    if (callback == null) return;

    UnauthorizedHandler.isHandling = true;
    try {
      await callback();
    } finally {
      UnauthorizedHandler.isHandling = false;
    }
  }
}
