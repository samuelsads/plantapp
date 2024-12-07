import 'package:dio/dio.dart';
import 'package:plant_app/utils/helpers/content_type.dart';
import 'package:plant_app/utils/helpers/exception_helper.dart';
import 'package:plant_app/utils/helpers/request_type.dart';

/// A helper class for making HTTP requests
abstract class HttpClientHelper {
  /// Makes an HTTP request with the specified parameters.
  ///
  /// [endpoint] is the URL endpoint to which the request will be sent.
  ///
  /// [token] is an optional authentication token to be included in the request header.
  ///
  /// [requestType] specifies the type of HTTP request to be made (GET, POST, PUT, PATCH, DELETE).
  ///
  /// [data] is the optional data to be sent with the request (usually for POST, PUT, PATCH requests).
  ///
  /// [responseType] is the type of response expected from the server (e.g., JSON, plain text).
  ///
  /// Returns a Future containing the response from the server.
  Future<Response> request({
    required String endpoint,
    String? token,
    required RequestType requestType,
    dynamic data,
    ContentType contentType = ContentType.json,
    ResponseType? responseType,
  });
}

/// A helper class for making HTTP requests using Dio.
class HttpClientHelperImpl implements HttpClientHelper {
  /// Constructs a new instance of [HttpClientHelperImpl] with the provided Dio instance.
  HttpClientHelperImpl(
    this._dio,
  ) {
    _dio.interceptors.add(_dioInterceptor());
  }

  /// The Dio instance used to make HTTP requests.
  final Dio _dio;

  @override
  Future<Response> request({
    required String endpoint,
    String? token,
    required RequestType requestType,
    dynamic data,
    ResponseType? responseType,
    ContentType contentType = ContentType.json,
  }) async {
    try {
      switch (requestType) {
        // ============ Get Request =========== //

        case RequestType.get:
          final Response<dynamic> response = await _dio.get(endpoint,
              options: Options(
                  responseType: responseType,
                  followRedirects: false,
                  validateStatus: (status) => true,
                  headers: {
                    if (token != null) 'Authorization': 'Bearer $token',
                    'Content-Type': 'application/json',
                  }));

          if (response.statusCode != 200 &&
              response.statusCode != 201 &&
              response.statusCode != 202) {
            throw exceptionHelper(response);
          }

          return response;

        // ===================================== //

        // ============ Post Request =========== //

        case RequestType.post:
          final Response<dynamic> response = await _dio.post(endpoint,
              data: data,
              options: Options(
                  responseType: responseType,
                  followRedirects: false,
                  validateStatus: (status) => true,
                  headers: {
                    if (token != null) 'Authorization': 'Bearer $token',
                    'Content-Type': contentType.isMultipart
                        ? 'multipart/form-data'
                        : 'application/json',
                  }));

          if (response.statusCode != 200 &&
              response.statusCode != 201 &&
              response.statusCode != 202) {
            throw exceptionHelper(response);
          }

          return response;

        // ===================================== //

        // ============ Put Request =========== //

        case RequestType.put:
          final Response<dynamic> response = await _dio.put(endpoint,
              data: data,
              options: Options(
                  followRedirects: false,
                  validateStatus: (status) => true,
                  headers: {
                    if (token != null) 'Authorization': 'Bearer $token',
                    'Content-Type': 'application/json',
                  }));

          if (response.statusCode != 200 &&
              response.statusCode != 201 &&
              response.statusCode != 202) {
            throw exceptionHelper(response);
          }

          return response;

        // ===================================== //

        // ============ Delete Request =========== //

        case RequestType.delete:
          final Response<dynamic> response = await _dio.delete(
            data: data,
            endpoint,
            options: Options(
                followRedirects: false,
                validateStatus: (status) => true,
                headers: {
                  if (token != null) 'Authorization': 'Bearer $token',
                  'Content-Type': 'application/json',
                }),
          );

          if (response.statusCode != 200 &&
              response.statusCode != 201 &&
              response.statusCode != 202) {
            throw exceptionHelper(response);
          }

          return response;

        // ===================================== //

        case RequestType.patch:
          final Response<dynamic> response = await _dio.patch(endpoint,
              data: data,
              options: Options(
                  followRedirects: false,
                  validateStatus: (status) => true,
                  headers: {
                    if (token != null) 'Authorization': 'Bearer $token',
                    'Content-Type': contentType.isMultipart
                        ? 'multipart/form-data'
                        : 'application/json',
                  }));

          if (response.statusCode != 200 &&
              response.statusCode != 201 &&
              response.statusCode != 202) {
            throw exceptionHelper(response);
          }

          return response;

        // ===================================== //

        default:
          throw Exception('not valid type of request');
      }
    } on Exception {
      rethrow;
    }
  }

  /// A wrapper for Dio interceptors.
  QueuedInterceptorsWrapper _dioInterceptor() => QueuedInterceptorsWrapper(
        onRequest: ((options, handler) async => handler.next(options)),
        onResponse: (response, handler) => handler.next(response),
        onError: (error, handler) async {
          //Log the error data
          return handler.next(error);
        },
      );

  String _formDataToString(FormData formData) {
    final StringBuffer buffer = StringBuffer();
    for (var element in formData.fields) {
      buffer.write('${element.key}: ${element.value}\n');
    }
    // add files
    for (var element in formData.files) {
      buffer.write('${element.key}: ${element.value.filename}\n');
    }
    return buffer.toString();
  }
}
