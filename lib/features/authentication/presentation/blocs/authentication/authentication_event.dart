part of 'authentication_bloc.dart';

///Events for authentication bloc
sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

///Event for login with firebase
class LoginWithFirebaseEvent extends AuthenticationEvent {
  ///Constructor for LoginWithFirebaseEvent
  const LoginWithFirebaseEvent({
    required this.request,
  });

  ///The request model for login
  final LoginModelRequest request;

  @override
  List<Object?> get props => [request];
}
