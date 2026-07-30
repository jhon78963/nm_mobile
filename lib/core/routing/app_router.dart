import 'package:go_router/go_router.dart';
import 'package:nm_mobile/features/auth/presentation/pages/login_page.dart';

abstract final class AppRouter {
  static const String loginPath = '/login';

  static final GoRouter router = GoRouter(
    initialLocation: loginPath,
    routes: [
      GoRoute(
        path: loginPath,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );
}
