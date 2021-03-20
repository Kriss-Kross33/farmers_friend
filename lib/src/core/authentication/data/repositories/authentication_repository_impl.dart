import 'dart:async';

import 'package:farmers_friend/src/core/authentication/bloc/authentication_bloc.dart';
import 'package:farmers_friend/src/core/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  @override
  Stream<AuthenticationStatus> get status async* {
    await Future.delayed(Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  @override
  void dispose() {
    _controller.close();
  }

  @override
  Future<void> login({String name, String password}) async {
    await Future.delayed(Duration(seconds: 2));
    _controller.add(AuthenticationStatus.authenticated);
  }

  @override
  void logout() async {
    await Future.delayed(Duration(seconds: 1));
    _controller.add(AuthenticationStatus.unauthenticated);
  }
}
