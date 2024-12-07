import 'package:dio/dio.dart';
import 'package:plant_app/core/errors/exceptions.dart';

/// Maps an HTTP status code to a corresponding exception.
///
/// The [response] parameter represents the HTTP response.
/// Returns an exception corresponding to the provided status code.
/// Otherwise, it returns an [UnknownException].
Exception exceptionHelper(Response response) {
  switch (response.statusCode) {
    case 400:
    case 403:
    case 404:
    case 422:
    case 423:
      if (response.data != null &&
          response.data is Map &&
          (response.data as Map).containsKey('message')) {
        return BadRequestException(response.data['message']);
      } else {
        return BadRequestException();
      }
    case 401:
      if (response.data != null &&
          response.data is Map &&
          (response.data as Map).containsKey('message')) {
        return UnauthorizedException(response.data['message']);
      } else {
        return UnauthorizedException();
      }
    case 500:
      return ServerException();
    default:
      return UnknownException();
  }
}
