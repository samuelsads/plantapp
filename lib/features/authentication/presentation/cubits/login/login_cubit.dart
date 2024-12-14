import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

/// Cubit for login
class LoginCubit extends Cubit<LoginCubitState> {
  /// Constructor for LoginCubit
  LoginCubit() : super(const LoginCubitState());

  /// Update the state with the provided email
  void onEmailChanged(String email) {
    emit(state.copyWith(
      email: email,
      emailError: '',
    ));
  }

  /// Updates the state with the provided password.
  void onPasswordChanged(String password) {
    emit(state.copyWith(
      password: password,
      passwordError: '',
    ));
  }

  /// Toggles the visibility of the password.
  void toggleHidePassword() {
    emit(state.copyWith(
      hidePassword: !state.hidePassword,
    ));
  }
}
