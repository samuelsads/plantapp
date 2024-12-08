import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/features/authentication/data/models/request/login_model_request.dart';
import 'package:plant_app/features/authentication/domain/usecases/login_with_firebase.dart'
    as login_with_firebase;
import 'package:plant_app/utils/enums/request_progress_status.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

/// Bloc for authentication
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  /// Constructor for AuthenticationBloc

  AuthenticationBloc({
    required login_with_firebase.LoginWithFirebase loginWithFirebase,
  })  : _loginWithFirebase = loginWithFirebase,
        super(const AuthenticationState()) {
    on<LoginWithFirebaseEvent>(_onLoginWithFirebase);
  }

  final login_with_firebase.LoginWithFirebase _loginWithFirebase;

  Future<void> _onLoginWithFirebase(
      LoginWithFirebaseEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(authProgressStatus: RequestProgressStatus.loading));
    final response = await _loginWithFirebase
        .call(login_with_firebase.Params(request: event.request));
    response.fold(
      (failure) =>
          emit(state.copyWith(authProgressStatus: RequestProgressStatus.error)),
      (userCredential) => emit(
          state.copyWith(authProgressStatus: RequestProgressStatus.success)),
    );
  }
}
