import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plant_app/utils/constants/app_constants.dart';

/// An abstract class defining methods for managing authentication tokens.
abstract class AuthHelper {
  /// Saves the authentication token securely.
  ///
  /// Takes a [token] as input and saves it securely for later retrieval.
  Future<void> saveToken(String token);

  /// Retrieves the authentication token.
  ///
  /// Retrieves the previously saved authentication token.
  /// Throws a [LocalStorageException] if the token is not found.
  Future<String?> getToken();

  /// Deletes the authentication token.
  ///
  /// Deletes the previously saved authentication token.
  Future<void> deleteToken();
}

/// A helper class implementation for managing authentication using Flutter Secure Storage.
class AuthHelperImpl implements AuthHelper {
  /// Constructs a new instance of [AuthHelperImpl] with the provided local instance.
  AuthHelperImpl({
    required this.storage,
  });

  /// The instance of Flutter Secure Storage used for secure token storage.
  final FlutterSecureStorage storage;

  @override
  Future<void> saveToken(String token) async {
    await storage.write(key: preferencesTokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    try {
      return await storage.read(key: preferencesTokenKey);
    } on Exception {
      return null;
    }
  }

  @override
  Future<void> deleteToken() => storage.delete(key: preferencesTokenKey);
}
