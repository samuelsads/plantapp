import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/core/domain/usecases/usecase.dart';
import 'package:plant_app/features/authentication/data/models/request/login_model_request.dart';
import 'package:plant_app/features/authentication/domain/usecases/login_with_firebase.dart'
    as login_with_firebase;
import 'package:plant_app/features/authentication/domain/usecases/verify_authentication_firebase.dart'
    as verify_auth_state;
import 'package:plant_app/utils/enums/request_progress_status.dart';
import 'package:plant_app/utils/helpers/failure_helper.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

/// Bloc for authentication
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  /// Constructor for AuthenticationBloc

  AuthenticationBloc({
    required login_with_firebase.LoginWithFirebase loginWithFirebase,
    required verify_auth_state.VerifyAuthenticationFirebase verifyAuthState,
  })  : _loginWithFirebase = loginWithFirebase,
        _verifyAuthState = verifyAuthState,
        super(const AuthenticationState()) {
    on<LoginWithFirebaseEvent>(_onLoginWithFirebase);
    on<VerifyAuthStateEvent>(_onVerifyAuthState);
  }

  final login_with_firebase.LoginWithFirebase _loginWithFirebase;
  final verify_auth_state.VerifyAuthenticationFirebase _verifyAuthState;

  Future<void> _onVerifyAuthState(
      VerifyAuthStateEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(verifyAuthState: RequestProgressStatus.loading));
    final response = await _verifyAuthState(NoParams());
    response.fold(
      (failure) => emit(state.copyWith(
          verifyAuthState: RequestProgressStatus.error,
          verifyErrorMessage: mapFailureToMessage(failure))),
      (status) {
        emit(state.copyWith(
            verifyAuthState: RequestProgressStatus.success,
            isAuthenticated: status));
      },
    );
  }

  Future<void> _onLoginWithFirebase(
      LoginWithFirebaseEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(authProgressStatus: RequestProgressStatus.loading));
    final response = await _loginWithFirebase(
        login_with_firebase.Params(request: event.request));
    response.fold(
      (failure) => emit(state.copyWith(
          authProgressStatus: RequestProgressStatus.error,
          verifyErrorMessage: mapFailureToMessage(failure))),
      (userCredential) => emit(
          state.copyWith(authProgressStatus: RequestProgressStatus.success)),
    );
  }
}
