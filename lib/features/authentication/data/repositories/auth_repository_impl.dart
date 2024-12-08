import 'package:dartz/dartz.dart';
import 'package:plant_app/core/errors/failures.dart';
import 'package:plant_app/features/authentication/data/datasource/auth_api_datasource.dart';
import 'package:plant_app/features/authentication/data/models/request/login_model_request.dart';
import 'package:plant_app/features/authentication/domain/entities/user_credencial.dart';
import 'package:plant_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:plant_app/utils/helpers/failure_helper.dart';

/// Authentication Repository Implementation
class AuthRepositoryImpl implements AuthRepository {
  /// Constructor for AuthRepositoryImpl
  AuthRepositoryImpl({required this.dataSource});

  /// The remote datasource for user authentication
  final AuthApiDataSource dataSource;

  @override
  Future<Either<Failure, UserCredencial>> login(
      {required LoginModelRequest request}) async {
    try {
      final response = await dataSource.login(request: request);
      return Right(response);
    } on Exception catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
