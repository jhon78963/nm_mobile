import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nm_mobile/core/network/dio_client.dart';
import 'package:nm_mobile/features/cash_movements/data/datasources/cash_movement_remote_data_source.dart';
import 'package:nm_mobile/features/cash_movements/data/repositories/cash_movement_repository_impl.dart';
import 'package:nm_mobile/features/cash_movements/domain/repositories/cash_movement_repository.dart';

final cashMovementRemoteDataSourceProvider =
    Provider<CashMovementRemoteDataSource>(
  (ref) => CashMovementRemoteDataSourceImpl(ref.watch(dioClientProvider)),
);

final cashMovementRepositoryProvider = Provider<CashMovementRepository>(
  (ref) => CashMovementRepositoryImpl(
    remoteDataSource: ref.watch(cashMovementRemoteDataSourceProvider),
  ),
);
