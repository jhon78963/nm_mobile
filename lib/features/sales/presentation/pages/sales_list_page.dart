import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nm_mobile/core/auth/permission_util.dart';
import 'package:nm_mobile/core/routing/app_routes.dart';
import 'package:nm_mobile/features/auth/domain/entities/user.dart';
import 'package:nm_mobile/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:nm_mobile/features/auth/presentation/notifiers/auth_state.dart';
import 'package:nm_mobile/features/pos/presentation/widgets/ticket_preview_dialog.dart';
import 'package:nm_mobile/features/sales/domain/entities/sale.dart';
import 'package:nm_mobile/features/sales/presentation/notifiers/sales_list_notifier.dart';
import 'package:nm_mobile/features/sales/presentation/notifiers/sales_list_state.dart';
import 'package:nm_mobile/features/sales/presentation/utils/sale_formatters.dart';
import 'package:nm_mobile/features/sales/presentation/widgets/sale_detail_sheet.dart';

// ─── palette ───────────────────────────────────────────────────────────────
const _kPrimary = Color(0xFF1565C0);
const _kGray50 = Color(0xFFF9FAFB);
const _kGray100 = Color(0xFFF3F4F6);
const _kGray200 = Color(0xFFE5E7EB);
const _kGray300 = Color(0xFFD1D5DB);
const _kGray400 = Color(0xFF9CA3AF);
const _kGray500 = Color(0xFF6B7280);
const _kGray700 = Color(0xFF374151);
const _kGray900 = Color(0xFF111827);
const _kRed500 = Color(0xFFEF4444);
const _kTeal600 = Color(0xFF0D9488);

class SalesListPage extends ConsumerStatefulWidget {
  const SalesListPage({super.key});

  @override
  ConsumerState<SalesListPage> createState() => _SalesListPageState();
}

class _SalesListPageState extends ConsumerState<SalesListPage> {
  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {}); // rebuild for clear-button visibility
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      ref
          .read(salesListNotifierProvider.notifier)
          .setSearch(_searchController.text.trim());
    });
  }

  User? _currentUser() => ref.read(authNotifierProvider).maybeMap(
        authenticated: (s) => s.user,
        orElse: () => null,
      );

  bool _canEdit(Sale sale) =>
      sale.status != 'CANCELED' &&
      userHasPermission(_currentUser(), 'sale.update');

  bool _canViewOnly(Sale sale) {
    if (sale.status == 'CANCELED') {
      return userHasAnyPermission(_currentUser(), ['sale.update', 'sale.get']);
    }
    return !userHasPermission(_currentUser(), 'sale.update') &&
        userHasAnyPermission(_currentUser(), ['sale.getAll', 'sale.get']);
  }

  bool _canCancel(Sale sale) =>
      sale.status != 'CANCELED' &&
      userHasPermission(_currentUser(), 'sale.delete');

  Future<void> _previewTicket(int id) async {
    final html =
        await ref.read(salesListNotifierProvider.notifier).fetchTicketHtml(id);
    if (html != null && html.isNotEmpty && mounted) {
      await TicketPreviewDialog.show(context, html);
    }
  }

  void _openDetail(int id, {required bool readOnly}) {
    SaleDetailSheet.show(
      context,
      saleId: id,
      readOnly: readOnly,
      onSaved: () {
        ref
            .read(salesListNotifierProvider.notifier)
            .showToast('Venta actualizada correctamente.');
        ref.read(salesListNotifierProvider.notifier).load();
      },
    );
  }

  void _openCancelConfirm(Sale sale) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Anular venta',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        content: Text(
          '¿Anular la venta ${sale.code}${sale.customer.isNotEmpty ? ' · ${sale.customer}' : ''}? Esta acción devolverá el stock al inventario.',
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
              ref.read(salesListNotifierProvider.notifier).cancelSale(sale.id);
            },
            style: FilledButton.styleFrom(backgroundColor: _kRed500),
            child: const Text('Sí, anular'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      salesListNotifierProvider.select((s) => s.toastMessage),
      (_, message) {
        if (message != null && mounted) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(message),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          ref.read(salesListNotifierProvider.notifier).clearToast();
        }
      },
    );

    final state = ref.watch(salesListNotifierProvider);

    return ColoredBox(
      color: _kGray50,
      child: Column(
        children: [
          // ── Page header ──────────────────────────────────────────────
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Ventas',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: _kGray900,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Historial de ventas, comprobantes y ajustes',
                            style: const TextStyle(
                              fontSize: 12,
                              color: _kGray500,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FilledButton.icon(
                      onPressed: () => context.go(AppRoutes.pos),
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text(
                        'Nueva venta',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: _kPrimary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Search bar
                Container(
                  decoration: BoxDecoration(
                    color: _kGray50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: _kGray200),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 12, right: 6),
                        child: Icon(Icons.search, size: 18, color: _kGray400),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          style: const TextStyle(fontSize: 14, color: _kGray900),
                          decoration: const InputDecoration(
                            hintText: 'Buscar por código, cliente o comprobante…',
                            hintStyle: TextStyle(fontSize: 13, color: _kGray400),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 11),
                          ),
                        ),
                      ),
                      if (_searchController.text.isNotEmpty)
                        IconButton(
                          icon: const Icon(Icons.close, size: 16, color: _kGray400),
                          onPressed: () {
                            _searchController.clear();
                            ref
                                .read(salesListNotifierProvider.notifier)
                                .setSearch('');
                          },
                          tooltip: 'Limpiar búsqueda',
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // ── Count badge ──────────────────────────────────────────────
          if (!state.isLoading)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _kPrimary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _kPrimary.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Text(
                    '${state.total} ${state.total == 1 ? 'venta' : 'ventas'}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: _kPrimary,
                    ),
                  ),
                ),
              ),
            ),
          const Divider(height: 1, color: _kGray100),
          // ── Body ─────────────────────────────────────────────────────
          Expanded(child: _buildBody(state)),
          if (state.totalPages > 1) _PaginationBar(state: state),
        ],
      ),
    );
  }

  Widget _buildBody(SalesListState state) {
    if (state.isLoading && state.sales.isEmpty) {
      return _LoadingList();
    }

    if (state.errorMessage != null && state.sales.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 40, color: _kGray300),
            const SizedBox(height: 12),
            Text(
              state.errorMessage!,
              style: const TextStyle(color: _kGray500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () =>
                  ref.read(salesListNotifierProvider.notifier).load(),
              style: FilledButton.styleFrom(backgroundColor: _kPrimary),
              child: const Text('Reintentar'),
            ),
          ],
        ),
      );
    }

    if (state.sales.isEmpty) {
      return _SalesEmptyState(
        hasSearch: state.search.isNotEmpty,
        onGoToPos: () => context.go(AppRoutes.pos),
      );
    }

    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          itemCount: state.sales.length,
          itemBuilder: (context, index) {
            final sale = state.sales[index];
            return _SaleCard(
              sale: sale,
              canEdit: _canEdit(sale),
              canView: _canViewOnly(sale),
              canCancel: _canCancel(sale),
              onTap: () => _canEdit(sale)
                  ? _openDetail(sale.id, readOnly: false)
                  : _openDetail(sale.id, readOnly: true),
              onTicket: () => _previewTicket(sale.id),
              onEdit: () => _openDetail(sale.id, readOnly: false),
              onView: () => _openDetail(sale.id, readOnly: true),
              onCancel: () => _openCancelConfirm(sale),
            );
          },
        ),
        if (state.isLoading)
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: LinearProgressIndicator(
              minHeight: 2,
              backgroundColor: Colors.transparent,
            ),
          ),
      ],
    );
  }
}

// ─── Loading skeleton ─────────────────────────────────────────────────────────

class _LoadingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 6,
        itemBuilder: (_, _) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: 100,
        decoration: BoxDecoration(
          color: _kGray100,
          borderRadius: BorderRadius.circular(14),
        ),
        child: const _Shimmer(),
      ),
    );
  }
}

class _Shimmer extends StatefulWidget {
  const _Shimmer();
  @override
  State<_Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<_Shimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl =
      AnimationController(vsync: this, duration: const Duration(seconds: 1))
        ..repeat(reverse: true);
  late final Animation<double> _anim =
      Tween<double>(begin: 0.3, end: 0.7).animate(_ctrl);

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, _) => Opacity(opacity: _anim.value, child: const SizedBox.expand()),
    );
  }
}

// ─── Empty state ──────────────────────────────────────────────────────────────

class _SalesEmptyState extends StatelessWidget {
  const _SalesEmptyState({required this.hasSearch, required this.onGoToPos});

  final bool hasSearch;
  final VoidCallback onGoToPos;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: _kGray100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.receipt_long_outlined, size: 36, color: _kGray400),
            ),
            const SizedBox(height: 16),
            Text(
              hasSearch ? 'Sin resultados' : 'Aún no hay ventas registradas',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: _kGray700,
              ),
              textAlign: TextAlign.center,
            ),
            if (!hasSearch) ...[
              const SizedBox(height: 4),
              const Text(
                'Las ventas registradas desde el POS aparecerán aquí.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: _kGray400, height: 1.4),
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: onGoToPos,
                icon: const Icon(Icons.point_of_sale, size: 16),
                label: const Text('Ir al POS'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: _kPrimary,
                  side: const BorderSide(color: _kPrimary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─── Sale card ────────────────────────────────────────────────────────────────

class _SaleCard extends StatelessWidget {
  const _SaleCard({
    required this.sale,
    required this.canEdit,
    required this.canView,
    required this.canCancel,
    required this.onTap,
    required this.onTicket,
    required this.onEdit,
    required this.onView,
    required this.onCancel,
  });

  final Sale sale;
  final bool canEdit;
  final bool canView;
  final bool canCancel;
  final VoidCallback onTap;
  final VoidCallback onTicket;
  final VoidCallback onEdit;
  final VoidCallback onView;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final isCanceled = sale.status == 'CANCELED';

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isCanceled ? _kRed500.withValues(alpha: 0.2) : _kGray200,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row 1: code + total
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sale.code,
                          style: const TextStyle(
                            fontFamily: 'monospace',
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: _kGray900,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          SaleFormatters.date(sale.creationTime),
                          style:
                              const TextStyle(fontSize: 11, color: _kGray400),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    SaleFormatters.money(sale.total),
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 17,
                      color: _kGray900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Row 2: customer + payment method
              Text(
                sale.customer.isEmpty ? '—' : sale.customer,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: _kGray900,
                  fontSize: 13,
                ),
              ),
              if (sale.paymentMethod.isNotEmpty) ...[
                const SizedBox(height: 2),
                Text(
                  sale.paymentMethod,
                  style: const TextStyle(fontSize: 11, color: _kGray500),
                ),
              ],
              const SizedBox(height: 10),
              // Row 3: badges
              Wrap(
                spacing: 6,
                runSpacing: 5,
                children: [
                  _StatusBadge(
                    label: SaleFormatters.statusLabel(sale.status),
                    foreground:
                        isCanceled ? _kRed500 : _kPrimary,
                  ),
                  if (sale.fullInvoiceNumber != null)
                    _StatusBadge(
                      label: sale.fullInvoiceNumber!,
                      foreground: _kGray500,
                    ),
                  _StatusBadge(
                    label: SaleFormatters.sunatLabel(sale.sunatStatus),
                    foreground: _kTeal600,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(height: 1, color: _kGray100),
              const SizedBox(height: 8),
              // Row 4: actions
              Row(
                children: [
                  _ActionBtn(
                    icon: Icons.receipt_outlined,
                    label: 'Ticket',
                    onPressed: onTicket,
                    color: _kPrimary,
                  ),
                  if (canEdit) ...[
                    const SizedBox(width: 4),
                    _ActionBtn(
                      icon: Icons.edit_outlined,
                      label: 'Editar',
                      onPressed: onEdit,
                      color: _kGray700,
                    ),
                  ],
                  if (canView) ...[
                    const SizedBox(width: 4),
                    _ActionBtn(
                      icon: Icons.visibility_outlined,
                      label: 'Ver',
                      onPressed: onView,
                      color: _kGray700,
                    ),
                  ],
                  if (canCancel) ...[
                    const Spacer(),
                    _ActionBtn(
                      icon: Icons.cancel_outlined,
                      label: 'Anular',
                      onPressed: onCancel,
                      color: _kRed500,
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Status badge ─────────────────────────────────────────────────────────────

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.label, required this.foreground});

  final String label;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: foreground.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: foreground.withValues(alpha: 0.25)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: foreground,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}

// ─── Action button ────────────────────────────────────────────────────────────

class _ActionBtn extends StatelessWidget {
  const _ActionBtn({
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.color,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
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

// ─── Pagination bar ───────────────────────────────────────────────────────────

class _PaginationBar extends ConsumerWidget {
  const _PaginationBar({required this.state});

  final SalesListState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: _kGray100)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton(
            onPressed: state.page <= 1
                ? null
                : () => ref
                    .read(salesListNotifierProvider.notifier)
                    .goToPage(state.page - 1),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: _kGray200),
              foregroundColor: _kGray700,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Anterior', style: TextStyle(fontSize: 13)),
          ),
          Text(
            'Pág. ${state.page} de ${state.totalPages}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: _kGray500,
            ),
          ),
          OutlinedButton(
            onPressed: state.page >= state.totalPages
                ? null
                : () => ref
                    .read(salesListNotifierProvider.notifier)
                    .goToPage(state.page + 1),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: _kGray200),
              foregroundColor: _kGray700,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Siguiente', style: TextStyle(fontSize: 13)),
          ),
        ],
      ),
    );
  }
}
