import 'package:equatable/equatable.dart';

/// An abstract class representing a failure in the application.
abstract class Failure extends Equatable {
  /// Constructs an [Failure].
  const Failure();

  @override
  List<Object?> get props => [];
}

/// Represents a failure due to an unknown reason.
class UnknownFailure extends Failure {
  /// Constructs an [UnknownFailure] with an optional [exception].
  const UnknownFailure([this.exception]);

  /// The exception associated with the failure, if any.

  final Exception? exception;

  @override
  List<Object?> get props => [exception];
}

/// Represents a failure due to a bad request.
class BadRequestFailure extends Failure {
  /// Constructs a [BadRequestFailure] with an optional [message].
  const BadRequestFailure([this.message]);

  /// The error message associated with the bad request.
  final String? message;

  @override
  List<Object?> get props => [message];
}

/// Represents a failure due to a server error.
class ServerFailure extends Failure {
  /// Constructs a [ServerFailure].

  const ServerFailure();

  @override
  List<Object?> get props => [];
}

/// Represents a failure from google flow.
class GoogleAuthFailure extends Failure {
  /// Constructs a [GoogleAuthFailure] with an optional [message].
  const GoogleAuthFailure([this.message]);

  /// The error message associated with the bad request.
  final String? message;

  @override
  List<Object?> get props => [message];
}

/// Represents a failure from apple flow.
class AppleAuthFailure extends Failure {
  /// Constructs a [AppleAuthFailure] with an optional [message].
  const AppleAuthFailure([this.message]);

  /// The error message associated with the bad request.
  final String? message;

  @override
  List<Object?> get props => [message];
}


/// Represents a failure from local storage.
class LocalStorageFailure extends Failure {
  /// Constructs a [LocalStorageFailure].
  const LocalStorageFailure();

  @override
  List<Object?> get props => [];
}

/// Represents a failure from unauthorized request.
class UnauthorizedFailure extends Failure {
  /// Constructs a [UnauthorizedFailure] with an optional [message].
  const UnauthorizedFailure([this.message]);

  /// The error message associated with the unauthorized request.
  final String? message;

  @override
  List<Object?> get props => [message];
}

/// Represents a failure from special QR.
class SpecialQRFailure extends Failure {
  /// Constructs a [SpecialQRFailure] with an optional [message].
  const SpecialQRFailure([this.message]);

  /// The error message associated with the special QR.
  final String? message;

  @override
  List<Object?> get props => [message];
}
