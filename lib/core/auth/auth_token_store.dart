/// In-memory cache for the Sanctum access token.
///
/// Secure storage reads are async and can fail or lag on Android right after
/// login. The interceptor reads this store first so authenticated requests
/// always carry the token immediately after login.
final class AuthTokenStore {
  String? _token;

  String? get token => _token;

  bool get hasToken => _token != null && _token!.isNotEmpty;

  void setToken(String token) {
    _token = token;
  }

  void clear() {
    _token = null;
  }
}
