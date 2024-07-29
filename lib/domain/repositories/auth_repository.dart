import '../entities/auth.dart';

abstract class AuthRepository {
  Future<Auth> authenticate(String username, String password);
  Future<void> refreshToken(String refreshToken);
}