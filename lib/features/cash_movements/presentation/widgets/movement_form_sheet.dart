import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nm_mobile/features/cash_movements/data/adapters/cash_movement_adapter.dart';
import 'package:nm_mobile/features/cash_movements/domain/entities/cash_movement.dart';
import 'package:nm_mobile/features/cash_movements/domain/entities/cash_movement_enums.dart';
import 'package:nm_mobile/features/cash_movements/presentation/notifiers/cash_register_notifier.dart';

const _quickExpensePresets = [
  (label: 'Pasaje', icon: Icons.directions_car_outlined, amount: 4.0),
  (label: 'Almuerzo', icon: Icons.restaurant_outlined, amount: 10.0),
  (label: 'Vigilancia', icon: Icons.shield_outlined, amount: 1.0),
];

class MovementFormSheet extends ConsumerStatefulWidget {
  const MovementFormSheet({
    super.key,
    required this.movementType,
    required this.viewDate,
    required this.isAdmin,
    this.editingItem,
  });

  final MovementType movementType;
  final DateTime viewDate;
  final bool isAdmin;
  final CashMovementItem? editingItem;

  static Future<void> show(
    BuildContext context, {
    required MovementType movementType,
    required DateTime viewDate,
    required bool isAdmin,
    CashMovementItem? editingItem,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: MovementFormSheet(
          movementType: movementType,
          viewDate: viewDate,
          isAdmin: isAdmin,
          editingItem: editingItem,
        ),
      ),
    );
  }

  @override
  ConsumerState<MovementFormSheet> createState() => _MovementFormSheetState();
}

class _MovementFormSheetState extends ConsumerState<MovementFormSheet> {
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  CashPaymentMethod _paymentMethod = CashPaymentMethod.cash;
  late DateTime _movementDateTime;
  var _saving = false;

  bool get _isEditing => widget.editingItem != null;

  @override
  void initState() {
    super.initState();
    final item = widget.editingItem;
    if (item != null) {
      _descriptionController.text = item.description;
      _amountController.text = item.amount.toStringAsFixed(2);
      _paymentMethod = item.paymentMethod ?? CashPaymentMethod.fromApi(item.method);
      _movementDateTime = item.date != null
          ? DateTime.tryParse(item.date!.replaceFirst(' ', 'T')) ??
              _defaultMovementDate()
          : _defaultMovementDate();
    } else {
      _movementDateTime = _defaultMovementDate();
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  DateTime _defaultMovementDate() {
    final now = DateTime.now();
    return DateTime(
      widget.viewDate.year,
      widget.viewDate.month,
      widget.viewDate.day,
      now.hour,
      now.minute,
      now.second,
    );
  }

  Future<void> _submit() async {
    final description = _descriptionController.text.trim();
    final amount = double.tryParse(_amountController.text) ?? 0;
    if (description.isEmpty || amount <= 0) return;

    final movementDate = widget.isAdmin ? _movementDateTime : _defaultMovementDate();
    final payload = MovementPayload(
      type: widget.movementType,
      category: MovementCategory.store,
      amount: amount,
      description: description,
      date: formatDateTime(movementDate),
      paymentMethod: _paymentMethod,
    );

    setState(() => _saving = true);
    final notifier = ref.read(cashRegisterNotifierProvider.notifier);
    if (_isEditing) {
      await notifier.updateMovement(widget.editingItem!.id, payload);
    } else {
      await notifier.registerMovement(payload);
    }
    if (mounted) {
      setState(() => _saving = false);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF1565C0);
    final isExpense = widget.movementType == MovementType.expense;
    final title = _isEditing
        ? (isExpense ? 'Editar gasto' : 'Editar ingreso')
        : (isExpense ? 'Registrar gasto' : 'Registrar ingreso');

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
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
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: _saving ? null : () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (isExpense && !_isEditing) ...[
                    const Text(
                      'GASTOS FRECUENTES',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        for (final preset in _quickExpensePresets)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: OutlinedButton(
                                onPressed: () {
                                  _descriptionController.text = preset.label;
                                  _amountController.text =
                                      preset.amount.toStringAsFixed(0);
                                  setState(() {});
                                },
                                child: Column(
                                  children: [
                                    Icon(preset.icon, size: 20),
                                    Text(
                                      preset.label,
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                    Text(
                                      'S/ ${preset.amount.toStringAsFixed(0)}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                  if (widget.isAdmin) ...[
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Fecha y hora'),
                      subtitle: Text(
                        DateFormat('dd/MM/yyyy HH:mm').format(_movementDateTime),
                      ),
                      trailing: const Icon(Icons.calendar_today),
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: _movementDateTime,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2100),
                        );
                        if (date == null || !mounted) return;
                        if (!context.mounted) return;
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(_movementDateTime),
                        );
                        if (time == null || !mounted) return;
                        setState(() {
                          _movementDateTime = DateTime(
                            date.year,
                            date.month,
                            date.day,
                            time.hour,
                            time.minute,
                          );
                        });
                      },
                    ),
                    const SizedBox(height: 8),
                  ],
                  DropdownButtonFormField<CashPaymentMethod>(
                    initialValue: _paymentMethod,
                    decoration: const InputDecoration(
                      labelText: 'Método de pago',
                      border: OutlineInputBorder(),
                    ),
                    items: CashPaymentMethod.values
                        .map(
                          (m) => DropdownMenuItem(
                            value: m,
                            child: Text(m.label),
                          ),
                        )
                        .toList(),
                    onChanged: (v) {
                      if (v != null) setState(() => _paymentMethod = v);
                    },
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Descripción *',
                      hintText: 'Ej: Pago de servicios',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _amountController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'Monto *',
                      prefixText: 'S/ ',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: FilledButton(
                  onPressed: _saving ? null : _submit,
                  style: FilledButton.styleFrom(
                    backgroundColor: isExpense ? Colors.red : primary,
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
                      : Text(_isEditing ? 'Guardar cambios' : 'Confirmar'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
