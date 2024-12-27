import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:plant_app/core/errors/failures.dart';
import 'package:plant_app/features/plants/data/models/request/plant_request.dart';

/// Plant Repository
abstract class PlantRepository {
  /// Upload Plant Image
  Future<Either<Failure, void>> savePlant({required PlantRequest plantRequest});

  /// Upload Plant Image
  Future<Either<Failure, String>> uploadPlantImage(
      {required File image, required String plantName});
}
