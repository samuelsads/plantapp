import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_app/features/authentication/data/datasource/auth_api_datasource.dart';
import 'package:plant_app/features/authentication/data/mappers/auth_mapper.dart';
import 'package:plant_app/features/authentication/data/models/request/login_model_request.dart';
import 'package:plant_app/features/authentication/domain/entities/user_credencial.dart';

class AuthApiDatasourceImpl implements AuthApiDataSource {
  AuthApiDatasourceImpl({required this.auth});

  FirebaseAuth auth;
  @override
  Future<UserCredencial> login({required LoginModelRequest request}) async {
    try {
      final response = await auth.signInWithEmailAndPassword(
          email: request.email, password: request.password);

      final model = response.user;

      return toUserCredentialMapper(model: model!);
    } on Exception {
      rethrow;
    }
  }
}