import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nm_mobile/core/auth/permission_util.dart';
import 'package:nm_mobile/core/routing/app_routes.dart';
import 'package:nm_mobile/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:nm_mobile/features/auth/presentation/notifiers/auth_state.dart';
import 'package:nm_mobile/features/pos/domain/entities/cart_item.dart';
import 'package:nm_mobile/features/pos/presentation/notifiers/pos_notifier.dart';
import 'package:nm_mobile/features/pos/presentation/widgets/pos_customer_header.dart';
import 'package:nm_mobile/features/pos/presentation/widgets/pos_footer.dart';
import 'package:nm_mobile/features/pos/presentation/widgets/pos_variant_selector_sheet.dart';
import 'package:nm_mobile/features/pos/presentation/widgets/ticket_preview_dialog.dart';

// ─── palette ───────────────────────────────────────────────────────────────
const _kPrimary = Color(0xFF1565C0);
const _kGray50 = Color(0xFFF9FAFB);
const _kGray100 = Color(0xFFF3F4F6);
const _kGray200 = Color(0xFFE5E7EB);
const _kGray400 = Color(0xFF9CA3AF);
const _kGray500 = Color(0xFF6B7280);
const _kGray700 = Color(0xFF374151);
const _kGray900 = Color(0xFF111827);
const _kRed500 = Color(0xFFEF4444);

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
    setState(() {}); // rebuild for clear-button visibility
  }

  bool get _hasNoWarehouse {
    final user = ref.read(authNotifierProvider).maybeMap(
          authenticated: (s) => s.user,
          orElse: () => null,
        );
    return user != null && user.warehouseId == null;
  }

  bool get _canViewSales {
    final user = ref.read(authNotifierProvider).maybeMap(
          authenticated: (s) => s.user,
          orElse: () => null,
        );
    return userHasAnyPermission(user, ['sale.getAll', 'sale.get']);
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
            ..showSnackBar(
              SnackBar(
                content: Text(message),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          ref.read(posNotifierProvider.notifier).clearToast();
        }
      },
    );

    final pos = ref.watch(posNotifierProvider);

    return Stack(
      children: [
        Column(
          children: [
            _PosHeader(
              totalItems: pos.totalItems,
              grandTotal: pos.grandTotal,
              lastSaleId: pos.lastSaleId,
              isLoading: pos.isLoading,
              canViewSales: _canViewSales,
              onPrint: _printTicket,
              onViewSales: () => context.go(AppRoutes.sales),
            ),
            const PosCustomerHeader(),
            Expanded(
              child: ColoredBox(
                color: _kGray50,
                child: Column(
                  children: [
                    if (_hasNoWarehouse) const _NoWarehouseBanner(),
                    _BarcodeScanner(
                      controller: _barcodeController,
                      focusNode: _barcodeFocus,
                      isLoading: pos.isLoading,
                      disabled: _hasNoWarehouse,
                      onSubmit: () => _performScan(_barcodeController.text),
                    ),
                    Expanded(
                      child: _CartList(hasNoWarehouse: _hasNoWarehouse),
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

// ─── Header ──────────────────────────────────────────────────────────────────

class _PosHeader extends StatelessWidget {
  const _PosHeader({
    required this.totalItems,
    required this.grandTotal,
    required this.lastSaleId,
    required this.isLoading,
    required this.canViewSales,
    required this.onPrint,
    required this.onViewSales,
  });

  final int totalItems;
  final double grandTotal;
  final int? lastSaleId;
  final bool isLoading;
  final bool canViewSales;
  final VoidCallback onPrint;
  final VoidCallback onViewSales;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: _kGray100)),
      ),
      child: Row(
        children: [
          // Icon badge
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: _kPrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.point_of_sale, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 10),
          // Title + subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Punto de Venta',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: _kGray900,
                    height: 1.2,
                  ),
                ),
                Text(
                  '$totalItems ${totalItems == 1 ? 'ítem' : 'ítems'} · S/ ${grandTotal.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 12, color: _kGray400, height: 1.2),
                ),
              ],
            ),
          ),
          // Action chips (visible after a sale)
          if (lastSaleId != null) ...[
            _HeaderChip(
              icon: Icons.print_outlined,
              label: 'Imprimir ticket',
              onPressed: isLoading ? null : onPrint,
            ),
            if (canViewSales) ...[
              const SizedBox(width: 6),
              _HeaderChip(
                icon: Icons.receipt_long_outlined,
                label: 'Ver en ventas',
                onPressed: isLoading ? null : onViewSales,
              ),
            ],
          ],
        ],
      ),
    );
  }
}

class _HeaderChip extends StatelessWidget {
  const _HeaderChip({
    required this.icon,
    required this.label,
    this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Opacity(
        opacity: onPressed == null ? 0.4 : 1.0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: _kPrimary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _kPrimary.withValues(alpha: 0.25)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 14, color: _kPrimary),
              const SizedBox(width: 4),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: _kPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── No warehouse banner ──────────────────────────────────────────────────────

class _NoWarehouseBanner extends StatelessWidget {
  const _NoWarehouseBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFBEB),
        border: Border(bottom: BorderSide(color: Color(0xFFFDE68A))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.warning_amber_rounded, color: Color(0xFFD97706), size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 13, color: Color(0xFF92400E), height: 1.4),
                children: [
                  TextSpan(
                    text: 'Sin almacén asignado. ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text:
                        'No puedes buscar productos ni registrar ventas. Contacta al administrador.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Barcode scanner ─────────────────────────────────────────────────────────

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
    final active = isLoading;

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: _kGray100)),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: active ? _kPrimary.withValues(alpha: 0.5) : _kGray200,
            width: active ? 1.5 : 1,
          ),
          boxShadow: active
              ? [
                  BoxShadow(
                    color: _kPrimary.withValues(alpha: 0.15),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),
            SizedBox(
              width: 18,
              height: 18,
              child: isLoading
                  ? CircularProgressIndicator(
                      strokeWidth: 2,
                      color: _kPrimary.withValues(alpha: 0.7),
                    )
                  : const Icon(Icons.qr_code_scanner_outlined, size: 18, color: _kGray400),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                enabled: !disabled && !isLoading,
                autocorrect: false,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 14,
                  color: _kGray900,
                ),
                decoration: const InputDecoration(
                  hintText: 'Escanear o ingresar código de producto…',
                  hintStyle: TextStyle(
                    color: _kGray400,
                    fontSize: 13,
                    fontFamily: 'sans-serif',
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                ),
                onSubmitted: (_) => onSubmit(),
              ),
            ),
            Container(
              height: 44,
              decoration: const BoxDecoration(
                border: Border(left: BorderSide(color: _kGray200)),
              ),
              child: IconButton(
                icon: const Icon(Icons.search, size: 20),
                onPressed:
                    disabled || isLoading || controller.text.trim().isEmpty
                        ? null
                        : onSubmit,
                color: _kGray500,
                disabledColor: _kGray400.withValues(alpha: 0.5),
                tooltip: 'Buscar producto',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Cart list ────────────────────────────────────────────────────────────────

class _CartList extends ConsumerWidget {
  const _CartList({required this.hasNoWarehouse});

  final bool hasNoWarehouse;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pos = ref.watch(posNotifierProvider);
    final notifier = ref.read(posNotifierProvider.notifier);

    if (pos.cart.isEmpty) {
      return const _CartEmptyState();
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      children: [
        // Toolbar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'CARRITO (${pos.totalItems})',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: _kGray400,
                  letterSpacing: 0.8,
                ),
              ),
              GestureDetector(
                onTap: notifier.clearCart,
                child: const Text(
                  'VACIAR',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: _kRed500,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        for (final item in pos.cart)
          _CartItemCard(
            item: item,
            hasNoWarehouse: hasNoWarehouse,
            onRemove: () => notifier.removeItem(item.cartId),
            onEdit: () => notifier.openEditModal(item),
            onMinus: () => notifier.updateQuantity(item.cartId, -1),
            onPlus: () => notifier.updateQuantity(item.cartId, 1),
          ),
      ],
    );
  }
}

class _CartEmptyState extends StatelessWidget {
  const _CartEmptyState();

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
              child: const Icon(Icons.shopping_bag_outlined, size: 36, color: _kGray400),
            ),
            const SizedBox(height: 16),
            const Text(
              'Carrito vacío',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: _kGray700,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Escanea un código de barras para agregar productos',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: _kGray400, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Cart item card ───────────────────────────────────────────────────────────

class _CartItemCard extends StatelessWidget {
  const _CartItemCard({
    required this.item,
    required this.hasNoWarehouse,
    required this.onRemove,
    required this.onEdit,
    required this.onMinus,
    required this.onPlus,
  });

  final CartItem item;
  final bool hasNoWarehouse;
  final VoidCallback onRemove;
  final VoidCallback onEdit;
  final VoidCallback onMinus;
  final VoidCallback onPlus;

  Color _parseColor(String hex) {
    var v = hex.replaceFirst('#', '');
    if (v.length == 6) v = 'FF$v';
    return Color(int.parse(v, radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    final swatchColor = _parseColor(item.color.hex);
    final isWhite = item.color.hex.toLowerCase() == '#ffffff';

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _kGray200),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Color swatch
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: swatchColor,
              shape: BoxShape.circle,
              border: isWhite ? Border.all(color: _kGray200) : null,
              boxShadow: [
                BoxShadow(
                  color: swatchColor.withValues(alpha: 0.3),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name + remove
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: _kGray900,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: onRemove,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        child: const Icon(Icons.close, size: 16, color: _kGray400),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                // Variant tag + unit price
                Row(
                  children: [
                    GestureDetector(
                      onTap: hasNoWarehouse ? null : onEdit,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: _kGray50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: _kGray200),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${item.size} · ${item.color.colorName}',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: _kGray700,
                              ),
                            ),
                            const SizedBox(width: 3),
                            const Icon(Icons.edit_outlined, size: 11, color: _kPrimary),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: onEdit,
                      child: Text(
                        'S/ ${item.unitPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: _kPrimary,
                          decoration: TextDecoration.underline,
                          decorationColor: _kPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Divider
                const Divider(height: 1, color: _kGray100),
                const SizedBox(height: 8),
                // Qty stepper + total
                Row(
                  children: [
                    _QtyStepper(
                      qty: item.quantity,
                      onMinus: onMinus,
                      onPlus: onPlus,
                    ),
                    const Spacer(),
                    Text(
                      'S/ ${item.total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                        color: _kGray900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Qty stepper ─────────────────────────────────────────────────────────────

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
        border: Border.all(color: _kGray200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _StepperBtn(onTap: onMinus, icon: Icons.remove, isPrimary: false),
          Container(
            width: 34,
            height: 32,
            alignment: Alignment.center,
            child: Text(
              '$qty',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: _kGray900,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          _StepperBtn(onTap: onPlus, icon: Icons.add, isPrimary: true),
        ],
      ),
    );
  }
}

class _StepperBtn extends StatelessWidget {
  const _StepperBtn({
    required this.onTap,
    required this.icon,
    required this.isPrimary,
  });

  final VoidCallback onTap;
  final IconData icon;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(7),
      child: SizedBox(
        width: 32,
        height: 32,
        child: Icon(
          icon,
          size: 15,
          color: isPrimary ? _kPrimary : _kGray500,
        ),
      ),
    );
  }
}
