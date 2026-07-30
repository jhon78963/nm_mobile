import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nm_mobile/core/auth/permission_util.dart';
import 'package:nm_mobile/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:nm_mobile/features/auth/presentation/notifiers/auth_state.dart';
import 'package:nm_mobile/features/sales/data/sales_data_providers.dart';
import 'package:nm_mobile/features/sales/domain/entities/sale.dart';
import 'package:nm_mobile/features/sales/domain/entities/sale_enums.dart';
import 'package:nm_mobile/features/sales/presentation/utils/sale_formatters.dart';

class SaleDetailSheet extends ConsumerStatefulWidget {
  const SaleDetailSheet({
    super.key,
    required this.saleId,
    required this.readOnly,
    required this.onSaved,
  });

  final int saleId;
  final bool readOnly;
  final VoidCallback onSaved;

  static Future<void> show(
    BuildContext context, {
    required int saleId,
    required bool readOnly,
    required VoidCallback onSaved,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: SaleDetailSheet(
          saleId: saleId,
          readOnly: readOnly,
          onSaved: onSaved,
        ),
      ),
    );
  }

  @override
  ConsumerState<SaleDetailSheet> createState() => _SaleDetailSheetState();
}

class _EditableItem {
  _EditableItem({
    this.id,
    required this.description,
    required this.quantity,
    required this.unitPrice,
    this.productSizeId,
    this.colorId,
  });

  int? id;
  String description;
  int quantity;
  double unitPrice;
  int? productSizeId;
  int? colorId;

  double get subtotal => quantity * unitPrice;
}

class _EditablePayment {
  _EditablePayment({required this.method, required this.amount});

  SalePaymentMethod method;
  double amount;
}

class _SaleDetailSheetState extends ConsumerState<SaleDetailSheet> {
  SaleDetail? _detail;
  var _loading = true;
  var _saving = false;
  String? _error;
  final _items = <_EditableItem>[];
  final _payments = <_EditablePayment>[];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final detail = await ref.read(saleRepositoryProvider).getOne(widget.saleId);
      if (!mounted) return;
      setState(() {
        _detail = detail;
        _items
          ..clear()
          ..addAll(
            detail.items.map(
              (i) => _EditableItem(
                id: i.id,
                description: i.descriptionFull.isNotEmpty
                    ? i.descriptionFull
                    : i.productName,
                quantity: i.quantity,
                unitPrice: i.unitPrice,
                productSizeId: i.productSizeId,
                colorId: i.colorId,
              ),
            ),
          );
        _payments
          ..clear()
          ..addAll(
            detail.payments.map(
              (p) => _EditablePayment(method: p.method, amount: p.amount),
            ),
          );
        _loading = false;
      });
    } on Exception catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = e.toString().replaceFirst('Exception: ', '');
      });
    }
  }

  double get _total => _items.fold(0, (acc, i) => acc + i.subtotal);

  double get _paymentsSum => _payments.fold(0, (acc, p) => acc + p.amount);

  bool get _isBalanced => (_total - _paymentsSum).abs() < 0.1;

  bool get _canEdit {
    final user = ref.read(authNotifierProvider).maybeMap(
          authenticated: (s) => s.user,
          orElse: () => null,
        );
    return !widget.readOnly &&
        _detail?.status != 'CANCELED' &&
        userHasPermission(user, 'sale.update');
  }

  Future<void> _save() async {
    final detail = _detail;
    if (detail == null || !_canEdit || !_isBalanced) return;

    setState(() => _saving = true);
    try {
      await ref.read(saleRepositoryProvider).update(
            widget.saleId,
            SaleUpdatePayload(
              id: detail.id,
              code: detail.code,
              total: _total,
              status: detail.status,
              creationTime: detail.datetimeIso ?? detail.creationTime,
              items: _items
                  .map(
                    (i) => SaleUpdateItem(
                      id: i.id,
                      quantity: i.quantity,
                      unitPrice: i.unitPrice,
                      productSizeId: i.productSizeId,
                      colorId: i.colorId,
                    ),
                  )
                  .toList(),
              payments: _payments
                  .map(
                    (p) => SaleUpdatePayment(
                      method: p.method.apiValue,
                      amount: p.amount,
                    ),
                  )
                  .toList(),
            ),
          );
      if (!mounted) return;
      Navigator.of(context).pop();
      widget.onSaved();
    } on Exception catch (e) {
      if (!mounted) return;
      setState(() {
        _saving = false;
        _error = e.toString().replaceFirst('Exception: ', '');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF1565C0);
    final maxHeight = MediaQuery.of(context).size.height * 0.9;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(top: 10, bottom: 8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _canEdit ? 'Editar venta' : 'Detalle de venta',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          Flexible(
            child: _loading
                ? const SizedBox(
                    height: 200,
                    child: Center(child: CircularProgressIndicator()),
                  )
                : _error != null && _detail == null
                    ? SizedBox(
                        height: 120,
                        child: Center(child: Text(_error!)),
                      )
                    : ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(16),
                        children: [
                          if (_detail != null) ...[
                            _MetaSection(detail: _detail!),
                            const SizedBox(height: 16),
                            const Text(
                              'ÍTEMS',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 8),
                            for (final item in _items)
                              _ItemRow(
                                item: item,
                                editable: _canEdit,
                                onChanged: () => setState(() {}),
                              ),
                            const SizedBox(height: 16),
                            const Text(
                              'PAGOS',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 8),
                            for (final payment in _payments)
                              _PaymentRow(
                                payment: payment,
                                editable: _canEdit,
                                onChanged: () => setState(() {}),
                              ),
                            if (_canEdit && _payments.length > 1)
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      if (_payments.isNotEmpty) {
                                        _payments.last.amount +=
                                            _total - _paymentsSum;
                                      }
                                    });
                                  },
                                  child: const Text('Cuadrar pagos'),
                                ),
                              ),
                            const Divider(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  SaleFormatters.money(_total),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                            if (_canEdit && !_isBalanced && _payments.length > 1)
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  'Diferencia: ${SaleFormatters.money(_total - _paymentsSum)}',
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ),
                            if (_error != null && _detail != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  _error!,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ),
                          ],
                        ],
                      ),
          ),
          if (_canEdit && _detail != null)
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: FilledButton(
                    onPressed: _saving || !_isBalanced || _items.isEmpty
                        ? null
                        : _save,
                    style: FilledButton.styleFrom(
                      backgroundColor: primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _saving
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text('Guardar cambios'),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _MetaSection extends StatelessWidget {
  const _MetaSection({required this.detail});

  final SaleDetail detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detail.code,
            style: const TextStyle(
              fontFamily: 'monospace',
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(detail.customer.isEmpty ? 'Sin cliente' : detail.customer),
          Text(SaleFormatters.date(detail.creationTime)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              _Chip(
                label: SaleFormatters.statusLabel(detail.status),
                color: detail.status == 'CANCELED'
                    ? Colors.red
                    : const Color(0xFF1565C0),
              ),
              if (detail.fullInvoiceNumber != null)
                _Chip(label: detail.fullInvoiceNumber!, color: Colors.grey),
              _Chip(
                label: SaleFormatters.sunatLabel(detail.sunatStatus),
                color: Colors.teal,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

class _ItemRow extends StatefulWidget {
  const _ItemRow({
    required this.item,
    required this.editable,
    required this.onChanged,
  });

  final _EditableItem item;
  final bool editable;
  final VoidCallback onChanged;

  @override
  State<_ItemRow> createState() => _ItemRowState();
}

class _ItemRowState extends State<_ItemRow> {
  late final TextEditingController _qtyController;
  late final TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _qtyController = TextEditingController(text: '${widget.item.quantity}');
    _priceController = TextEditingController(
      text: widget.item.unitPrice.toStringAsFixed(2),
    );
  }

  @override
  void dispose() {
    _qtyController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.description,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                if (widget.editable)
                  SizedBox(
                    width: 64,
                    child: TextField(
                      controller: _qtyController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Cant.',
                        isDense: true,
                      ),
                      onChanged: (v) {
                        item.quantity = int.tryParse(v) ?? item.quantity;
                        widget.onChanged();
                      },
                    ),
                  )
                else
                  Text('Cant: ${item.quantity}'),
                const SizedBox(width: 12),
                if (widget.editable)
                  Expanded(
                    child: TextField(
                      controller: _priceController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Precio unit.',
                        prefixText: 'S/ ',
                        isDense: true,
                      ),
                      onChanged: (v) {
                        item.unitPrice =
                            double.tryParse(v) ?? item.unitPrice;
                        widget.onChanged();
                      },
                    ),
                  )
                else
                  Text(SaleFormatters.money(item.unitPrice)),
                const Spacer(),
                Text(
                  SaleFormatters.money(item.subtotal),
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentRow extends StatefulWidget {
  const _PaymentRow({
    required this.payment,
    required this.editable,
    required this.onChanged,
  });

  final _EditablePayment payment;
  final bool editable;
  final VoidCallback onChanged;

  @override
  State<_PaymentRow> createState() => _PaymentRowState();
}

class _PaymentRowState extends State<_PaymentRow> {
  late final TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController(
      text: widget.payment.amount.toStringAsFixed(2),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final payment = widget.payment;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            if (widget.editable)
              DropdownButton<SalePaymentMethod>(
                value: payment.method,
                items: SalePaymentMethod.values
                    .map(
                      (m) => DropdownMenuItem(
                        value: m,
                        child: Text(m.label),
                      ),
                    )
                    .toList(),
                onChanged: (v) {
                  if (v != null) {
                    payment.method = v;
                    widget.onChanged();
                  }
                },
              )
            else
              Text(payment.method.label),
            const Spacer(),
            if (widget.editable)
              SizedBox(
                width: 100,
                child: TextField(
                  controller: _amountController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    prefixText: 'S/ ',
                    isDense: true,
                  ),
                  onChanged: (v) {
                    payment.amount = double.tryParse(v) ?? payment.amount;
                    widget.onChanged();
                  },
                ),
              )
            else
              Text(SaleFormatters.money(payment.amount)),
          ],
        ),
      ),
    );
  }
}
