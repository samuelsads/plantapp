import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:plant_app/core/configs/dio/dio_config.dart';
import 'package:plant_app/features/authentication/data/datasource/auth_api_datasource.dart';
import 'package:plant_app/features/authentication/data/datasource/auth_api_datasource_impl.dart';
import 'package:plant_app/utils/helpers/auth_helper.dart';
import 'package:plant_app/utils/helpers/http_client_helper.dart';

/// Service Locator
final serviceLocator = GetIt.instance;

/// Setup Service Locator
Future<void> setupServiceLocator() async {
  // MARK: FIREBASE
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

// MARK: FEATURES: AUTHENTICATION
  serviceLocator.registerSingleton<AuthApiDataSource>(
    AuthApiDatasourceImpl(auth: serviceLocator<FirebaseAuth>()),
  );
}
