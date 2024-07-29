import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../domain/entities/auth.dart';
import '../../domain/repositories/auth_repository.dart';
import '../bloc/login_bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginBloc = LoginBloc(
      GetIt.I<AuthRepository>(),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: StreamBuilder<Auth>(
        stream: loginBloc.loginResultStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final auth = snapshot.data;
            return Center(child: Text('Logged in successfully! Token: ${auth?.token}'));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    loginBloc.login(); // Trigger login process
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}