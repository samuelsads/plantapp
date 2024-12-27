import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/l10n/app_localizations.dart';
import 'package:plant_app/utils/helpers/validator_helper.dart';

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

  /// Method used to validate the login form.
  bool validate({required AppLocalizations appLocalizations}) {
    bool isValid = true;

    final validateEmail = validatorHelper(
        value: state.email,
        appLocalizations: appLocalizations,
        required: true,
        email: true);
    if (validateEmail != null) {
      emit(state.copyWith(emailError: validateEmail));
      isValid = false;
    } else {
      emit(state.copyWith(emailError: ''));
    }

    final validatePassword = validatorHelper(
        value: state.password,
        appLocalizations: appLocalizations,
        required: true,
        password: true);
    if (validatePassword != null) {
      emit(state.copyWith(passwordError: validatePassword));
      isValid = false;
    } else {
      emit(state.copyWith(passwordError: ''));
    }

    return isValid ? true : false;
  }
}
