import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:plant_app/core/domain/usecases/usecase.dart';
import 'package:plant_app/core/errors/failures.dart';
import 'package:plant_app/features/authentication/data/models/request/login_model_request.dart';
import 'package:plant_app/features/authentication/domain/entities/user_credencial.dart';
import 'package:plant_app/features/authentication/domain/repositories/auth_repository.dart';

///Use case for login with firebase
class LoginWithFirebase implements UseCase<UserCredencial, Params> {
  ///Constructor for LoginWithFirebase
  const LoginWithFirebase({required this.repository});

  ///The repository for authentication
  final AuthRepository repository;

  @override
  Future<Either<Failure, UserCredencial>> call(Params params) =>
      repository.login(request: params.request);
}

///Params for LoginWithFirebase usecase
class Params extends Equatable {
  ///Constructor for Params
  const Params({required this.request});

  ///The request model for login
  final LoginModelRequest request;

  @override
  List<Object?> get props => [request];
}
