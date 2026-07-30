import 'package:dio/dio.dart';
import 'package:nm_mobile/features/auth/data/utils/dio_exception_mapper.dart';
import 'package:nm_mobile/features/cash_movements/data/datasources/cash_movement_remote_data_source.dart';
import 'package:nm_mobile/features/cash_movements/domain/entities/cash_movement.dart';
import 'package:nm_mobile/features/cash_movements/domain/repositories/cash_movement_repository.dart';

final class CashMovementRepositoryImpl implements CashMovementRepository {
  const CashMovementRepositoryImpl({required this.remoteDataSource});

  final CashMovementRemoteDataSource remoteDataSource;

  @override
  Future<CashDailyReport> loadDailyReport(String dateIso) async {
    try {
      return await remoteDataSource.loadDailyReport(dateIso);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<CashDailyReport> registerMovement(
    MovementPayload payload,
    String viewDateIso,
  ) async {
    try {
      await remoteDataSource.registerMovement(payload);
      return remoteDataSource.loadDailyReport(viewDateIso);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<CashDailyReport> updateMovement(
    int id,
    MovementPayload payload,
    String viewDateIso,
  ) async {
    try {
      await remoteDataSource.updateMovement(id, payload);
      return remoteDataSource.loadDailyReport(viewDateIso);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<CashDailyReport> deleteMovement(int id, String viewDateIso) async {
    try {
      await remoteDataSource.deleteMovement(id);
      return remoteDataSource.loadDailyReport(viewDateIso);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }
}
