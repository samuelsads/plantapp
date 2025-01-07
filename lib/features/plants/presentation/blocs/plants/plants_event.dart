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
