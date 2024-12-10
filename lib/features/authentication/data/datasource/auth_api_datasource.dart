import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_app/features/authentication/data/models/request/login_model_request.dart';
import 'package:plant_app/features/authentication/domain/entities/user_credencial.dart';

/// [AuthApiDataSource] is an abstract class that defines the methods that
abstract class AuthApiDataSource {
  /// [login] is a method that returns a [UserCredential]
  Future<UserCredencial> login({required LoginModelRequest request});

  /// [verifyAuthState] is a method that returns a [User]
  Future<bool> verifyAuthState();
}
