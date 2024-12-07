import 'package:get_it/get_it.dart';

///Global service locator instance for dependecy injection
final serviceLocator = GetIt.instance;

/// Sets up the service locator for dependency injection.
///
/// This function initializes the global service locator instance and can be called
/// to register dependencies before they are needed throughout the application.
void setUpServiceLocator() {}
