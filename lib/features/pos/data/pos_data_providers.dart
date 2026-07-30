import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nm_mobile/core/network/dio_client.dart';
import 'package:nm_mobile/features/pos/data/datasources/pos_remote_data_source.dart';
import 'package:nm_mobile/features/pos/data/repositories/pos_repository_impl.dart';
import 'package:nm_mobile/features/pos/domain/repositories/pos_repository.dart';

final posRemoteDataSourceProvider = Provider<PosRemoteDataSource>(
  (ref) => PosRemoteDataSourceImpl(ref.watch(dioClientProvider)),
);

final posRepositoryProvider = Provider<PosRepository>(
  (ref) => PosRepositoryImpl(
    remoteDataSource: ref.watch(posRemoteDataSourceProvider),
  ),
);
