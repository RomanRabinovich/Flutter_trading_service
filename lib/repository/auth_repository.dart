import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tplatfom/services/auth_service.dart';

class AuthRepository {
  final AuthService _authService;
  AuthRepository(this._authService);

  Future<String> login(String email, String password) async {
    return _authService.login(email, password);
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.read(authServiceProvider));
});