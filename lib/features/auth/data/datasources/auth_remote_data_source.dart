import 'package:dio/dio.dart';
import 'package:nm_mobile/core/network/api_constants.dart';
import 'package:nm_mobile/features/auth/data/dtos/me_response_dto.dart';
import 'package:nm_mobile/features/auth/data/models/auth_login_result.dart';
import 'package:nm_mobile/features/auth/data/utils/auth_token_extractor.dart';
import 'package:nm_mobile/features/auth/data/utils/dio_exception_mapper.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthLoginResult> login(String username, String password);

  Future<MeResponseDto> getMe();
}

final class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<AuthLoginResult> login(String username, String password) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiConstants.loginPath,
        data: {
          'username': username,
          'password': password,
        },
      );

      final accessToken = extractAccessToken(response);
      if (accessToken == null || accessToken.isEmpty) {
        throw Exception('No se recibió un token de autenticación válido.');
      }

      final user = MeResponseDto.fromResponseData(response.data);
      return AuthLoginResult(user: user, accessToken: accessToken);
    } on DioException catch (error) {
      throw mapDioException(error);
    }
  }

  @override
  Future<MeResponseDto> getMe() async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiConstants.mePath,
        data: const {},
      );

      return MeResponseDto.fromResponseData(response.data);
    } on DioException catch (error) {
      throw mapDioException(error);
    }
  }
}
