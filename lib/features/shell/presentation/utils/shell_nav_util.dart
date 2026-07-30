import 'package:nm_mobile/core/auth/permission_util.dart';
import 'package:nm_mobile/core/routing/app_routes.dart';
import 'package:nm_mobile/features/auth/domain/entities/user.dart';
import 'package:nm_mobile/features/shell/presentation/models/shell_nav_item.dart';

bool canAccessRoute(User? user, String route) {
  for (final item in ShellNavItem.financesItems) {
    if (item.route == route) return _canSeeNavItem(user, item);
  }
  return true;
}

/// Redirects to the first allowed route when the user lacks permission.
String? routePermissionRedirect(User user, String location) {
  if (canAccessRoute(user, location)) return null;
  return defaultAuthenticatedRoute(user);
}

List<ShellNavItem> visibleNavItems(User? user) {
  return ShellNavItem.financesItems
      .where((item) => _canSeeNavItem(user, item))
      .toList();
}

String defaultAuthenticatedRoute(User user) {
  // POS sigue siendo la pantalla inicial aunque el menú sea Ventas → POS → Caja.
  if (userHasPermission(user, 'pos.checkout')) return AppRoutes.pos;
  if (userHasAnyPermission(user, ['sale.getAll', 'sale.get'])) {
    return AppRoutes.sales;
  }
  if (userHasPermission(user, 'cashflow.getDaily')) {
    return AppRoutes.cashMovements;
  }

  final items = visibleNavItems(user);
  if (items.isNotEmpty) return items.first.route;

  return AppRoutes.pos;
}

bool _canSeeNavItem(User? user, ShellNavItem item) {
  if (item.permission != null) {
    return userHasPermission(user, item.permission!);
  }
  if (item.permissions.isNotEmpty) {
    return userHasAnyPermission(user, item.permissions);
  }
  return true;
}
