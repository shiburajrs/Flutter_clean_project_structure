import '../../domain/entities/auth.dart';
import '../../domain/repositories/auth_repository.dart';
import '../sources/services/auth_services/auth_services.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImpl({required this.authService});

  @override
  Future<Auth> authenticate(String username, String password) async {
    final response = await authService.login(username, password);
    return Auth.fromJson(response);
  }

  @override
  Future<void> refreshToken(String refreshToken) async {
    await authService.refreshToken(refreshToken);
  }
}
