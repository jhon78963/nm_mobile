import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nm_mobile/core/auth/permission_util.dart';
import 'package:nm_mobile/features/auth/domain/entities/user.dart';
import 'package:nm_mobile/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:nm_mobile/features/auth/presentation/notifiers/auth_state.dart';
import 'package:nm_mobile/features/cash_movements/data/adapters/cash_movement_adapter.dart';
import 'package:nm_mobile/features/cash_movements/domain/entities/cash_movement.dart';
import 'package:nm_mobile/features/cash_movements/domain/entities/cash_movement_enums.dart';
import 'package:nm_mobile/features/cash_movements/presentation/notifiers/cash_register_notifier.dart';
import 'package:nm_mobile/features/cash_movements/presentation/notifiers/cash_register_state.dart';
import 'package:nm_mobile/features/cash_movements/presentation/widgets/movement_form_sheet.dart';

const _kTabletBreakpoint = 600;

class CashRegisterPage extends ConsumerWidget {
  const CashRegisterPage({super.key});

  bool _isAdmin(User? user) {
    if (user == null) return false;
    final roles = user.roles.isNotEmpty ? user.roles : [user.role];
    return roles.any((r) => r == 'Super Admin' || r == 'Admin');
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      cashRegisterNotifierProvider.select((s) => s.toastMessage),
      (_, message) {
        if (message != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(message)));
          ref.read(cashRegisterNotifierProvider.notifier).clearToast();
        }
      },
    );

    final state = ref.watch(cashRegisterNotifierProvider);
    final notifier = ref.read(cashRegisterNotifierProvider.notifier);
    final user = ref.watch(authNotifierProvider).maybeMap(
          authenticated: (s) => s.user,
          orElse: () => null,
        );
    final isAdmin = _isAdmin(user);
    final canStore = userHasPermission(user, 'cashflow.store');
    const primary = Color(0xFF1565C0);
    final money = NumberFormat('#,##0.00', 'es_PE');

    return Column(
      children: [
        _Header(
          isAdmin: isAdmin,
          canStore: canStore,
          formattedDate: formatViewDate(state.selectedDate),
          isToday: _isToday(state.selectedDate),
          onPrevDay: () => notifier.changeDate(-1),
          onNextDay: () => notifier.changeDate(1),
          onGoToday: notifier.goToToday,
          onIncome: () => MovementFormSheet.show(
            context,
            movementType: MovementType.income,
            viewDate: state.selectedDate,
            isAdmin: isAdmin,
          ),
          onExpense: () => MovementFormSheet.show(
            context,
            movementType: MovementType.expense,
            viewDate: state.selectedDate,
            isAdmin: isAdmin,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: _PaymentFilterRow(
            filters: state.paymentFilters,
            onToggle: (key) {
              notifier.toggleFilter((f) => switch (key) {
                    'cash' => f.copyWith(cash: !f.cash),
                    'yape' => f.copyWith(yape: !f.yape),
                    _ => f.copyWith(card: !f.card),
                  });
            },
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = constraints.maxWidth >= _kTabletBreakpoint;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: isTablet
                  ? GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 2.8,
                      children: _summaryCards(
                        state,
                        notifier,
                        money,
                        primary,
                      ),
                    )
                  : Column(
                      children: _summaryCards(
                        state,
                        notifier,
                        money,
                        primary,
                      ),
                    ),
            );
          },
        ),
        Expanded(
          child: state.isLoading && state.report == CashDailyReport.empty
              ? const Center(child: CircularProgressIndicator())
              : state.errorMessage != null
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(state.errorMessage!),
                          FilledButton(
                            onPressed: notifier.loadReport,
                            child: const Text('Reintentar'),
                          ),
                        ],
                      ),
                    )
                  : ListView(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                      children: [
                        _MovementSection(
                          title: 'Ventas del día',
                          titleColor: primary,
                          items: notifier.filteredSales(),
                          isExpense: false,
                          isAdmin: false,
                          onEdit: null,
                          onDelete: null,
                        ),
                        _MovementSection(
                          title: 'Otros ingresos',
                          titleColor: Colors.green,
                          items: notifier.filteredIncomes(),
                          isExpense: false,
                          isAdmin: isAdmin,
                          onEdit: (item) => MovementFormSheet.show(
                            context,
                            movementType: MovementType.income,
                            viewDate: state.selectedDate,
                            isAdmin: isAdmin,
                            editingItem: item,
                          ),
                          onDelete: (item) => _confirmDelete(
                            context,
                            item,
                            notifier,
                            'ingreso',
                          ),
                        ),
                        _MovementSection(
                          title: 'Gastos',
                          titleColor: Colors.red,
                          items: notifier.filteredExpenses(),
                          isExpense: true,
                          isAdmin: isAdmin,
                          onEdit: (item) => MovementFormSheet.show(
                            context,
                            movementType: MovementType.expense,
                            viewDate: state.selectedDate,
                            isAdmin: isAdmin,
                            editingItem: item,
                          ),
                          onDelete: (item) => _confirmDelete(
                            context,
                            item,
                            notifier,
                            'gasto',
                          ),
                        ),
                      ],
                    ),
        ),
        _SummaryFooter(
          openingBalance: state.report.summary.openingBalance,
          totalIncomes: notifier.filteredTotalIncomes,
          totalExpenses: notifier.filteredTotalExpenses,
          finalBalance: notifier.filteredFinalBalance,
          money: money,
        ),
      ],
    );
  }

  List<Widget> _summaryCards(
    CashRegisterState state,
    CashRegisterNotifier notifier,
    NumberFormat money,
    Color primary,
  ) {
    return [
      _SummaryCard(
        label: 'Saldo inicial',
        value: 'S/ ${money.format(state.report.summary.openingBalance)}',
        color: primary,
      ),
      _SummaryCard(
        label: 'Ventas',
        value: 'S/ ${money.format(state.report.summary.totalSales)}',
        color: primary,
      ),
      _SummaryCard(
        label: 'Ingresos',
        value: 'S/ ${money.format(state.report.summary.totalIncomes)}',
        color: Colors.green,
      ),
      _SummaryCard(
        label: 'Egresos',
        value: 'S/ ${money.format(state.report.summary.totalExpenses)}',
        color: Colors.red,
      ),
    ];
  }

  void _confirmDelete(
    BuildContext context,
    CashMovementItem item,
    CashRegisterNotifier notifier,
    String kind,
  ) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Eliminar movimiento'),
        content: Text(
          '¿Eliminar este $kind (S/ ${item.amount.toStringAsFixed(2)})? Esta acción no se puede deshacer.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              notifier.deleteMovement(item.id);
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.isAdmin,
    required this.canStore,
    required this.formattedDate,
    required this.isToday,
    required this.onPrevDay,
    required this.onNextDay,
    required this.onGoToday,
    required this.onIncome,
    required this.onExpense,
  });

  final bool isAdmin;
  final bool canStore;
  final String formattedDate;
  final bool isToday;
  final VoidCallback onPrevDay;
  final VoidCallback onNextDay;
  final VoidCallback onGoToday;
  final VoidCallback onIncome;
  final VoidCallback onExpense;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFF3F4F6))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Control de Caja',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'Caja abierta · Movimientos del día',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              if (isAdmin)
                IconButton(
                  onPressed: onPrevDay,
                  icon: const Icon(Icons.chevron_left),
                ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'VISUALIZANDO',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[500],
                        letterSpacing: 1,
                      ),
                    ),
                    Text(
                      formattedDate,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              if (isAdmin) ...[
                IconButton(
                  onPressed: isToday ? null : onNextDay,
                  icon: const Icon(Icons.chevron_right),
                ),
                if (!isToday)
                  TextButton(onPressed: onGoToday, child: const Text('Hoy')),
              ],
            ],
          ),
          if (canStore) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onIncome,
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Ingreso'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.green,
                      side: const BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onExpense,
                    icon: const Icon(Icons.remove, size: 18),
                    label: const Text('Gasto'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _PaymentFilterRow extends StatelessWidget {
  const _PaymentFilterRow({
    required this.filters,
    required this.onToggle,
  });

  final PaymentMethodFilter filters;
  final ValueChanged<String> onToggle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'MÉTODO:',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: Colors.grey[500],
          ),
        ),
        const SizedBox(width: 8),
        _FilterChip(
          label: 'Efectivo',
          active: filters.cash,
          onTap: () => onToggle('cash'),
          color: Colors.green,
        ),
        const SizedBox(width: 6),
        _FilterChip(
          label: 'Yape',
          active: filters.yape,
          onTap: () => onToggle('yape'),
          color: Colors.purple,
        ),
        const SizedBox(width: 6),
        _FilterChip(
          label: 'Tarjeta',
          active: filters.card,
          onTap: () => onToggle('card'),
          color: Colors.blue,
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.active,
    required this.onTap,
    required this.color,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: active ? color.withValues(alpha: 0.12) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: active ? color : const Color(0xFFE5E7EB),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: active ? color : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: color.withValues(alpha: 0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label.toUpperCase(),
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Colors.grey[500],
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MovementSection extends StatelessWidget {
  const _MovementSection({
    required this.title,
    required this.titleColor,
    required this.items,
    required this.isExpense,
    required this.isAdmin,
    required this.onEdit,
    required this.onDelete,
  });

  final String title;
  final Color titleColor;
  final List<CashMovementItem> items;
  final bool isExpense;
  final bool isAdmin;
  final void Function(CashMovementItem)? onEdit;
  final void Function(CashMovementItem)? onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          margin: const EdgeInsets.only(bottom: 8, top: 8),
          decoration: BoxDecoration(
            color: titleColor.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: titleColor,
              letterSpacing: 1,
            ),
          ),
        ),
        if (items.isEmpty)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Sin registros',
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: Colors.grey[500],
              ),
            ),
          )
        else
          for (final item in items)
            Card(
              margin: const EdgeInsets.only(bottom: 6),
              elevation: 0,
              child: ListTile(
                leading: Icon(
                  isExpense ? Icons.remove_circle_outline : Icons.add_circle_outline,
                  color: isExpense ? Colors.red : Colors.green,
                ),
                title: Text(item.description),
                subtitle: Text('${item.time} · ${item.method}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${isExpense ? '−' : '+'} S/ ${item.amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: isExpense ? Colors.red : Colors.green,
                      ),
                    ),
                    if (isAdmin && onEdit != null && onDelete != null) ...[
                      IconButton(
                        icon: const Icon(Icons.edit, size: 18),
                        onPressed: () => onEdit!(item),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, size: 18, color: Colors.red),
                        onPressed: () => onDelete!(item),
                      ),
                    ],
                  ],
                ),
              ),
            ),
      ],
    );
  }
}

class _SummaryFooter extends StatelessWidget {
  const _SummaryFooter({
    required this.openingBalance,
    required this.totalIncomes,
    required this.totalExpenses,
    required this.finalBalance,
    required this.money,
  });

  final double openingBalance;
  final double totalIncomes;
  final double totalExpenses;
  final double finalBalance;
  final NumberFormat money;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xFF111827),
        border: Border(top: BorderSide(color: Color(0xFF374151))),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: Wrap(
                spacing: 16,
                runSpacing: 4,
                children: [
                  _FooterStat(
                    label: 'Caja base',
                    value: 'S/ ${money.format(openingBalance)}',
                  ),
                  _FooterStat(
                    label: 'Ingresos',
                    value: '+ S/ ${money.format(totalIncomes)}',
                    color: Colors.greenAccent,
                  ),
                  _FooterStat(
                    label: 'Egresos',
                    value: '− S/ ${money.format(totalExpenses)}',
                    color: Colors.redAccent,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'TOTAL EN CAJA',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[400],
                  ),
                ),
                Text(
                  'S/ ${money.format(finalBalance)}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FooterStat extends StatelessWidget {
  const _FooterStat({
    required this.label,
    required this.value,
    this.color,
  });

  final String label;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(fontSize: 9, color: Colors.grey[500]),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: color ?? Colors.white,
          ),
        ),
      ],
    );
  }
}
