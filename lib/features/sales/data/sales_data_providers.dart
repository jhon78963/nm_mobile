import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nm_mobile/core/network/dio_client.dart';
import 'package:nm_mobile/features/sales/data/datasources/sale_remote_data_source.dart';
import 'package:nm_mobile/features/sales/data/repositories/sale_repository_impl.dart';
import 'package:nm_mobile/features/sales/domain/repositories/sale_repository.dart';

final saleRemoteDataSourceProvider = Provider<SaleRemoteDataSource>(
  (ref) => SaleRemoteDataSourceImpl(ref.watch(dioClientProvider)),
);

final saleRepositoryProvider = Provider<SaleRepository>(
  (ref) => SaleRepositoryImpl(
    remoteDataSource: ref.watch(saleRemoteDataSourceProvider),
  ),
);
