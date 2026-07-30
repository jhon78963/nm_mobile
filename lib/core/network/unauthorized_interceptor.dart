import 'package:dio/dio.dart';
import 'package:nm_mobile/core/network/api_constants.dart';
import 'package:nm_mobile/core/network/unauthorized_handler.dart';

/// Logs the user out and redirects to login when the session expires (401).
final class UnauthorizedInterceptor extends Interceptor {
  const UnauthorizedInterceptor();

  static const _publicPaths = [
    ApiConstants.loginPath,
  ];

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401 && !_isPublicRequest(err)) {
      await _handleUnauthorized();
    }
    handler.next(err);
  }

  bool _isPublicRequest(DioException err) {
    final path = err.requestOptions.path;
    return _publicPaths.any(path.contains);
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
