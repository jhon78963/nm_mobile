import 'package:dio/dio.dart';

/// Maps [DioException] to a human-readable [Exception] for the UI layer.
Exception mapDioException(DioException error) {
  final statusCode = error.response?.statusCode;
  final backendMessage = _extractBackendMessage(error.response?.data);

  if (backendMessage != null) return Exception(backendMessage);

  return switch (statusCode) {
    401 => Exception('Credenciales inválidas. Verifica tu usuario y contraseña.'),
    419 => Exception('La sesión de seguridad expiró. Intenta de nuevo.'),
    429 => Exception('Demasiados intentos. Espera un minuto e inténtalo de nuevo.'),
    _ => Exception(
        error.message ?? 'Error de conexión. Verifica tu red e intenta nuevamente.',
      ),
  };
}

String? _extractBackendMessage(dynamic data) {
  if (data is! Map<String, dynamic>) return null;

  final message = data['message'];
  if (message is String && message.trim().isNotEmpty) return message.trim();
  if (message is List && message.isNotEmpty) {
    return message.map((item) => item.toString()).join(' ');
  }

  return null;
}
