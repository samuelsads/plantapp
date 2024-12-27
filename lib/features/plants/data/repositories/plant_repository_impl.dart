import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:plant_app/core/errors/failures.dart';
import 'package:plant_app/features/plants/data/datasource/plant_api_datasource.dart';
import 'package:plant_app/features/plants/data/models/request/plant_request.dart';
import 'package:plant_app/features/plants/domain/repositories/plant_repository.dart';
import 'package:plant_app/utils/helpers/failure_helper.dart';

/// Plant Repository Implementation
class PlantRepositoryImpl implements PlantRepository {
  /// Constructor for PlantRepositoryImpl
  PlantRepositoryImpl({required this.dataSource});

  /// The remote datasource for plants
  final PlantApiDataSource dataSource;

  @override
  Future<Either<Failure, void>> savePlant(
      {required PlantRequest plantRequest}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> uploadPlantImage(
      {required File image, required String plantName}) async {
    try {
      final response =
          await dataSource.uploadPlantImage(image: image, plantName: plantName);
      return Right(response);
    } on Exception catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
