import 'package:farmers_friend/src/core/authentication/bloc/authentication_bloc.dart';

abstract class AuthenticationRepository {
  Stream<AuthenticationStatus> get status;

  void dispose();

  Future<void> login({String name, String password});

  void logout();
}
