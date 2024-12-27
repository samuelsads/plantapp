part of 'plants_bloc.dart';

sealed class PlantsState extends Equatable {
  const PlantsState();
  
  @override
  List<Object> get props => [];
}

final class PlantsInitial extends PlantsState {}
