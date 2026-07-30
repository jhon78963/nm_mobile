import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nm_mobile/core/routing/app_routes.dart';
import 'package:nm_mobile/core/network/unauthorized_handler.dart';
import 'package:nm_mobile/features/auth/presentation/notifiers/auth_notifier.dart';
import 'package:nm_mobile/features/auth/presentation/notifiers/auth_state.dart';
import 'package:nm_mobile/features/auth/presentation/pages/auth_splash_page.dart';
import 'package:nm_mobile/features/auth/presentation/pages/login_page.dart';
import 'package:nm_mobile/features/cash_movements/presentation/pages/cash_register_page.dart';
import 'package:nm_mobile/features/pos/presentation/pages/pos_page.dart';
import 'package:nm_mobile/features/sales/presentation/pages/sales_list_page.dart';
import 'package:nm_mobile/features/shell/presentation/pages/app_shell_page.dart';
import 'package:nm_mobile/features/shell/presentation/utils/shell_nav_util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

class _AuthRefreshListenable extends ChangeNotifier {
  _AuthRefreshListenable(this._ref) {
    _ref.listen(authNotifierProvider, (prev, next) {
      // Only refresh when the auth status meaningfully changes to avoid
      // spurious redirects from transient loading states during tab switches.
      final wasStable = prev?.maybeMap(
            loading: (_) => false,
            orElse: () => true,
          ) ??
          false;
      final isStable = next.maybeMap(
        loading: (_) => false,
        orElse: () => true,
      );
      if (wasStable || isStable) notifyListeners();
    });
  }

  final Ref _ref;
}

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final refreshListenable = _AuthRefreshListenable(ref);

  final router = GoRouter(
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
          return routePermissionRedirect(authenticated.user, location);
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
              child: PosPage(),
            ),
          ),
          GoRoute(
            path: AppRoutes.sales,
            name: 'sales',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SalesListPage(),
            ),
          ),
          GoRoute(
            path: AppRoutes.cashMovements,
            name: 'cash-movements',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: CashRegisterPage(),
            ),
          ),
        ],
      ),
    ],
  );

  UnauthorizedHandler.onUnauthorized = () async {
    // Calling logout() changes auth state → unauthenticated.
    // The refreshListenable picks that up and triggers the redirect to /login
    // automatically — no need for an explicit router.go() here, which could
    // race with an in-flight GoRouter navigation (e.g. a tab switch).
    await ref.read(authNotifierProvider.notifier).logout();
  };

  ref.onDispose(() {
    if (UnauthorizedHandler.onUnauthorized != null) {
      UnauthorizedHandler.onUnauthorized = null;
    }
  });

  return router;
}
