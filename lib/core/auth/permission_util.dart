import 'package:nm_mobile/features/auth/domain/entities/user.dart';

const superAdminRole = 'Super Admin';

bool isSuperAdmin(User? user) {
  if (user == null) return false;
  if (user.role == superAdminRole) return true;
  return user.roles.contains(superAdminRole);
}

bool userHasPermission(User? user, String permission) {
  if (isSuperAdmin(user)) return true;
  return user?.permissions.contains(permission) ?? false;
}

bool userHasAnyPermission(User? user, List<String> required) {
  if (required.isEmpty) return true;
  if (isSuperAdmin(user)) return true;
  final granted = user?.permissions.toSet() ?? {};
  return required.any(granted.contains);
}
