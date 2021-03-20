import 'package:farmers_friend/src/core/authentication/bloc/authentication_bloc.dart';
import 'package:farmers_friend/src/core/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:farmers_friend/src/core/authentication/data/repositories/user_repository_impl.dart';
import 'package:farmers_friend/src/core/authentication/domain/repositories/authentication_repository.dart';
import 'package:farmers_friend/src/core/authentication/domain/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';

/// Global variable that locates objects registered with GetIt service
/// locator.
GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  //! Bloc
  locator.registerLazySingleton<AuthenticationBloc>(() => AuthenticationBloc(
      authenticationRepository: locator(), userRepository: locator()));

  //! Usecases

  //! Repositories
  locator.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl());
  locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(locator()));
  //! Data Sources

  //! Core
}
