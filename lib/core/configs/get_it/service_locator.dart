import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:plant_app/core/configs/dio/dio_config.dart';
import 'package:plant_app/features/authentication/data/datasource/auth_api_datasource.dart';
import 'package:plant_app/features/authentication/data/datasource/auth_api_datasource_impl.dart';
import 'package:plant_app/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:plant_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:plant_app/features/authentication/domain/usecases/login_with_firebase.dart';
import 'package:plant_app/features/authentication/domain/usecases/verify_authentication_firebase.dart';
import 'package:plant_app/features/authentication/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:plant_app/features/authentication/presentation/cubits/login/login_cubit.dart';
import 'package:plant_app/features/home/presentation/cubits/navigator/navigator_cubit.dart';
import 'package:plant_app/features/plants/presentation/cubits/add_plant/add_plant_cubit.dart';
import 'package:plant_app/utils/helpers/auth_helper.dart';
import 'package:plant_app/utils/helpers/http_client_helper.dart';

///Global service locator instance for dependecy injection
final serviceLocator = GetIt.instance;

/// Sets up the service locator for dependency injection.
///
/// This function initializes the global service locator instance and can be called
/// to register dependencies before they are needed throughout the application.
void setUpServiceLocator() {
  // external
  serviceLocator
      .registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  serviceLocator.registerSingleton<Dio>(dioConfig);
  serviceLocator.registerSingleton<HttpClientHelper>(
    HttpClientHelperImpl(serviceLocator<Dio>()),
  );
  serviceLocator
      .registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  serviceLocator.registerSingleton<AuthHelper>(
    AuthHelperImpl(storage: serviceLocator<FlutterSecureStorage>()),
  );

  // MARK:  - Authentication
  // DATASOURCES
  serviceLocator.registerSingleton<AuthApiDataSource>(
    AuthApiDatasourceImpl(auth: serviceLocator<FirebaseAuth>()),
  );

  //REPOSITORIES
  serviceLocator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(dataSource: serviceLocator<AuthApiDataSource>()),
  );

  //USE CASES
  serviceLocator.registerSingleton<LoginWithFirebase>(
    LoginWithFirebase(repository: serviceLocator<AuthRepository>()),
  );

  serviceLocator.registerSingleton<VerifyAuthenticationFirebase>(
    VerifyAuthenticationFirebase(repository: serviceLocator<AuthRepository>()),
  );

  //BLOCS
  serviceLocator.registerFactory(
    () => AuthenticationBloc(
        loginWithFirebase: serviceLocator<LoginWithFirebase>(),
        verifyAuthState: serviceLocator<VerifyAuthenticationFirebase>()),
  );

  //CUBIT
  serviceLocator.registerFactory(
    LoginCubit.new,
  );

  ///MARK: - Home
  serviceLocator.registerFactory(
    NavigatorCubit.new,
  );

  //MARK: - Add plants
  serviceLocator.registerFactory(
    AddPlantCubit.new,
  );
}
