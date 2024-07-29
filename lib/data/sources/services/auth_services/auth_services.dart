import 'package:dio/dio.dart';

class AuthService {
  final Dio dio;

  AuthService({required this.dio});

  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await dio.post(
      '/login',
      data: {
        'username': username,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to authenticate');
    }
  }

  Future<void> refreshToken(String refreshToken) async {
    final response = await dio.post(
      '/refresh-token',
      data: {
        'refresh_token': refreshToken,
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to refresh token');
    }
  }
}
