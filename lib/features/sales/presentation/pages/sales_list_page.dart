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
      return userHasAnyPermission(
        _currentUser(),
        ['sale.update', 'sale.get'],
      );
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
        ref.read(salesListNotifierProvider.notifier).showToast(
              'Venta actualizada correctamente.',
            );
        ref.read(salesListNotifierProvider.notifier).load();
      },
    );
  }

  void _openCancelConfirm(Sale sale) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Anular venta'),
        content: Text(
          '¿Anular la venta ${sale.code} · ${sale.customer.isEmpty ? 'Sin cliente' : sale.customer}? Esta acción devolverá el stock al inventario.',
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
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
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
            ..showSnackBar(SnackBar(content: Text(message)));
          ref.read(salesListNotifierProvider.notifier).clearToast();
        }
      },
    );

    final state = ref.watch(salesListNotifierProvider);
    const primary = Color(0xFF1565C0);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ventas',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Historial de ventas y comprobantes',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              FilledButton.icon(
                onPressed: () => context.go(AppRoutes.pos),
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Nueva venta'),
                style: FilledButton.styleFrom(
                  backgroundColor: primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Buscar por código, cliente o comprobante…',
              prefixIcon: const Icon(Icons.search, size: 20),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, size: 18),
                      onPressed: () {
                        _searchController.clear();
                        ref
                            .read(salesListNotifierProvider.notifier)
                            .setSearch('');
                      },
                    )
                  : null,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
              ),
            ),
          ),
        ),
        if (!state.isLoading)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${state.total} ${state.total == 1 ? 'venta' : 'ventas'}',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: primary,
                ),
              ),
            ),
          ),
        Expanded(
          child: _buildBody(state, primary),
        ),
        if (state.totalPages > 1) _PaginationBar(state: state),
      ],
    );
  }

  Widget _buildBody(SalesListState state, Color primary) {
    if (state.isLoading && state.sales.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null && state.sales.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(state.errorMessage!),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () =>
                  ref.read(salesListNotifierProvider.notifier).load(),
              child: const Text('Reintentar'),
            ),
          ],
        ),
      );
    }

    if (state.sales.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.receipt_long_outlined, size: 56, color: Colors.grey[300]),
            const SizedBox(height: 12),
            Text(
              state.search.isNotEmpty
                  ? 'Sin resultados'
                  : 'Aún no hay ventas registradas',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => context.go(AppRoutes.pos),
              child: const Text('Ir al POS'),
            ),
          ],
        ),
      );
    }

    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: state.sales.length,
          itemBuilder: (context, index) {
            final sale = state.sales[index];
            return _SaleCard(
              sale: sale,
              canEdit: _canEdit(sale),
              canView: _canViewOnly(sale),
              canCancel: _canCancel(sale),
              onTap: () {
                if (_canEdit(sale)) {
                  _openDetail(sale.id, readOnly: false);
                } else {
                  _openDetail(sale.id, readOnly: true);
                }
              },
              onTicket: () => _previewTicket(sale.id),
              onEdit: () => _openDetail(sale.id, readOnly: false),
              onView: () => _openDetail(sale.id, readOnly: true),
              onCancel: () => _openCancelConfirm(sale),
            );
          },
        ),
        if (state.isLoading)
          const Positioned(
            top: 8,
            left: 0,
            right: 0,
            child: LinearProgressIndicator(minHeight: 2),
          ),
      ],
    );
  }
}

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

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                          ),
                        ),
                        Text(
                          SaleFormatters.date(sale.creationTime),
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    SaleFormatters.money(sale.total),
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                sale.customer.isEmpty ? '—' : sale.customer,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              if (sale.paymentMethod.isNotEmpty)
                Text(
                  sale.paymentMethod,
                  style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                runSpacing: 4,
                children: [
                  _StatusBadge(
                    label: SaleFormatters.statusLabel(sale.status),
                    color: isCanceled ? Colors.red : const Color(0xFF1565C0),
                  ),
                  if (sale.fullInvoiceNumber != null)
                    _StatusBadge(
                      label: sale.fullInvoiceNumber!,
                      color: Colors.grey,
                    ),
                  _StatusBadge(
                    label: SaleFormatters.sunatLabel(sale.sunatStatus),
                    color: Colors.teal,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: onTicket,
                    icon: const Icon(Icons.receipt, size: 16),
                    label: const Text('Ticket'),
                  ),
                  if (canEdit)
                    TextButton.icon(
                      onPressed: onEdit,
                      icon: const Icon(Icons.edit, size: 16),
                      label: const Text('Editar'),
                    ),
                  if (canView)
                    TextButton.icon(
                      onPressed: onView,
                      icon: const Icon(Icons.visibility, size: 16),
                      label: const Text('Ver'),
                    ),
                  if (canCancel)
                    TextButton.icon(
                      onPressed: onCancel,
                      icon: const Icon(Icons.cancel, size: 16),
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      label: const Text('Anular'),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}

class _PaginationBar extends ConsumerWidget {
  const _PaginationBar({required this.state});

  final SalesListState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFF3F4F6))),
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
            child: const Text('Anterior'),
          ),
          Text('Página ${state.page} de ${state.totalPages}'),
          OutlinedButton(
            onPressed: state.page >= state.totalPages
                ? null
                : () => ref
                    .read(salesListNotifierProvider.notifier)
                    .goToPage(state.page + 1),
            child: const Text('Siguiente'),
          ),
        ],
      ),
    );
  }
}
