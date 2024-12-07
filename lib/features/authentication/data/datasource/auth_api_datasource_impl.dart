import 'package:plant_app/features/authentication/data/datasource/auth_api_datasource.dart';
import 'package:plant_app/features/authentication/data/models/response/user_credential_model.dart';
import 'package:plant_app/features/authentication/domain/entities/user_credencial.dart';

class AuthApiDatasourceImpl implements AuthApiDataSource {
  @override
  Future<UserCredencial> login({required UserCredentialModel request}) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
