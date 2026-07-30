import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nm_mobile/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:nm_mobile/features/auth/presentation/notifiers/auth_state.dart';
import 'package:nm_mobile/features/pos/presentation/notifiers/pos_notifier.dart';
import 'package:nm_mobile/features/pos/presentation/widgets/pos_customer_header.dart';
import 'package:nm_mobile/features/pos/presentation/widgets/pos_footer.dart';
import 'package:nm_mobile/features/pos/presentation/widgets/pos_variant_selector_sheet.dart';
import 'package:nm_mobile/features/pos/presentation/widgets/ticket_preview_dialog.dart';

class PosPage extends ConsumerStatefulWidget {
  const PosPage({super.key});

  @override
  ConsumerState<PosPage> createState() => _PosPageState();
}

class _PosPageState extends ConsumerState<PosPage> {
  final _barcodeController = TextEditingController();
  final _barcodeFocus = FocusNode();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _barcodeController.addListener(_onBarcodeChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _barcodeFocus.requestFocus();
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _barcodeController.dispose();
    _barcodeFocus.dispose();
    super.dispose();
  }

  void _onBarcodeChanged() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      if (!_hasNoWarehouse && _barcodeController.text.trim().isNotEmpty) {
        _performScan(_barcodeController.text);
      }
    });
  }

  bool get _hasNoWarehouse {
    final user = ref.read(authNotifierProvider).maybeMap(
          authenticated: (s) => s.user,
          orElse: () => null,
        );
    return user != null && user.warehouseId == null;
  }

  Future<void> _performScan(String raw) async {
    final code = raw.trim();
    if (code.isEmpty || _hasNoWarehouse) return;

    final product =
        await ref.read(posNotifierProvider.notifier).searchProductBySku(code);
    if (product != null && mounted) {
      ref.read(posNotifierProvider.notifier).openAddModal(product);
    }
    _barcodeController.clear();
    _barcodeFocus.requestFocus();
  }

  Future<void> _printTicket() async {
    final html = await ref.read(posNotifierProvider.notifier).fetchTicketHtml();
    if (html != null && html.isNotEmpty && mounted) {
      await TicketPreviewDialog.show(context, html);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      posNotifierProvider.select((s) => s.toastMessage),
      (_, message) {
        if (message != null && mounted) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(message)));
          ref.read(posNotifierProvider.notifier).clearToast();
        }
      },
    );

    final pos = ref.watch(posNotifierProvider);
    const primary = Color(0xFF1565C0);

    return Stack(
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Color(0xFFF3F4F6))),
              ),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.point_of_sale,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Punto de Venta',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '${pos.totalItems} ítems · S/ ${pos.grandTotal.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (pos.lastSaleId != null)
                    TextButton.icon(
                      onPressed: pos.isLoading ? null : _printTicket,
                      icon: const Icon(Icons.print_outlined, size: 16),
                      label: const Text('Imprimir ticket'),
                      style: TextButton.styleFrom(
                        foregroundColor: primary,
                        backgroundColor: primary.withValues(alpha: 0.08),
                      ),
                    ),
                ],
              ),
            ),
            const PosCustomerHeader(),
            Expanded(
              child: ColoredBox(
                color: const Color(0xFFF9FAFB),
                child: Column(
                  children: [
                    if (_hasNoWarehouse) _NoWarehouseBanner(),
                    _BarcodeScanner(
                      controller: _barcodeController,
                      focusNode: _barcodeFocus,
                      isLoading: pos.isLoading,
                      disabled: _hasNoWarehouse,
                      onSubmit: () => _performScan(_barcodeController.text),
                    ),
                    Expanded(
                      child: _CartList(
                        hasNoWarehouse: _hasNoWarehouse,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PosFooter(hasNoWarehouse: _hasNoWarehouse),
          ],
        ),
        const PosVariantSelectorSheet(),
      ],
    );
  }
}

class _NoWarehouseBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      color: const Color(0xFFFFFBEB),
      child: const Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: Color(0xFFD97706)),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Sin almacén asignado. No puedes buscar productos ni registrar ventas. Contacta al administrador.',
              style: TextStyle(fontSize: 13, color: Color(0xFF92400E)),
            ),
          ),
        ],
      ),
    );
  }
}

class _BarcodeScanner extends StatelessWidget {
  const _BarcodeScanner({
    required this.controller,
    required this.focusNode,
    required this.isLoading,
    required this.disabled,
    required this.onSubmit,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isLoading;
  final bool disabled;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF1565C0);

    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.white,
      child: Row(
        children: [
          if (isLoading)
            const Padding(
              padding: EdgeInsets.only(left: 8, right: 4),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 4),
              child: Icon(Icons.qr_code_scanner, color: Colors.grey[500]),
            ),
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              enabled: !disabled && !isLoading,
              autocorrect: false,
              style: const TextStyle(fontFamily: 'monospace', fontSize: 14),
              decoration: const InputDecoration(
                hintText: 'Escanear o ingresar código de producto…',
                border: InputBorder.none,
                isDense: true,
              ),
              onSubmitted: (_) => onSubmit(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: disabled || isLoading || controller.text.trim().isEmpty
                ? null
                : onSubmit,
            color: primary,
          ),
        ],
      ),
    );
  }
}

class _CartList extends ConsumerWidget {
  const _CartList({required this.hasNoWarehouse});

  final bool hasNoWarehouse;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pos = ref.watch(posNotifierProvider);
    final notifier = ref.read(posNotifierProvider.notifier);
    const primary = Color(0xFF1565C0);

    if (pos.cart.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.shopping_bag_outlined, size: 56, color: Colors.grey[300]),
            const SizedBox(height: 12),
            Text(
              'Carrito vacío',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey[500],
              ),
            ),
            Text(
              'Escanea un código para agregar productos',
              style: TextStyle(fontSize: 12, color: Colors.grey[400]),
            ),
          ],
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'CARRITO (${pos.totalItems})',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.grey[500],
                letterSpacing: 1,
              ),
            ),
            TextButton(
              onPressed: notifier.clearCart,
              child: const Text(
                'VACIAR',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        for (final item in pos.cart)
          Card(
            margin: const EdgeInsets.only(bottom: 8),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: Color(0xFFE5E7EB)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: _parseColor(item.color.hex),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close, size: 18),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: () => notifier.removeItem(item.cartId),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        InkWell(
                          onTap: hasNoWarehouse
                              ? null
                              : () => notifier.openEditModal(item),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9FAFB),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: const Color(0xFFE5E7EB)),
                            ),
                            child: Text(
                              '${item.size} · ${item.color.colorName}',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _QtyStepper(
                              qty: item.quantity,
                              onMinus: () =>
                                  notifier.updateQuantity(item.cartId, -1),
                              onPlus: () =>
                                  notifier.updateQuantity(item.cartId, 1),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'S/ ${item.unitPrice.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'S/ ${item.total.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Color _parseColor(String hex) {
    var value = hex.replaceFirst('#', '');
    if (value.length == 6) value = 'FF$value';
    return Color(int.parse(value, radix: 16));
  }
}

class _QtyStepper extends StatelessWidget {
  const _QtyStepper({
    required this.qty,
    required this.onMinus,
    required this.onPlus,
  });

  final int qty;
  final VoidCallback onMinus;
  final VoidCallback onPlus;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE5E7EB)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: onMinus,
            child: const SizedBox(
              width: 32,
              height: 32,
              child: Icon(Icons.remove, size: 16),
            ),
          ),
          SizedBox(
            width: 28,
            child: Text(
              '$qty',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          InkWell(
            onTap: onPlus,
            child: const SizedBox(
              width: 32,
              height: 32,
              child: Icon(Icons.add, size: 16, color: Color(0xFF1565C0)),
            ),
          ),
        ],
      ),
    );
  }
}
