import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nm_mobile/features/auth/domain/entities/user.dart';
import 'package:nm_mobile/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:nm_mobile/features/auth/presentation/notifiers/auth_state.dart';
import 'package:nm_mobile/features/shell/presentation/models/shell_nav_item.dart';
import 'package:nm_mobile/features/shell/presentation/utils/shell_nav_util.dart';

const double _kTabletBreakpoint = 600;

class AppShellPage extends ConsumerWidget {
  const AppShellPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final user = authState.maybeMap(
      authenticated: (state) => state.user,
      orElse: () => null,
    );

    if (user == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final navItems = visibleNavItems(user);
    final location = GoRouterState.of(context).uri.path;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= _kTabletBreakpoint) {
          return _TabletShell(
            user: user,
            navItems: navItems,
            currentPath: location,
            child: child,
            onLogout: () => _logout(ref, context),
          );
        }

        return _MobileShell(
          user: user,
          navItems: navItems,
          currentPath: location,
          child: child,
          onLogout: () => _logout(ref, context),
        );
      },
    );
  }

  Future<void> _logout(WidgetRef ref, BuildContext context) async {
    await ref.read(authNotifierProvider.notifier).logout();
    if (context.mounted) context.go('/login');
  }
}

class _MobileShell extends StatelessWidget {
  const _MobileShell({
    required this.user,
    required this.navItems,
    required this.currentPath,
    required this.child,
    required this.onLogout,
  });

  final User user;
  final List<ShellNavItem> navItems;
  final String currentPath;
  final Widget child;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _selectedIndex(navItems, currentPath);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Novedades Maritex'),
        actions: [
          _UserMenuButton(user: user, onLogout: onLogout),
        ],
      ),
      body: child,
      bottomNavigationBar: navItems.isEmpty
          ? null
          : NavigationBar(
              selectedIndex: selectedIndex.clamp(0, navItems.length - 1),
              onDestinationSelected: (index) {
                context.go(navItems[index].route);
              },
              destinations: [
                for (final item in navItems)
                  NavigationDestination(
                    icon: Icon(item.icon),
                    label: item.label,
                  ),
              ],
            ),
    );
  }
}

class _TabletShell extends StatelessWidget {
  const _TabletShell({
    required this.user,
    required this.navItems,
    required this.currentPath,
    required this.child,
    required this.onLogout,
  });

  final User user;
  final List<ShellNavItem> navItems;
  final String currentPath;
  final Widget child;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 240,
            child: Material(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 28, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Novedades',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            letterSpacing: 1.5,
                          ),
                        ),
                        Text(
                          'MARITEX',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1565C0),
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'ERP & POS',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: Text(
                            'FINANZAS',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        for (final item in navItems)
                          _SidebarTile(
                            item: item,
                            selected: currentPath == item.route,
                            onTap: () => context.go(item.route),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const VerticalDivider(width: 1),
          Expanded(
            child: Column(
              children: [
                Material(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            _pageTitle(currentPath),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        _UserMenuButton(user: user, onLogout: onLogout),
                      ],
                    ),
                  ),
                ),
                const Divider(height: 1),
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarTile extends StatelessWidget {
  const _SidebarTile({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final ShellNavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: ListTile(
        leading: Icon(
          item.icon,
          color: selected ? const Color(0xFF1565C0) : Colors.grey[700],
        ),
        title: Text(
          item.label,
          style: TextStyle(
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
            color: selected ? const Color(0xFF1565C0) : Colors.grey[800],
          ),
        ),
        selected: selected,
        selectedTileColor: const Color(0xFF1565C0).withValues(alpha: 0.08),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onTap: onTap,
      ),
    );
  }
}

class _UserMenuButton extends StatelessWidget {
  const _UserMenuButton({required this.user, required this.onLogout});

  final User user;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    final initials =
        '${user.name.isNotEmpty ? user.name[0] : ''}${user.surname.isNotEmpty ? user.surname[0] : ''}'
            .toUpperCase();

    return PopupMenuButton<String>(
      tooltip: 'Menú de usuario',
      onSelected: (value) {
        if (value == 'logout') onLogout();
      },
      itemBuilder: (context) => [
        PopupMenuItem<String>(
          enabled: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${user.name} ${user.surname}'.trim(),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              if (user.role.isNotEmpty)
                Text(user.role, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem(
          value: 'logout',
          child: Row(
            children: [
              Icon(Icons.logout, size: 18),
              SizedBox(width: 8),
              Text('Cerrar sesión'),
            ],
          ),
        ),
      ],
      child: CircleAvatar(
        backgroundColor: const Color(0xFF1565C0),
        child: Text(
          initials.isEmpty ? 'U' : initials,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

int _selectedIndex(List<ShellNavItem> items, String path) {
  final index = items.indexWhere((item) => item.route == path);
  return index >= 0 ? index : 0;
}

String _pageTitle(String path) {
  return switch (path) {
    '/finances/pos' => 'Punto de Venta',
    '/finances/sales' => 'Ventas',
    '/finances/cash-movements' => 'Control de Caja',
    _ => 'Novedades Maritex',
  };
}
