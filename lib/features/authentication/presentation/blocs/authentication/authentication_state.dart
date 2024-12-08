part of 'authentication_bloc.dart';

/// Represents the state of the authentication bloc
class AuthenticationState extends Equatable {
  /// Creates a new instance of [AuthenticationState]
  const AuthenticationState({
    this.authProgressStatus = RequestProgressStatus.nothing,
  });

  /// Creates a new instance of [AuthenticationState] with the given [authProgressStatus]
  final RequestProgressStatus authProgressStatus;

  /// Creates a new [AuthenticationState] instance with updated properties
  AuthenticationState copyWith({
    RequestProgressStatus? authProgressStatus,
  }) =>
      AuthenticationState(
        authProgressStatus: authProgressStatus ?? this.authProgressStatus,
      );

  @override
  List<Object> get props => [
        authProgressStatus,
      ];
}
