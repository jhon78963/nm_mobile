import 'package:nm_mobile/features/auth/data/auth_data_providers.dart';
import 'package:nm_mobile/features/auth/presentation/notifiers/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() => const AuthState.initial();

  Future<void> login(String username, String password) async {
    state = const AuthState.loading();
    try {
      final user = await ref
          .read(authRepositoryProvider)
          .login(username, password);
      state = AuthState.authenticated(user);
    } on Exception catch (e) {
      final message = e.toString().replaceFirst('Exception: ', '');
      state = AuthState.failure(message);
    } catch (_) {
      state = const AuthState.failure('Error inesperado. Intenta nuevamente.');
    }
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).logout();
    state = const AuthState.unauthenticated();
  }
}
