part of 'authentication_bloc.dart';

/// Represents the state of the authentication bloc
class AuthenticationState extends Equatable {
  /// Creates a new instance of [AuthenticationState]
  const AuthenticationState({
    this.authProgressStatus = RequestProgressStatus.nothing,
    this.isAuthenticated = false,
    this.verifyAuthState = RequestProgressStatus.nothing,
    this.verifyErrorMessage = '',
  });

  /// Creates a new instance of [AuthenticationState] with the given [authProgressStatus]
  final RequestProgressStatus authProgressStatus;

  /// Creates a new instance of [AuthenticationState] with the given [isAuthenticated]
  final bool isAuthenticated;

  /// Creates a new instance of [AuthenticationState] with the given [verifyAuthState]
  final RequestProgressStatus verifyAuthState;

  ///The error message for verify authentication state
  final String verifyErrorMessage;

  /// Creates a new [AuthenticationState] instance with updated properties
  AuthenticationState copyWith({
    RequestProgressStatus? authProgressStatus,
    bool? isAuthenticated,
    RequestProgressStatus? verifyAuthState,
    String? verifyErrorMessage,
  }) =>
      AuthenticationState(
        authProgressStatus: authProgressStatus ?? this.authProgressStatus,
        isAuthenticated: isAuthenticated ?? this.isAuthenticated,
        verifyAuthState: verifyAuthState ?? this.verifyAuthState,
        verifyErrorMessage: verifyErrorMessage ?? this.verifyErrorMessage,
      );

  @override
  List<Object> get props => [
        authProgressStatus,
        isAuthenticated,
        verifyAuthState,
        verifyErrorMessage
      ];
}
