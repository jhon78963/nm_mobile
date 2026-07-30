import 'package:flutter/material.dart';

class ShellNavItem {
  const ShellNavItem({
    required this.label,
    required this.route,
    required this.icon,
    this.permission,
    this.permissions = const [],
  });

  final String label;
  final String route;
  final IconData icon;
  final String? permission;
  final List<String> permissions;

  static const financesItems = [
    ShellNavItem(
      label: 'POS',
      route: '/finances/pos',
      icon: Icons.point_of_sale_outlined,
      permission: 'pos.checkout',
    ),
    ShellNavItem(
      label: 'Ventas',
      route: '/finances/sales',
      icon: Icons.receipt_long_outlined,
      permissions: ['sale.getAll', 'sale.get'],
    ),
    ShellNavItem(
      label: 'Caja',
      route: '/finances/cash-movements',
      icon: Icons.account_balance_wallet_outlined,
      permission: 'cashflow.getDaily',
    ),
  ];
}
