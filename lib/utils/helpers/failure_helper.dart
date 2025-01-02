import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_app/core/errors/exceptions.dart';
import 'package:plant_app/core/errors/failures.dart';

/// Maps an exception to a corresponding failure.
Failure mapExceptionToFailure(Exception exception) {
  if (exception is BadRequestException) {
    return BadRequestFailure(exception.message);
  } else if (exception is ServerException) {
    return const ServerFailure();
  } else if (exception is GoogleAuthException) {
    return const GoogleAuthFailure();
  } else if (exception is LocalStorageException) {
    return const LocalStorageFailure();
  } else if (exception is UnauthorizedException) {
    return UnauthorizedFailure(exception.message);
  } else if (exception is FirebaseException) {
    return FirebaseFailure(exception.message);
  } else {
    return UnknownFailure(exception);
  }
}

/// Maps a [Failure] object to a human-readable error message.
String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case const (ServerFailure):
      return 'ServerFailure: ${failure.toString()}';
    case const (BadRequestFailure):
      return (failure as BadRequestFailure).message ?? 'Something went wrong.';
    case const (UnknownFailure):
      return 'UnknownFailure: ${failure.toString()}';
    case const (GoogleAuthFailure):
      return (failure as GoogleAuthFailure).message ??
          'Failure from Google Auth flow';
    case const (LocalStorageFailure):
      return 'Error obtaining value from local storage';
    case const (FirebaseFailure):
      return (failure as FirebaseFailure).message ?? 'Error from Firebase';
    case const (UnauthorizedFailure):
      return (failure as UnauthorizedFailure).message ?? 'Unauthorized';
    default:
      return 'Unexpected Error';
  }
}
