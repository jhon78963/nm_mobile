import 'package:dio/dio.dart';
import 'package:nm_mobile/features/auth/data/utils/dio_exception_mapper.dart';
import 'package:nm_mobile/features/sales/data/datasources/sale_remote_data_source.dart';
import 'package:nm_mobile/features/sales/domain/entities/sale.dart';
import 'package:nm_mobile/features/sales/domain/repositories/sale_repository.dart';

final class SaleRepositoryImpl implements SaleRepository {
  const SaleRepositoryImpl({required this.remoteDataSource});

  final SaleRemoteDataSource remoteDataSource;

  @override
  Future<SaleListPage> getAll({
    required int limit,
    required int page,
    String? search,
  }) async {
    try {
      return await remoteDataSource.getAll(
        limit: limit,
        page: page,
        search: search,
      );
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<SaleDetail> getOne(int id) async {
    try {
      return await remoteDataSource.getOne(id);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<void> update(int id, SaleUpdatePayload payload) async {
    try {
      await remoteDataSource.update(id, payload);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<void> cancel(int id) async {
    try {
      await remoteDataSource.cancel(id);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  @override
  Future<String> fetchTicketHtml(int saleId) async {
    try {
      return await remoteDataSource.fetchTicketHtml(saleId);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }
}
