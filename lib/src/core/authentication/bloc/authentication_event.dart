part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

/// Notiies the [Bloc] that the [User] has requested to logout.
class AuthenticationLogoutRequestedEvent extends AuthenticationEvent {}

/// Notifies the [Bloc] that the [AuthenticationStatus] has changed
class AuthenticationStatusChangedEvent extends AuthenticationEvent {
  final AuthenticationStatus status;

  AuthenticationStatusChangedEvent({this.status}) : assert(status != null);

  @override
  List<Object> get props => [status];
}
