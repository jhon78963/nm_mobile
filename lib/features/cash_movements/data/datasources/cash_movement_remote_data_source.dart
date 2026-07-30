import 'package:dio/dio.dart';
import 'package:nm_mobile/features/cash_movements/data/adapters/cash_movement_adapter.dart';
import 'package:nm_mobile/features/cash_movements/domain/entities/cash_movement.dart';

abstract interface class CashMovementRemoteDataSource {
  Future<CashDailyReport> loadDailyReport(String dateIso);

  Future<void> registerMovement(MovementPayload payload);

  Future<void> updateMovement(int id, MovementPayload payload);

  Future<void> deleteMovement(int id);
}

final class CashMovementRemoteDataSourceImpl
    implements CashMovementRemoteDataSource {
  const CashMovementRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  static const _base = 'cash-flow';

  static const _filters = ['CASH', 'YAPE', 'CARD'];

  @override
  Future<CashDailyReport> loadDailyReport(String dateIso) async {
    // Match Angular: ?date=YYYY-MM-DD&filters[]=CASH&filters[]=YAPE&filters[]=CARD
    final filterQuery = _filters.map((f) => 'filters[]=$f').join('&');
    final response = await _dio.get<dynamic>(
      '$_base/daily?date=$dateIso&$filterQuery',
    );
    return adaptCashDailyReport(response.data);
  }

  FormData _buildFormData(MovementPayload payload) {
    return FormData.fromMap({
      'type': payload.type.apiValue,
      'category': payload.category.apiValue,
      'amount': payload.amount.toString(),
      'description': payload.description,
      'date': payload.date,
      'payment_method': payload.paymentMethod.apiValue,
    });
  }

  @override
  Future<void> registerMovement(MovementPayload payload) async {
    await _dio.post<dynamic>(_base, data: _buildFormData(payload));
  }

  @override
  Future<void> updateMovement(int id, MovementPayload payload) async {
    final formData = _buildFormData(payload);
    formData.fields.add(const MapEntry('_method', 'PUT'));
    await _dio.post<dynamic>('$_base/$id', data: formData);
  }

  @override
  Future<void> deleteMovement(int id) async {
    await _dio.delete<dynamic>('$_base/$id');
  }
}
