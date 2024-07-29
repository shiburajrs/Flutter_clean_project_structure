import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/injection.dart';
import 'package:flutter_clean_architecture/presentation/screens/login_page.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/user_repository_impl.dart';
import 'data/sources/services/auth_services/auth_services.dart';
import 'domain/repositories/auth_repository.dart';

final GetIt sl = GetIt.instance;


void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}