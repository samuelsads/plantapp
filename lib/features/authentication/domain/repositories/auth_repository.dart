import 'package:dartz/dartz.dart';
import 'package:plant_app/core/errors/failures.dart';
import 'package:plant_app/features/authentication/data/models/request/login_model_request.dart';
import 'package:plant_app/features/authentication/domain/entities/user_credencial.dart';

/// Authentication Repository
abstract class AuthRepository {
  /// Sign In
  Future<Either<Failure, UserCredencial>> login(
      {required LoginModelRequest request});

  /// Verify Auth State
  Future<Either<Failure, bool>> verifyAuthState();
}
