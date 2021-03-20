import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:farmers_friend/src/core/authentication/domain/entities/user.dart';
import 'package:farmers_friend/src/core/authentication/domain/repositories/authentication_repository.dart';
import 'package:farmers_friend/src/core/authentication/domain/repositories/user_repository.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  StreamSubscription<AuthenticationStatus> _authenticationStreamSubscription;

  AuthenticationBloc({
    @required AuthenticationRepository authenticationRepository,
    @required UserRepository userRepository,
  })  : assert(authenticationRepository != null,
            'AuthenticationRepository should not be null'),
        assert(userRepository != null, 'UserRepository should not be null'),
        _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(AuthenticationState.unknown()) {
    _authenticationStreamSubscription = _authenticationRepository.status
        .listen((status) => AuthenticationStatusChangedEvent(status: status));
  }

  @override
  Future<void> close() async {
    _authenticationStreamSubscription.cancel();
    _authenticationRepository.dispose();
    super.close();
  }

  Future<User> getUser() async {
    try {
      final user = await _userRepository.getUser();
      return user;
    } catch (e) {
      return null;
    }
  }

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationStatusChangedEvent) {
      yield* _mapAuthenticationStatusChangedEventToState(event);
    } else if (event is AuthenticationLogoutRequestedEvent) {
      _authenticationRepository.logout();
    }
  }

  Stream<AuthenticationState> _mapAuthenticationStatusChangedEventToState(
      AuthenticationStatusChangedEvent event) async* {
    switch (event.status) {
      case AuthenticationStatus.authenticated:
        final user = await getUser();
        yield (user != null || user != User.empty)
            ? AuthenticationState.authenticated(user: user)
            : AuthenticationState.unauthenticated();
        break;
      case AuthenticationStatus.unauthenticated:
        yield AuthenticationState.unauthenticated();
        break;
      default:
        yield AuthenticationState.unknown();
        break;
    }
  }
}
