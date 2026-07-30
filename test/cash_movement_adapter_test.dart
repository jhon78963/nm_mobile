import 'package:flutter_test/flutter_test.dart';
import 'package:nm_mobile/features/cash_movements/data/adapters/cash_movement_adapter.dart';

void main() {
  group('adaptCashDailyReport sales parsing', () {
    test('parses sales from standard API envelope', () {
      final report = adaptCashDailyReport({
        'success': true,
        'data': {
          'summary': {
            'opening_balance': 100,
            'total_sales': 50,
            'total_incomes': 33,
            'total_expenses': 25,
          },
          'lists': {
            'sales': [
              {
                'id': 1,
                'type': 'SALE',
                'time': '10:30 AM',
                'description': 'V001 | Producto',
                'method': 'CASH',
                'amount': 50,
              },
            ],
            'incomes': [],
            'expenses': [],
          },
        },
      });

      expect(report.lists.sales, hasLength(1));
      expect(report.lists.sales.first.description, 'V001 | Producto');
      expect(report.summary.totalSales, 50);
    });

    test('parses sales when list is a map with numeric keys', () {
      final report = adaptCashDailyReport({
        'data': {
          'summary': {},
          'lists': {
            'sales': {
              '0': {
                'id': 2,
                'time': '11:00 AM',
                'description': 'V002',
                'method': 'YAPE',
                'amount': 20,
              },
            },
            'incomes': [],
            'expenses': [],
          },
        },
      });

      expect(report.lists.sales, hasLength(1));
      expect(report.lists.sales.first.amount, 20);
    });

    test('parses sales when wrapped in data key like JsonResource', () {
      final report = adaptCashDailyReport({
        'data': {
          'summary': {},
          'lists': {
            'sales': {
              'data': [
                {
                  'id': 3,
                  'time': '12:00 PM',
                  'description': 'V003',
                  'method': 'MIXTO',
                  'amount': 80,
                },
              ],
            },
            'incomes': [],
            'expenses': [],
          },
        },
      });

      expect(report.lists.sales, hasLength(1));
      expect(report.lists.sales.first.method, 'MIXTO');
    });
  });
}
