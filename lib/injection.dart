

import 'package:get_it/get_it.dart';

import 'core/network/network_client.dart';
import 'data/repositories/user_repository_impl.dart';
import 'data/sources/services/auth_services/auth_services.dart';
import 'domain/repositories/auth_repository.dart';

final getIt = GetIt.instance;

void setup() {
  // Register NetworkClient
  getIt.registerLazySingleton<NetworkClient>(() => NetworkClient());

  // Register AuthService with the NetworkClient
  getIt.registerLazySingleton<AuthService>(
        () => AuthService(dio: getIt<NetworkClient>().dio),
  );

  // Register AuthRepository with AuthService
  getIt.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(authService: getIt<AuthService>()),
  );
}
