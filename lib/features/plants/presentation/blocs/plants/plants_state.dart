part of 'plants_bloc.dart';

/// Represents the state of the plants bloc
class PlantsState extends Equatable {
  /// Creates a new instance of [PlantsState]
  const PlantsState({
    this.savePlantProgressStatus = RequestProgressStatus.nothing,
    this.verifyErrorMessage,
    this.plants = const <Plants>[],
    this.getPlantsProgressStatus = RequestProgressStatus.nothing,
    this.latestPlants = const <Plants>[],
    this.getLatestPlantsProgressStatus = RequestProgressStatus.nothing,
  });

  /// Creates a new instance of [PlantsState] with the given [savePlantProgressStatus]
  final RequestProgressStatus savePlantProgressStatus;

  /// Creates a new instance of [PlantsState] with the given [verifyAuthState]
  final String? verifyErrorMessage;

  /// Creates a new instance of [PlantsState] with the given [plants]
  final List<Plants> plants;

  /// Creates a new instance of [PlantsState] with the given [latestPlants]
  final List<Plants> latestPlants;

  /// Creates a new instance of [PlantsState] with the given [getLatestPlantsProgressStatus]
  final RequestProgressStatus getLatestPlantsProgressStatus;

  /// Creates a new instance of [PlantsState] with the given [getPlantsProgressStatus]
  final RequestProgressStatus getPlantsProgressStatus;

  /// Creates a new [PlantsState] instance with updated properties
  PlantsState copyWith({
    RequestProgressStatus? savePlantProgressStatus,
    String? verifyErrorMessage,
    List<Plants>? plants,
    RequestProgressStatus? getPlantsProgressStatus,
    List<Plants>? latestPlants,
    RequestProgressStatus? getLatestPlantsProgressStatus,
  }) =>
      PlantsState(
        savePlantProgressStatus:
            savePlantProgressStatus ?? this.savePlantProgressStatus,
        verifyErrorMessage: verifyErrorMessage ?? this.verifyErrorMessage,
        plants: plants ?? this.plants,
        getPlantsProgressStatus:
            getPlantsProgressStatus ?? this.getPlantsProgressStatus,
        latestPlants: latestPlants ?? this.latestPlants,
        getLatestPlantsProgressStatus:
            getLatestPlantsProgressStatus ?? this.getLatestPlantsProgressStatus,
      );

  @override
  List<Object?> get props => [
        savePlantProgressStatus,
        verifyErrorMessage,
        plants,
        getPlantsProgressStatus,
        latestPlants,
        getLatestPlantsProgressStatus,
      ];
}
