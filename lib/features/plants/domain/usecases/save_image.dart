import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:plant_app/core/domain/usecases/usecase.dart';
import 'package:plant_app/core/errors/failures.dart';
import 'package:plant_app/features/plants/domain/repositories/plant_repository.dart';

///Use case for save image in firebase
class SaveImage implements UseCase<String, Params> {
  ///Constructor for SaveImage
  const SaveImage({required this.repository});

  ///The repository for authentication
  final PlantRepository repository;

  @override
  Future<Either<Failure, String>> call(Params params) => repository
      .uploadPlantImage(image: params.image, plantName: params.plantName);
}

///Params for SaveImage usecase
class Params extends Equatable {
  ///Constructor for Params
  const Params({required this.image, required this.plantName});

  ///The image to save
  final File image;

  ///The name of the plant
  final String plantName;

  @override
  List<Object?> get props => [image, plantName];
}
