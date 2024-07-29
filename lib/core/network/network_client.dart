import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class NetworkClient {
  final Dio _dio;

  NetworkClient()
      : _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com/auth/',
      connectTimeout: const Duration(seconds: 1000),
      receiveTimeout: const Duration(seconds: 1000),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  ) {
    // Add interceptors
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Print request method, URI, headers, and params
        print('Request: ${options.method} ${options.uri}');
        print('Headers: ${options.headers}');
        if (options.queryParameters.isNotEmpty) {
          print('Query Parameters: ${options.queryParameters}');
        }
        if (options.data != null) {
          print('Request Body: ${options.data}');
        }

        // Optionally add a signature or other custom headers here
        // Example:
        // options.headers['Signature'] = generateSignature(options);

        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Print response status and URI
        print('Response: ${response.statusCode} ${response.requestOptions.uri}');
        print('Response Data: ${response.data}');
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        // Print error details
        print('Error: ${e.message}');
        if (e.response != null) {
          print('Error Response: ${e.response?.statusCode} ${e.response?.requestOptions.uri}');
          print('Error Response Data: ${e.response?.data}');
        }
        return handler.next(e);
      },
    ));

    // Configure Dio for specific needs
    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient()
        ..idleTimeout = Duration(seconds: 15);
      return client;
    };
  }

  Dio get dio => _dio;

  // Add methods for various types of requests
  Future<Response<T>> get<T>(String path, {Map<String, dynamic>? queryParameters}) async {
    return _dio.get<T>(path, queryParameters: queryParameters);
  }

  Future<Response<T>> post<T>(String path, {dynamic data, Options? options}) async {
    return _dio.post<T>(path, data: data, options: options);
  }

  Future<Response<T>> put<T>(String path, {dynamic data, Options? options}) async {
    return _dio.put<T>(path, data: data, options: options);
  }

  Future<Response<T>> delete<T>(String path, {dynamic data, Options? options}) async {
    return _dio.delete<T>(path, data: data, options: options);
  }

  // Example method for file uploading
  Future<Response<T>> uploadFile<T>(String path, FormData formData) async {
    return _dio.post<T>(path, data: formData);
  }

// Example method for generating a signature (if needed)
// String generateSignature(RequestOptions options) {
//   // Implement signature generation logic here
//   return 'your_signature';
// }
}
