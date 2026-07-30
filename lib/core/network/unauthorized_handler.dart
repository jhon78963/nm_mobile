typedef UnauthorizedCallback = Future<void> Function();

/// Global hook invoked when the API returns 401 on an authenticated request.
abstract final class UnauthorizedHandler {
  static UnauthorizedCallback? onUnauthorized;
  static var isHandling = false;
}
