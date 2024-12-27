import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:plant_app/features/plants/data/datasource/plant_api_datasource.dart';
import 'package:plant_app/features/plants/data/models/request/plant_request.dart';

/// Plant API Data Source Implementation
class PlantApiDataSourceImpl implements PlantApiDataSource {
  /// Constructor for PlantApiDataSourceImpl
  PlantApiDataSourceImpl({required this.storage, required this.firestore});

  /// The Firebase Storage instance
  FirebaseStorage storage;

  /// The Firebase Firestore instance
  FirebaseFirestore firestore;

  /// Upload Plant Image
  @override
  Future<void> savePlant({required PlantRequest plantRequest}) async {
    try {
      final plant = plantRequest.toJson();
      await firestore.collection('plants').add(plant);
    } on Exception {
      rethrow;
    }
  }

  /// Upload Plant Image
  @override
  Future<String> uploadPlantImage(
      {required File image, required String plantName}) async {
    try {
      final storageRef = storage
          .ref()
          .child('plants/$plantName/${DateTime.now().toIso8601String()}.jpg');
      final uploadTask = await storageRef.putFile(image);
      return await uploadTask.ref.getDownloadURL();
    } on Exception {
      rethrow;
    }
  }
}
