import 'dart:async';

import '../../../domain/entities/auth.dart';
import '../../../domain/repositories/auth_repository.dart';

class LoginBloc {
  final AuthRepository authRepository;

  // Stream controllers for login requests and results
  final _loginController = StreamController<void>();
  final _resultController = StreamController<Auth>();

  // Stream for login results
  Stream<Auth> get loginResultStream => _resultController.stream;

  LoginBloc(this.authRepository) {
    // Listen to the login requests and process them
    _loginController.stream.listen((_) async {
      // Get credentials from somewhere (e.g., UI, form inputs)
      // For simplicity, hardcoded values are used here.
      const username = 'emilys';
      const password = 'emilyspass';

      try {
        final auth = await authRepository.authenticate(username, password);
        _resultController.add(auth); // Emit successful login with Auth model
      } catch (e) {
        // Handle the error and optionally, emit a special failure value
        print('Error: $e'); // Log the error
        // If you need to emit an error state, you could define a special value or exception
        _resultController.addError('Authentication failed');
      }
    });
  }

  // Method to trigger login process
  void login() {
    _loginController.add(null); // Trigger login process
  }

  // Dispose controllers to avoid memory leaks
  void dispose() {
    _loginController.close();
    _resultController.close();
  }
}