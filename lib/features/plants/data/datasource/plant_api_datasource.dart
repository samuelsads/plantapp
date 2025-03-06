import 'dart:io';

import 'package:plant_app/features/plants/data/models/request/plant_request.dart';
import 'package:plant_app/features/plants/domain/entities/plants.dart';

/// Plant API Data Source
abstract class PlantApiDataSource {
  /// Get Plants
  Future<List<Plants>> getPlants(
    int limit,
  );

  /// Upload Plant Image
  Future<String> uploadPlantImage(
      {required File image, required String plantName});

  /// Save Plant
  Future<void> savePlant({required PlantRequest plantRequest});
}
