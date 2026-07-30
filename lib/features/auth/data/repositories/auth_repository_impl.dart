import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nm_mobile/core/auth/auth_token_store.dart';
import 'package:nm_mobile/core/network/api_constants.dart';
import 'package:nm_mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:nm_mobile/features/auth/domain/entities/user.dart';
import 'package:nm_mobile/features/auth/domain/repositories/auth_repository.dart';

final class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.secureStorage,
    required this.tokenStore,
  });

  final AuthRemoteDataSource remoteDataSource;
  final FlutterSecureStorage secureStorage;
  final AuthTokenStore tokenStore;

  @override
  Future<User> login(String username, String password) async {
    final result = await remoteDataSource.login(username, password);

    // Memory first so the very next API call has the token immediately.
    tokenStore.setToken(result.accessToken);
    await secureStorage.write(
      key: ApiConstants.accessTokenKey,
      value: result.accessToken,
    );

    return result.user.toDomain();
  }

  @override
  Future<User> getMe() async {
    final dto = await remoteDataSource.getMe();
    return dto.toDomain();
  }

  @override
  Future<void> logout() async {
    tokenStore.clear();
    await secureStorage.delete(key: ApiConstants.accessTokenKey);
  }

  @override
  Future<bool> hasActiveSession() async {
    final value = await secureStorage.read(key: ApiConstants.accessTokenKey);
    if (value != null && value.isNotEmpty) {
      tokenStore.setToken(value);
      return true;
    }
    tokenStore.clear();
    return false;
  }
}
