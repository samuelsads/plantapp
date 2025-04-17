import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_app/features/plants/data/datasource/plant_api_datasource.dart';
import 'package:plant_app/features/plants/data/mapper/plants_mapper.dart';
import 'package:plant_app/features/plants/data/models/request/plant_request.dart';
import 'package:plant_app/features/plants/data/models/response/plants_model.dart';
import 'package:plant_app/features/plants/domain/entities/plants.dart';
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

      // Referencia al nuevo documento (Firestore genera un ID único)
      final docRef = firestore.collection('plants').doc();

      // Crear el objeto con el ID generado
      final plantWithId = plant.copyWith(id: docRef.id);

      // Guardar en Firestore con el ID incluido en los datos
      await docRef.set(plantWithId.toJson());
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

  @override
  Future<List<Plants>> getPlants(int limit) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;

      if (userId == null) {
        throw Exception('Usuario no autenticado.');
      }

      final querySnapshot = await firestore
          .collection('plants')
          .where('user_id', isEqualTo: userId)
          .orderBy('arrival_date', descending: true)
          .limit(limit)
          .get();
      final data = querySnapshot.docs;
      final plants = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return PlantsModel.fromJson(data);
      }).toList();

      if (data.isEmpty) {
        return [];
      }
      return plantsMapper(plants);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> moreExpensivePlants({required int limit}) {
    throw UnimplementedError();
  }
}
