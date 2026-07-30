import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nm_mobile/features/pos/domain/entities/document_type.dart';
import 'package:nm_mobile/features/pos/domain/entities/payment_entry.dart';
import 'package:nm_mobile/features/pos/domain/entities/payment_method.dart';
import 'package:nm_mobile/features/pos/presentation/notifiers/pos_notifier.dart';

class PosFooter extends ConsumerStatefulWidget {
  const PosFooter({super.key, required this.hasNoWarehouse});

  final bool hasNoWarehouse;

  @override
  ConsumerState<PosFooter> createState() => _PosFooterState();
}

class _PaymentMethodState {
  _PaymentMethodState({
    required this.method,
    required this.active,
  });

  final PaymentMethod method;
  bool active;
  double? amount;
}

class _PosFooterState extends ConsumerState<PosFooter> {
  final _methods = [
    _PaymentMethodState(method: PaymentMethod.cash, active: true),
    _PaymentMethodState(method: PaymentMethod.yape, active: false),
    _PaymentMethodState(method: PaymentMethod.card, active: false),
  ];
  String? _paymentError;

  List<_PaymentMethodState> get _activeMethods =>
      _methods.where((m) => m.active).toList();

  void _resetMethods() {
    for (final m in _methods) {
      m.active = m.method == PaymentMethod.cash;
      m.amount = null;
    }
    _paymentError = null;
  }

  void _toggleMethod(PaymentMethod method) {
    setState(() {
      final target = _methods.firstWhere((m) => m.method == method);
      final activeCount = _methods.where((m) => m.active).length;
      if (target.active && activeCount == 1) return;
      target.active = !target.active;
      target.amount = null;
      _paymentError = null;
    });
  }

  void _updateAmount(PaymentMethod method, String value) {
    setState(() {
      _methods.firstWhere((m) => m.method == method).amount =
          double.tryParse(value) ?? 0;
      _paymentError = null;
    });
  }

  double _currentSum() =>
      _activeMethods.fold(0, (acc, m) => acc + (m.amount ?? 0));

  bool get _isHybrid => _activeMethods.length > 1;

  void _handleCheckout() {
    if (widget.hasNoWarehouse) return;

    final pos = ref.read(posNotifierProvider);
    final notifier = ref.read(posNotifierProvider.notifier);
    if (pos.isLoading) return;

    final total = pos.grandTotal;
    if (pos.cart.isEmpty) {
      notifier.showToast('El carrito está vacío');
      return;
    }

    List<PaymentEntry> payments;

    if (total <= 0) {
      payments = [
        PaymentEntry(
          method: _activeMethods.firstOrNull?.method ?? PaymentMethod.cash,
          amount: 0,
        ),
      ];
    } else if (_activeMethods.length == 1) {
      payments = [PaymentEntry(method: _activeMethods.first.method, amount: total)];
    } else {
      final sum = _currentSum();
      if ((sum - total).abs() > 0.1) {
        setState(() {
          _paymentError =
              'Los montos no cuadran. Faltan S/ ${(total - sum).clamp(0, double.infinity).toStringAsFixed(2)}';
        });
        return;
      }
      payments = _activeMethods
          .map((m) => PaymentEntry(method: m.method, amount: m.amount ?? 0))
          .toList();
    }

    setState(() => _paymentError = null);
    notifier.checkout(payments);
    _resetMethods();
  }

  @override
  Widget build(BuildContext context) {
    final pos = ref.watch(posNotifierProvider);
    final notifier = ref.read(posNotifierProvider.notifier);
    const primary = Color(0xFF1565C0);

    ref.listen(posNotifierProvider.select((s) => s.cart.length), (prev, next) {
      if (next == 0 && prev != 0) _resetMethods();
    });

    final total = pos.grandTotal;
    final remaining = _isHybrid ? (total - _currentSum()).clamp(0.0, double.infinity) : 0.0;
    final checkoutDisabled = widget.hasNoWarehouse ||
        pos.isLoading ||
        (_isHybrid && remaining > 0.1);

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFF3F4F6))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              for (final m in _methods) ...[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Column(
                      children: [
                        _PaymentChip(
                          method: m.method,
                          active: m.active,
                          onTap: () => _toggleMethod(m.method),
                        ),
                        if (_isHybrid && m.active) ...[
                          const SizedBox(height: 6),
                          TextField(
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            decoration: InputDecoration(
                              hintText: '0.00',
                              prefixText: 'S/ ',
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 8,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onChanged: (v) => _updateAmount(m.method, v),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
          if (_isHybrid && remaining > 0.1) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF2F2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFFECACA)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Falta cubrir',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFDC2626),
                    ),
                  ),
                  Text(
                    'S/ ${remaining.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFB91C1C),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (_paymentError != null) ...[
            const SizedBox(height: 8),
            Text(
              _paymentError!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFFDC2626),
              ),
            ),
          ],
          const SizedBox(height: 12),
          const Text(
            'TIPO DE COMPROBANTE',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Colors.grey,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              for (final opt in const [
                ('Ticket', DocumentType.ticketInterno),
                ('Boleta', DocumentType.boleta),
                ('Factura', DocumentType.factura),
              ])
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: OutlinedButton(
                      onPressed: () => notifier.setDocumentType(opt.$2),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: pos.documentType == opt.$2
                            ? primary.withValues(alpha: 0.1)
                            : null,
                        foregroundColor: pos.documentType == opt.$2
                            ? primary
                            : Colors.grey[700],
                        side: BorderSide(
                          color: pos.documentType == opt.$2
                              ? primary
                              : const Color(0xFFE5E7EB),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      child: Text(
                        opt.$1,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (pos.documentType != DocumentType.ticketInterno)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                'Serie: ${pos.serie}',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 11, color: Colors.grey[600]),
              ),
            ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'TOTAL A COBRAR',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                  letterSpacing: 1,
                ),
              ),
              Text(
                'S/ ${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 52,
            child: FilledButton.icon(
              onPressed: checkoutDisabled ? null : _handleCheckout,
              icon: pos.isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.check_circle_outline),
              label: Text(pos.isLoading ? 'Procesando…' : 'COBRAR'),
              style: FilledButton.styleFrom(
                backgroundColor: primary,
                disabledBackgroundColor: primary.withValues(alpha: 0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentChip extends StatelessWidget {
  const _PaymentChip({
    required this.method,
    required this.active,
    required this.onTap,
  });

  final PaymentMethod method;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF1565C0);
    return Material(
      color: active ? primary.withValues(alpha: 0.12) : const Color(0xFFF9FAFB),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: active ? primary : const Color(0xFFE5E7EB),
            ),
          ),
          child: Column(
            children: [
              Icon(
                switch (method) {
                  PaymentMethod.cash => Icons.payments_outlined,
                  PaymentMethod.yape => Icons.qr_code_2,
                  PaymentMethod.card => Icons.credit_card,
                },
                size: 20,
                color: active ? primary : Colors.grey[600],
              ),
              const SizedBox(height: 2),
              Text(
                method.label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: active ? primary : Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension _FirstOrNull<E> on List<E> {
  E? get firstOrNull => isEmpty ? null : first;
}
