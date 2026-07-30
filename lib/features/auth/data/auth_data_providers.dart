import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nm_mobile/core/network/dio_client.dart';
import 'package:nm_mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:nm_mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:nm_mobile/features/auth/domain/repositories/auth_repository.dart';

export 'package:nm_mobile/core/network/dio_client.dart' show secureStorageProvider;

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
  (ref) => AuthRemoteDataSourceImpl(ref.watch(dioClientProvider)),
);

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
    secureStorage: ref.watch(secureStorageProvider),
  ),
);
