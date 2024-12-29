import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:plant_app/core/domain/usecases/usecase.dart';
import 'package:plant_app/core/errors/failures.dart';
import 'package:plant_app/features/plants/data/models/request/plant_request.dart';
import 'package:plant_app/features/plants/domain/repositories/plant_repository.dart';

/// Use case for saving a plant
class SavePlant implements UseCase<void, Params> {
  /// Constructor for SavePlant
  const SavePlant({required this.repository});

  /// The repository for saving a plant
  final PlantRepository repository;

  @override
  Future<Either<Failure, void>> call(Params params) => repository.savePlant(
        plantRequest: params.request,
      );
}

/// Params for SavePlant
class Params extends Equatable {
  /// Constructor for Params
  const Params({required this.request});

  /// The request to save
  final PlantRequest request;

  @override
  List<Object?> get props => [request];
}
