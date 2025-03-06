import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:plant_app/core/domain/usecases/usecase.dart';
import 'package:plant_app/core/errors/failures.dart';
import 'package:plant_app/features/plants/domain/entities/plants.dart';
import 'package:plant_app/features/plants/domain/repositories/plant_repository.dart';

/// Use case for getting plants
class GetPlants implements UseCase<List<Plants>, Params> {
  /// Constructor for GetPlants
  const GetPlants({required this.repository});

  /// The repository for getting plants
  final PlantRepository repository;

  @override
  Future<Either<Failure, List<Plants>>> call(Params params) async =>
      repository.getPlants(params.limit);
}

/// Params for GetPlants
class Params extends Equatable {
  /// Constructor for Params
  const Params({required this.limit});

  /// The limit for the number of plants to get
  final int limit;

  @override
  List<Object?> get props => [limit];
}
