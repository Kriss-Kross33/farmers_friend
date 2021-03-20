part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final User user;
  final AuthenticationStatus status;

  /// Occurs when the [User] is authenticated
  const AuthenticationState.authenticated({User user})
      : this._(user: user, status: AuthenticationStatus.authenticated);

  /// Occurs when the [User] is unauthenticated
  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  /// Occurs when the [AuthenticationStatus] of the [User] is unknown
  const AuthenticationState.unknown() : this._();

  const AuthenticationState._({
    this.user = User.empty,
    this.status = AuthenticationStatus.unknown,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        user,
        status,
      ];
}

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  unknown,
}
