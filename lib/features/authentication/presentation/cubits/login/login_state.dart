part of 'login_cubit.dart';

/// State of the login cubit
class LoginCubitState extends Equatable {
  /// Constructor for LoginCubitState
  const LoginCubitState({
    this.email = '',
    this.emailError = '',
    this.password = '',
    this.passwordError = '',
    this.hidePassword = true,
  });

  /// The email to login form field
  final String email;

  /// The email error to login form field
  final String emailError;

  /// The password to login form field
  final String password;

  /// The error message to login form field
  final String passwordError;

  /// The hide show password to login form field
  final bool hidePassword;

  /// Copy with for LoginCubitState
  LoginCubitState copyWith({
    String? email,
    String? emailError,
    String? password,
    String? passwordError,
    bool? hidePassword,
  }) =>
      LoginCubitState(
        email: email ?? this.email,
        emailError: emailError ?? this.emailError,
        password: password ?? this.password,
        passwordError: passwordError ?? this.passwordError,
        hidePassword: hidePassword ?? this.hidePassword,
      );

  @override
  List<Object> get props => [
        email,
        emailError,
        password,
        passwordError,
        hidePassword,
      ];
}
