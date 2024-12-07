import 'package:plant_app/features/authentication/data/models/response/user_credential_model.dart';
import 'package:plant_app/features/authentication/domain/entities/user_credencial.dart';

/// [AuthApiDataSource] is an abstract class that defines the methods that
abstract class AuthApiDataSource {
  /// [login] is a method that returns a [UserCredential]
  Future<UserCredencial> login({required UserCredentialModel request});
}
