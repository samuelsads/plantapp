part of 'plants_bloc.dart';

/// Represents the state of the plants bloc
class PlantsState extends Equatable {
  /// Creates a new instance of [PlantsState]
  const PlantsState({
    this.savePlantProgressStatus = RequestProgressStatus.nothing,
    this.verifyErrorMessage,
  });

  /// Creates a new instance of [PlantsState] with the given [savePlantProgressStatus]
  final RequestProgressStatus savePlantProgressStatus;

  /// Creates a new instance of [PlantsState] with the given [verifyAuthState]
  final String? verifyErrorMessage;

  /// Creates a new [PlantsState] instance with updated properties
  PlantsState copyWith({
    RequestProgressStatus? savePlantProgressStatus,
    String? verifyErrorMessage,
  }) =>
      PlantsState(
        savePlantProgressStatus:
            savePlantProgressStatus ?? this.savePlantProgressStatus,
        verifyErrorMessage: verifyErrorMessage ?? this.verifyErrorMessage,
      );

  @override
  List<Object?> get props => [savePlantProgressStatus, verifyErrorMessage];
}
