import 'package:nm_mobile/features/cash_movements/domain/entities/cash_movement.dart';

abstract interface class CashMovementRepository {
  Future<CashDailyReport> loadDailyReport(String dateIso);

  Future<CashDailyReport> registerMovement(
    MovementPayload payload,
    String viewDateIso,
  );

  Future<CashDailyReport> updateMovement(
    int id,
    MovementPayload payload,
    String viewDateIso,
  );

  Future<CashDailyReport> deleteMovement(int id, String viewDateIso);
}
