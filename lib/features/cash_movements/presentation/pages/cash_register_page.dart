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
import 'package:nm_mobile/features/cash_movements/presentation/widgets/movement_form_sheet.dart';

// ─── palette ───────────────────────────────────────────────────────────────
const _kPrimary = Color(0xFF1565C0);
const _kGray50 = Color(0xFFF8FAFC);
const _kGray100 = Color(0xFFF3F4F6);
const _kGray200 = Color(0xFFE5E7EB);
const _kGray400 = Color(0xFF9CA3AF);
const _kGray500 = Color(0xFF6B7280);
const _kGray700 = Color(0xFF374151);
const _kGray900 = Color(0xFF111827);
const _kEmerald50 = Color(0xFFECFDF5);
const _kEmerald100 = Color(0xFFD1FAE5);
const _kEmerald500 = Color(0xFF10B981);
const _kEmerald600 = Color(0xFF059669);
const _kEmerald700 = Color(0xFF047857);
const _kRed50 = Color(0xFFFEF2F2);
const _kRed100 = Color(0xFFFEE2E2);
const _kRed500 = Color(0xFFEF4444);
const _kRed600 = Color(0xFFDC2626);
const _kIndigo50 = Color(0xFFEEF2FF);
const _kIndigo700 = Color(0xFF4338CA);

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
            ..showSnackBar(
              SnackBar(
                content: Text(message),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            );
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
    final money = NumberFormat('#,##0.00', 'es_PE');

    return ColoredBox(
      color: _kGray50,
      child: Column(
        children: [
          // ── Sticky header ────────────────────────────────────────────
          _CashHeader(
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
          // ── Payment filter chips ──────────────────────────────────────
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
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
          const Divider(height: 1, color: _kGray200),
          // ── Movements list ────────────────────────────────────────────
          Expanded(
            child: state.isLoading && state.report == CashDailyReport.empty
                ? _LoadingMovements()
                : state.errorMessage != null
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              size: 40,
                              color: _kGray400,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              state.errorMessage!,
                              style: const TextStyle(color: _kGray500),
                            ),
                            const SizedBox(height: 16),
                            FilledButton(
                              onPressed: notifier.loadReport,
                              style: FilledButton.styleFrom(
                                  backgroundColor: _kPrimary),
                              child: const Text('Reintentar'),
                            ),
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
                        child: _MovementsTable(
                          sales: notifier.filteredSales(),
                          incomes: notifier.filteredIncomes(),
                          expenses: notifier.filteredExpenses(),
                          isAdmin: isAdmin,
                          onEditIncome: (item) => MovementFormSheet.show(
                            context,
                            movementType: MovementType.income,
                            viewDate: state.selectedDate,
                            isAdmin: isAdmin,
                            editingItem: item,
                          ),
                          onDeleteIncome: (item) => _confirmDelete(
                            context,
                            item,
                            notifier,
                            'ingreso',
                          ),
                          onEditExpense: (item) => MovementFormSheet.show(
                            context,
                            movementType: MovementType.expense,
                            viewDate: state.selectedDate,
                            isAdmin: isAdmin,
                            editingItem: item,
                          ),
                          onDeleteExpense: (item) => _confirmDelete(
                            context,
                            item,
                            notifier,
                            'gasto',
                          ),
                        ),
                      ),
          ),
          // ── Footer summary ────────────────────────────────────────────
          _SummaryFooter(
            openingBalance: state.report.summary.openingBalance,
            totalIncomes: notifier.filteredTotalIncomes,
            totalExpenses: notifier.filteredTotalExpenses,
            finalBalance: notifier.filteredFinalBalance,
            money: money,
          ),
        ],
      ),
    );
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Eliminar movimiento',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        content: Text(
          '¿Eliminar este $kind (S/ ${item.amount.toStringAsFixed(2)})? Esta acción no se puede deshacer.',
          style: const TextStyle(color: _kGray700),
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
            style: FilledButton.styleFrom(backgroundColor: _kRed500),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }
}

// ─── Cash header ──────────────────────────────────────────────────────────────

class _CashHeader extends StatelessWidget {
  const _CashHeader({
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
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title row
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Control de Caja',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: _kGray900,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Container(
                          width: 7,
                          height: 7,
                          decoration: const BoxDecoration(
                            color: _kEmerald500,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Caja abierta · Movimientos del día',
                          style: TextStyle(fontSize: 12, color: _kGray500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Date navigation
          Row(
            children: [
              if (isAdmin)
                _NavIconBtn(
                  icon: Icons.chevron_left,
                  onPressed: onPrevDay,
                  tooltip: 'Día anterior',
                ),
              if (isAdmin) const SizedBox(width: 4),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: _kGray50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: _kGray200),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'VISUALIZANDO',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          color: _kGray400,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        formattedDate,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: _kGray900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              if (isAdmin) ...[
                const SizedBox(width: 4),
                _NavIconBtn(
                  icon: Icons.chevron_right,
                  onPressed: isToday ? null : onNextDay,
                  tooltip: 'Día siguiente',
                ),
                if (!isToday) ...[
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: onGoToday,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: _kIndigo50,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: _kPrimary.withValues(alpha: 0.3)),
                      ),
                      child: const Text(
                        'Hoy',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: _kPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ],
          ),
          // Action buttons
          if (canStore) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _ActionButton(
                    icon: Icons.add,
                    label: 'Ingreso',
                    color: _kEmerald600,
                    bgColor: _kEmerald50,
                    borderColor: _kEmerald100,
                    onPressed: onIncome,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _ActionButton(
                    icon: Icons.remove,
                    label: 'Gasto',
                    color: _kRed600,
                    bgColor: _kRed50,
                    borderColor: _kRed100,
                    onPressed: onExpense,
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

class _NavIconBtn extends StatelessWidget {
  const _NavIconBtn({
    required this.icon,
    required this.onPressed,
    this.tooltip,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? '',
      child: GestureDetector(
        onTap: onPressed,
        child: Opacity(
          opacity: onPressed == null ? 0.4 : 1.0,
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: _kGray200),
            ),
            child: Icon(icon, size: 20, color: _kGray700),
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.bgColor,
    required this.borderColor,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final Color color;
  final Color bgColor;
  final Color borderColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 17, color: color),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Payment filter row ───────────────────────────────────────────────────────

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
        const Text(
          'MÉTODO:',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: _kGray400,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(width: 8),
        _FilterChip(
          label: 'Efectivo',
          active: filters.cash,
          onTap: () => onToggle('cash'),
          color: _kEmerald600,
        ),
        const SizedBox(width: 6),
        _FilterChip(
          label: 'Yape / Plin',
          active: filters.yape,
          onTap: () => onToggle('yape'),
          color: const Color(0xFF7C3AED),
        ),
        const SizedBox(width: 6),
        _FilterChip(
          label: 'Tarjeta',
          active: filters.card,
          onTap: () => onToggle('card'),
          color: _kPrimary,
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: active ? color.withValues(alpha: 0.1) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: active ? color.withValues(alpha: 0.5) : _kGray200,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: active ? color : _kGray500,
          ),
        ),
      ),
    );
  }
}

// ─── Movements table ──────────────────────────────────────────────────────────

class _MovementsTable extends StatelessWidget {
  const _MovementsTable({
    required this.sales,
    required this.incomes,
    required this.expenses,
    required this.isAdmin,
    required this.onEditIncome,
    required this.onDeleteIncome,
    required this.onEditExpense,
    required this.onDeleteExpense,
  });

  final List<CashMovementItem> sales;
  final List<CashMovementItem> incomes;
  final List<CashMovementItem> expenses;
  final bool isAdmin;
  final void Function(CashMovementItem) onEditIncome;
  final void Function(CashMovementItem) onDeleteIncome;
  final void Function(CashMovementItem) onEditExpense;
  final void Function(CashMovementItem) onDeleteExpense;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _kGray200),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          _SectionBlock(
            title: 'Ventas del día',
            titleColor: _kIndigo700,
            bgColor: _kIndigo50.withValues(alpha: 0.5),
            items: sales,
            isExpense: false,
            isAdmin: false,
            onEdit: null,
            onDelete: null,
          ),
          const Divider(height: 1, color: _kGray100),
          _SectionBlock(
            title: 'Otros ingresos',
            titleColor: _kEmerald700,
            bgColor: _kEmerald50.withValues(alpha: 0.5),
            items: incomes,
            isExpense: false,
            isAdmin: isAdmin,
            onEdit: onEditIncome,
            onDelete: onDeleteIncome,
          ),
          const Divider(height: 1, color: _kGray100),
          _SectionBlock(
            title: 'Gastos',
            titleColor: _kRed600,
            bgColor: _kRed50.withValues(alpha: 0.5),
            items: expenses,
            isExpense: true,
            isAdmin: isAdmin,
            onEdit: onEditExpense,
            onDelete: onDeleteExpense,
          ),
        ],
      ),
    );
  }
}

class _SectionBlock extends StatelessWidget {
  const _SectionBlock({
    required this.title,
    required this.titleColor,
    required this.bgColor,
    required this.items,
    required this.isExpense,
    required this.isAdmin,
    required this.onEdit,
    required this.onDelete,
  });

  final String title;
  final Color titleColor;
  final Color bgColor;
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
        // Section header
        Container(
          width: double.infinity,
          color: bgColor,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              color: titleColor,
              letterSpacing: 0.8,
            ),
          ),
        ),
        // Rows
        if (items.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Text(
              isExpense
                  ? 'Sin gastos registrados'
                  : title == 'Ventas del día'
                      ? 'Sin ventas registradas'
                      : 'Sin ingresos extra',
              style: const TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: _kGray400,
              ),
            ),
          )
        else
          for (int i = 0; i < items.length; i++) ...[
            if (i > 0) const Divider(height: 1, indent: 14, color: _kGray100),
            _MovementRow(
              item: items[i],
              isExpense: isExpense,
              isAdmin: isAdmin,
              onEdit: onEdit,
              onDelete: onDelete,
            ),
          ],
      ],
    );
  }
}

class _MovementRow extends StatelessWidget {
  const _MovementRow({
    required this.item,
    required this.isExpense,
    required this.isAdmin,
    required this.onEdit,
    required this.onDelete,
  });

  final CashMovementItem item;
  final bool isExpense;
  final bool isAdmin;
  final void Function(CashMovementItem)? onEdit;
  final void Function(CashMovementItem)? onDelete;

  Color get _amountColor => isExpense ? _kRed500 : _kEmerald600;
  String get _sign => isExpense ? '−' : '+';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          // Icon indicator
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: _amountColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isExpense
                  ? Icons.remove_rounded
                  : Icons.add_rounded,
              size: 14,
              color: _amountColor,
            ),
          ),
          const SizedBox(width: 10),
          // Time
          SizedBox(
            width: 40,
            child: Text(
              item.time,
              style: const TextStyle(
                fontSize: 11,
                color: _kGray400,
                fontFamily: 'monospace',
              ),
            ),
          ),
          const SizedBox(width: 6),
          // Description + method
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.description,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: _kGray900,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                _MethodBadge(method: item.method),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Amount
          Text(
            '$_sign S/ ${item.amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: _amountColor,
              fontFamily: 'monospace',
            ),
          ),
          // Admin actions
          if (isAdmin && onEdit != null && onDelete != null) ...[
            const SizedBox(width: 4),
            _RowIconBtn(
              icon: Icons.edit_outlined,
              color: _kPrimary,
              onPressed: () => onEdit!(item),
              tooltip: 'Editar',
            ),
            _RowIconBtn(
              icon: Icons.delete_outline,
              color: _kRed500,
              onPressed: () => onDelete!(item),
              tooltip: 'Eliminar',
            ),
          ],
        ],
      ),
    );
  }
}

class _MethodBadge extends StatelessWidget {
  const _MethodBadge({required this.method});

  final String method;

  Color _badgeColor() {
    final m = method.toLowerCase();
    if (m.contains('efectivo') || m.contains('cash')) return _kEmerald600;
    if (m.contains('yape') || m.contains('plin')) {
      return const Color(0xFF7C3AED);
    }
    if (m.contains('tarjeta') || m.contains('card')) return _kPrimary;
    return _kGray500;
  }

  @override
  Widget build(BuildContext context) {
    final color = _badgeColor();
    return Container(
      margin: const EdgeInsets.only(top: 2),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        method.toUpperCase(),
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w700,
          color: color,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _RowIconBtn extends StatelessWidget {
  const _RowIconBtn({
    required this.icon,
    required this.color,
    required this.onPressed,
    this.tooltip,
  });

  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? '',
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(icon, size: 16, color: color.withValues(alpha: 0.7)),
        ),
      ),
    );
  }
}

// ─── Loading skeleton ─────────────────────────────────────────────────────────

class _LoadingMovements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: _kGray200),
        ),
        child: Column(
          children: List.generate(
            7,
            (i) => Container(
              height: 48,
              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: _kGray100,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Summary footer ───────────────────────────────────────────────────────────

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
      decoration: const BoxDecoration(
        color: Color(0xFF111827),
        border: Border(top: BorderSide(color: Color(0xFF374151))),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              // Stats
              Expanded(
                child: Wrap(
                  spacing: 16,
                  runSpacing: 6,
                  children: [
                    _FooterStat(
                      label: 'Caja base',
                      value: 'S/ ${money.format(openingBalance)}',
                    ),
                    _FooterStat(
                      label: 'Ingresos',
                      value: '+ S/ ${money.format(totalIncomes)}',
                      valueColor: const Color(0xFF34D399),
                    ),
                    _FooterStat(
                      label: 'Egresos',
                      value: '− S/ ${money.format(totalExpenses)}',
                      valueColor: const Color(0xFFF87171),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Total
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF1F2937),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF374151)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'TOTAL EN CAJA',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF9CA3AF),
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'S/ ${money.format(finalBalance)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterStat extends StatelessWidget {
  const _FooterStat({
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 9,
            color: Color(0xFF6B7280),
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 1),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 13,
            color: valueColor ?? Colors.white,
            fontFamily: 'monospace',
          ),
        ),
      ],
    );
  }
}
