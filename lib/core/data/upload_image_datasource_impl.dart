import 'dart:io';

import 'package:dio/dio.dart';
import 'package:plant_app/core/data/upload_image_datasource.dart';

/// Upload Image Datasource Implementation
class UploadImageDatasourceImpl implements UploadImageDatasource {
  final Dio _dio = Dio();

  /// Cloudinary cloud name
  final String cloudName = 'dhmsr5tox';

  /// Cloudinary upload preset
  final String uploadPreset = 'plant-app';

  @override
  Future<String> uploadImage(File path) async {
    final String uploadUrl =
        'https://api.cloudinary.com/v1_1/$cloudName/image/upload';

    try {
      final FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(path.path,
            filename: 'plant_image.jpg'),
        'upload_preset': uploadPreset,
      });

      final response = await _dio.post(uploadUrl, data: formData);

      return response.data['secure_url'];
    } on Exception {
      rethrow;
    }
  }
}
