import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nm_mobile/core/routing/app_routes.dart';
import 'package:nm_mobile/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:nm_mobile/features/auth/presentation/notifiers/auth_state.dart';
import 'package:nm_mobile/features/auth/presentation/pages/auth_splash_page.dart';
import 'package:nm_mobile/features/auth/presentation/pages/login_page.dart';
import 'package:nm_mobile/features/finances/presentation/pages/finance_placeholder_page.dart';
import 'package:nm_mobile/features/shell/presentation/pages/app_shell_page.dart';
import 'package:nm_mobile/features/shell/presentation/utils/shell_nav_util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

class _AuthRefreshListenable extends ChangeNotifier {
  _AuthRefreshListenable(this._ref) {
    _ref.listen(authNotifierProvider, (_, _) => notifyListeners());
  }

  final Ref _ref;
}

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final refreshListenable = _AuthRefreshListenable(ref);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: refreshListenable,
    redirect: (context, state) {
      final authState = ref.read(authNotifierProvider);
      final location = state.matchedLocation;

      return authState.map(
        sessionLoading: (_) =>
            location == AppRoutes.splash ? null : AppRoutes.splash,
        initial: (_) =>
            location == AppRoutes.splash ? null : AppRoutes.splash,
        loading: (_) => null,
        authenticated: (authenticated) {
          if (location == AppRoutes.login || location == AppRoutes.splash) {
            return defaultAuthenticatedRoute(authenticated.user);
          }
          return null;
        },
        unauthenticated: (_) =>
            location == AppRoutes.login ? null : AppRoutes.login,
        failure: (_) => location == AppRoutes.login ? null : AppRoutes.login,
      );
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const AuthSplashPage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      ShellRoute(
        builder: (context, state, child) => AppShellPage(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.pos,
            name: 'pos',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: FinancePlaceholderPage(
                title: 'Punto de Venta',
                subtitle: 'Módulo POS — próximamente.',
                icon: Icons.point_of_sale_outlined,
              ),
            ),
          ),
          GoRoute(
            path: AppRoutes.sales,
            name: 'sales',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: FinancePlaceholderPage(
                title: 'Ventas',
                subtitle: 'Historial de ventas — próximamente.',
                icon: Icons.receipt_long_outlined,
              ),
            ),
          ),
          GoRoute(
            path: AppRoutes.cashMovements,
            name: 'cash-movements',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: FinancePlaceholderPage(
                title: 'Control de Caja',
                subtitle: 'Movimientos diarios — próximamente.',
                icon: Icons.account_balance_wallet_outlined,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
