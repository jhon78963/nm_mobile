import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nm_mobile/features/pos/presentation/notifiers/pos_notifier.dart';

class PosCustomerHeader extends ConsumerStatefulWidget {
  const PosCustomerHeader({super.key});

  @override
  ConsumerState<PosCustomerHeader> createState() => _PosCustomerHeaderState();
}

class _PosCustomerHeaderState extends ConsumerState<PosCustomerHeader> {
  final _dniController = TextEditingController();
  var _isSearching = false;

  @override
  void dispose() {
    _dniController.dispose();
    super.dispose();
  }

  Future<void> _search() async {
    final dni = _dniController.text.trim();
    if (dni.isEmpty || _isSearching) return;
    setState(() => _isSearching = true);
    await ref.read(posNotifierProvider.notifier).searchCustomerByDni(dni);
    if (mounted) setState(() => _isSearching = false);
  }

  @override
  Widget build(BuildContext context) {
    final customer = ref.watch(posNotifierProvider).customer;
    const primary = Color(0xFF1565C0);

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFF3F4F6))),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _dniController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'DNI / RUC del cliente…',
                    prefixIcon: const Icon(Icons.person_outline, size: 20),
                    filled: true,
                    fillColor: const Color(0xFFF9FAFB),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                    ),
                  ),
                  onSubmitted: (_) => _search(),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 44,
                height: 44,
                child: FilledButton(
                  onPressed: _isSearching || _dniController.text.trim().isEmpty
                      ? null
                      : _search,
                  style: FilledButton.styleFrom(
                    backgroundColor: primary,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isSearching
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.search, size: 20),
                ),
              ),
            ],
          ),
          if (customer != null) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFECFDF5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFA7F3D0)),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 14,
                    backgroundColor: Color(0xFF059669),
                    child: Icon(Icons.check, size: 16, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          customer.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Color(0xFF065F46),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${customer.documentType ?? 'DNI'}: ${customer.dni}',
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF059669),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, size: 18),
                    color: const Color(0xFF059669),
                    onPressed: () {
                      ref.read(posNotifierProvider.notifier).clearCustomer();
                      _dniController.clear();
                    },
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
