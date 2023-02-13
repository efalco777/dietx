import 'package:dietx/app/model/auth/auth_status.dart';

abstract class AuthUseCase {
  Stream<AuthStatus> onAuthChanged();

  Future<void> login({required String email, required String password});

  Future<void> register({required String email, required String password});

  Future<void> logout();
}
