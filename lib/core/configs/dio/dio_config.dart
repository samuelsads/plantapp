import 'package:dio/dio.dart';
import 'package:plant_app/utils/constants/api_constants.dart';

/// Global instance of Dio for making HTTP requests.
///
/// [dio] is an instance of the Dio class used for making HTTP requests.
/// It's configured with a [baseUrl] specifying the API's base URL,
/// and a set of [headers] including 'Content-Type', 'Accept', and 'X-API-KEY'
/// to indicate the content type of the request and provide the required API key.
final Dio dioConfig = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'Accept': 'application/json',
    },
  ),
);
