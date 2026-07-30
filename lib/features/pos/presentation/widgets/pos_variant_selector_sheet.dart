import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nm_mobile/features/pos/domain/entities/cart_item.dart';
import 'package:nm_mobile/features/pos/domain/entities/product.dart';
import 'package:nm_mobile/features/pos/presentation/notifiers/pos_notifier.dart';
import 'package:nm_mobile/features/pos/presentation/notifiers/pos_state.dart';

class _SelectionItem {
  _SelectionItem({
    required this.variant,
    required this.size,
    required this.qty,
    required this.price,
  });

  final Variant variant;
  final String size;
  int qty;
  double price;
}

class PosVariantSelectorSheet extends ConsumerStatefulWidget {
  const PosVariantSelectorSheet({super.key});

  @override
  ConsumerState<PosVariantSelectorSheet> createState() =>
      _PosVariantSelectorSheetState();
}

class _PosVariantSelectorSheetState
    extends ConsumerState<PosVariantSelectorSheet> {
  String? _activeSize;
  final _selections = <String, _SelectionItem>{};
  String? _pricingAlert;
  Product? _initializedProduct;

  void _syncFromModal(SelectorModalState modal, List<CartItem> cart) {
    final product = modal.product;
    if (product == null) return;
    if (_initializedProduct?.id == product.id && modal.isOpen) return;

    _initializedProduct = product;
    _selections.clear();
    _pricingAlert = null;

    for (final cartItem in cart.where((i) => i.productId == product.id)) {
      final variantsInSize = product.variants[cartItem.size] ?? [];
      Variant? realVariant;
      for (final v in variantsInSize) {
        if (v.colorId == cartItem.color.colorId) {
          realVariant = v;
          break;
        }
      }
      if (realVariant != null) {
        _selections[_itemKey(cartItem.size, realVariant.colorId)] =
            _SelectionItem(
          variant: realVariant,
          size: cartItem.size,
          qty: cartItem.quantity,
          price: cartItem.unitPrice,
        );
      }
    }

    if (modal.isEditing && modal.editingCartItem != null) {
      _activeSize = modal.editingCartItem!.size;
      return;
    }

    String? foundSize;
    for (final entry in product.variants.entries) {
      if (entry.value.any((v) => v.sku == product.sku)) {
        foundSize = entry.key;
        break;
      }
    }
    _activeSize = foundSize ?? product.variants.keys.firstOrNull;
  }

  void _resetWhenClosed() {
    _initializedProduct = null;
    _activeSize = null;
    _selections.clear();
    _pricingAlert = null;
  }

  String _itemKey(String size, int colorId) => '${size}_$colorId';

  int _variantStock(Variant v) => v.inventory?.availableQuantity ?? 0;

  int _selectionQty(Variant v) {
    final size = _activeSize;
    if (size == null) return 0;
    return _selections[_itemKey(size, v.colorId)]?.qty ?? 0;
  }

  double _selectionPrice(Variant v) {
    final size = _activeSize;
    if (size == null) return v.price;
    return _selections[_itemKey(size, v.colorId)]?.price ?? v.price;
  }

  bool _hasSizeSelections(String size) =>
      _selections.values.any((s) => s.size == size && s.qty > 0);

  void _toggleVariant(Variant variant) {
    final size = _activeSize;
    if (size == null || _variantStock(variant) <= 0) return;
    setState(() {
      final key = _itemKey(size, variant.colorId);
      if (_selections.containsKey(key)) {
        _selections[key]!.qty++;
      } else {
        _selections[key] = _SelectionItem(
          variant: variant,
          size: size,
          qty: 1,
          price: variant.price,
        );
      }
    });
  }

  void _updateQty(Variant variant, int delta) {
    final size = _activeSize;
    if (size == null) return;
    setState(() {
      final key = _itemKey(size, variant.colorId);
      if (!_selections.containsKey(key)) {
        if (delta > 0) _toggleVariant(variant);
        return;
      }
      final newQty = _selections[key]!.qty + delta;
      if (newQty <= 0) {
        _selections.remove(key);
      } else {
        _selections[key]!.qty = newQty;
      }
    });
  }

  void _updatePrice(Variant variant, String value) {
    final size = _activeSize;
    if (size == null) return;
    final key = _itemKey(size, variant.colorId);
    if (!_selections.containsKey(key)) return;
    setState(() {
      _selections[key]!.price = double.tryParse(value) ?? 0;
      _pricingAlert = null;
    });
  }

  void _confirm(Product product, bool isEditing) {
    for (final selection in _selections.values) {
      if (selection.price <= 0) {
        setState(() {
          _pricingAlert =
              'Precio inválido. Ingresa un valor mayor a 0 en todos los ítems seleccionados.';
        });
        return;
      }
    }

    final notifier = ref.read(posNotifierProvider.notifier);
    final cart = ref.read(posNotifierProvider).cart;
    final existingItems = cart.where((i) => i.productId == product.id).toList();
    final processedIds = <int>{};

    for (final selection in _selections.values) {
      CartItem? existing;
      for (final item in existingItems) {
        if (item.size == selection.size &&
            item.color.colorId == selection.variant.colorId) {
          existing = item;
          break;
        }
      }

      if (existing != null) {
        notifier.updateItem(
          existing.copyWith(
            quantity: selection.qty,
            unitPrice: selection.price,
            total: selection.qty * selection.price,
            color: selection.variant,
          ),
        );
        processedIds.add(existing.cartId);
      } else {
        notifier.addItem(
          CartItem(
            cartId: PosNotifier.nextCartId(),
            productId: product.id,
            sku: product.sku,
            name: product.name,
            size: selection.size,
            color: selection.variant,
            quantity: selection.qty,
            unitPrice: selection.price,
            total: selection.qty * selection.price,
          ),
        );
      }
    }

    for (final item in existingItems) {
      if (!processedIds.contains(item.cartId)) {
        notifier.removeItem(item.cartId);
      }
    }

    notifier.closeModal();
  }

  int get _totalModalItems =>
      _selections.values.fold(0, (acc, s) => acc + s.qty);

  double get _totalModalPrice =>
      _selections.values.fold(0, (acc, s) => acc + s.qty * s.price);

  @override
  Widget build(BuildContext context) {
    final modal = ref.watch(posNotifierProvider.select((s) => s.selectorModal));
    final cart = ref.watch(posNotifierProvider.select((s) => s.cart));
    final notifier = ref.read(posNotifierProvider.notifier);
    const primary = Color(0xFF1565C0);

    if (!modal.isOpen || modal.product == null) {
      if (_initializedProduct != null) _resetWhenClosed();
      return const SizedBox.shrink();
    }

    _syncFromModal(modal, cart);

    final product = modal.product!;
    final sizes = product.variants.keys.toList();
    final variants =
        _activeSize != null ? product.variants[_activeSize!] ?? [] : <Variant>[];

    return Stack(
      children: [
        GestureDetector(
          onTap: notifier.closeModal,
          child: Container(color: Colors.black54),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            clipBehavior: Clip.antiAlias,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.88,
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
                    padding: const EdgeInsets.fromLTRB(16, 0, 8, 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'SKU: ${product.sku}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                  fontFamily: 'monospace',
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: notifier.closeModal,
                        ),
                      ],
                    ),
                  ),
                  if (sizes.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '1. TALLA',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[500],
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: sizes.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          final size = sizes[index];
                          final selected = _activeSize == size;
                          final hasItems = _hasSizeSelections(size);
                          return ChoiceChip(
                            label: Text(size),
                            selected: selected,
                            showCheckmark: false,
                            avatar: hasItems && !selected
                                ? Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                      color: primary,
                                      shape: BoxShape.circle,
                                    ),
                                  )
                                : null,
                            onSelected: (_) =>
                                setState(() => _activeSize = size),
                            selectedColor: primary.withValues(alpha: 0.15),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: selected ? primary : Colors.grey[800],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                  const Divider(height: 20),
                  Flexible(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      children: [
                        if (_activeSize == null)
                          const Padding(
                            padding: EdgeInsets.all(32),
                            child: Center(
                              child: Text('Selecciona una talla arriba'),
                            ),
                          )
                        else if (variants.isEmpty)
                          const Padding(
                            padding: EdgeInsets.all(32),
                            child: Center(
                              child: Text('Sin variantes para esta talla'),
                            ),
                          )
                        else ...[
                          Text(
                            '2. COLOR / VARIANTE ($_activeSize)',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[500],
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 8),
                          for (final v in variants)
                            _VariantTile(
                              variant: v,
                              stock: _variantStock(v),
                              qty: _selectionQty(v),
                              price: _selectionPrice(v),
                              onTap: () {
                                if (_variantStock(v) > 0 && _selectionQty(v) == 0) {
                                  _toggleVariant(v);
                                }
                              },
                              onQtyDelta: (d) => _updateQty(v, d),
                              onPriceChanged: (val) => _updatePrice(v, val),
                            ),
                        ],
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(top: BorderSide(color: Color(0xFFF3F4F6))),
                    ),
                    child: Column(
                      children: [
                        if (_pricingAlert != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              _pricingAlert!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$_totalModalItems ${_totalModalItems == 1 ? 'prenda' : 'prendas'}',
                              style: const TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'S/ ${_totalModalPrice.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: FilledButton.icon(
                            onPressed: _totalModalItems == 0
                                ? null
                                : () => _confirm(product, modal.isEditing),
                            icon: const Icon(Icons.check),
                            label: Text(
                              modal.isEditing
                                  ? 'GUARDAR CAMBIOS'
                                  : 'AGREGAR AL CARRITO',
                            ),
                            style: FilledButton.styleFrom(
                              backgroundColor: primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _VariantTile extends StatelessWidget {
  const _VariantTile({
    required this.variant,
    required this.stock,
    required this.qty,
    required this.price,
    required this.onTap,
    required this.onQtyDelta,
    required this.onPriceChanged,
  });

  final Variant variant;
  final int stock;
  final int qty;
  final double price;
  final VoidCallback onTap;
  final ValueChanged<int> onQtyDelta;
  final ValueChanged<String> onPriceChanged;

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF1565C0);
    final outOfStock = stock <= 0;
    final selected = qty > 0;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: selected
            ? primary.withValues(alpha: 0.06)
            : outOfStock
                ? Colors.grey[100]
                : Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: outOfStock ? null : onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: selected ? primary : const Color(0xFFE5E7EB),
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: _parseColor(variant.hex),
                  child: selected
                      ? const Icon(Icons.check, size: 16, color: Colors.white)
                      : null,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    variant.colorName,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: outOfStock ? Colors.grey : null,
                    ),
                  ),
                ),
                if (selected)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 72,
                        child: TextField(
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          decoration: const InputDecoration(
                            isDense: true,
                            prefixText: 'S/ ',
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 8,
                            ),
                          ),
                          controller: TextEditingController(
                            text: price.toStringAsFixed(2),
                          ),
                          onChanged: onPriceChanged,
                        ),
                      ),
                      const SizedBox(width: 8),
                      _QtyStepper(
                        qty: qty,
                        onMinus: () => onQtyDelta(-1),
                        onPlus: () => onQtyDelta(1),
                      ),
                    ],
                  )
                else if (!outOfStock)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'S/ ${variant.price.toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Toca para agregar',
                        style: TextStyle(fontSize: 10, color: Colors.grey[500]),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
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

extension _IterableFirstOrNull<E> on Iterable<E> {
  E? get firstOrNull {
    final it = iterator;
    return it.moveNext() ? it.current : null;
  }
}
