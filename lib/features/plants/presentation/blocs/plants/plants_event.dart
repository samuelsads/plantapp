part of 'plants_bloc.dart';

/// Events for plants bloc
sealed class PlantsEvent extends Equatable {
  const PlantsEvent();
}

/// Event for save plant
class SavePlantEvent extends PlantsEvent {
  /// Constructor for SavePlantEvent
  const SavePlantEvent({
    required this.request,
  });

  /// The request model for saving a plant
  final PlantRequest request;

  @override
  List<Object?> get props => [request];
}

/// Event for get plants
class GetPlantsEvent extends PlantsEvent {
  /// Constructor for GetPlantsEvent
  const GetPlantsEvent({
    required this.limit,
  });

  /// The limit for getting plants
  final int limit;

  @override
  List<Object?> get props => [limit];
}

/// Event for get last plants
class GetLastPlantsEvent extends PlantsEvent {
  /// Constructor for GetPlantsEvent
  const GetLastPlantsEvent({
    required this.limit,
  });

  /// The limit for getting plants
  final int limit;

  @override
  List<Object?> get props => [limit];
}
