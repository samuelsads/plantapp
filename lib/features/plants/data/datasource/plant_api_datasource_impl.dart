import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_app/features/plants/data/datasource/plant_api_datasource.dart';
import 'package:plant_app/features/plants/data/models/request/plant_request.dart';
import 'package:plant_app/utils/constants/api_constants.dart';

/// Plant API Data Source Implementation
class PlantApiDataSourceImpl implements PlantApiDataSource {
  /// Constructor for PlantApiDataSourceImpl
  PlantApiDataSourceImpl({required this.firestore, required this.auth});

  /// The Firebase Firestore instance
  FirebaseFirestore firestore;

  /// The Firebase Auth instance
  FirebaseAuth auth;

  /// Upload Plant Image
  @override
  Future<void> savePlant({required PlantRequest plantRequest}) async {
    try {
      final plant = plantRequest.copyWith(userId: auth.currentUser?.uid ?? '0');
      await firestore.collection('plants').add(plant.toJson());
    } on Exception {
      rethrow;
    }
  }

  /// Upload Plant Image
  @override
  Future<String> uploadPlantImage(
      {required File image, required String plantName}) async {
    final Dio dio = Dio();

    final String uploadUrl =
        'https://api.cloudinary.com/v1_1/$cloudName/image/upload';

    try {
      final FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(image.path,
            filename: 'plant_image.jpg'),
        'upload_preset': uploadPreset,
      });

      final response = await dio.post(uploadUrl, data: formData);

      return response.data['secure_url'];
    } on Exception {
      rethrow;
    }
  }
}
