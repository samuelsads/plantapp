/// Represents an unknown exception that can occur in the application.
class UnknownException implements Exception {
  /// The wrapped exception, if any.
  UnknownException([this.e]);

  /// The wrapped exception, if any.
  final Exception? e;
}

/// Represents a bad request exception that can occur in the application.
class BadRequestException implements Exception {
  /// Constructs a [BadRequestException] with an optional [message].
  BadRequestException([this.message]);

  /// The error message associated with the bad request.
  final String? message;
}

/// Represents a server exception that can occur in the application.
class ServerException implements Exception {}

/// Represents a firebase exception that can occur in the application.
class GoogleAuthException implements Exception {
  /// Constructs a [GoogleAuthException] with an optional [message].
  GoogleAuthException([this.message]);

  /// The error message associated with the request.
  final String? message;
}

/// Represents a local storage exception that can occur in the application.
class LocalStorageException implements Exception {
  /// Constructs a [LocalStorageException].
  LocalStorageException();
}

/// Represents a unauthorized request exception that can occur in the application.
class UnauthorizedException implements Exception {
  /// Constructs a [UnauthorizedException] with an optional [message].
  UnauthorizedException([this.message]);

  /// The error message associated with the unauthorized request.
  final String? message;
}

/// Represents a special QR exception that can occur when range is beetwen 16,000 and 29,829.
class SpecialQRException implements Exception {
  /// Constructs a [SpecialQRException] with an optional [message].
  SpecialQRException([this.message]);

  /// The error message associated with the special QR.
  final String? message;
}
