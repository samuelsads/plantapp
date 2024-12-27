import 'package:dartz/dartz.dart';
import 'package:plant_app/core/domain/usecases/usecase.dart';
import 'package:plant_app/core/errors/failures.dart';
import 'package:plant_app/features/authentication/domain/repositories/auth_repository.dart';

///Use case for verify authentication with firebase
class VerifyAuthenticationFirebase implements UseCase<bool, NoParams> {
  ///Constructor for VerifyAuthenticationFirebase
  const VerifyAuthenticationFirebase({required this.repository});

  ///The repository for authentication
  final AuthRepository repository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) =>
      repository.verifyAuthState();
}
