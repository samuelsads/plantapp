import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'plants_state.dart';

/// [PlantsCubit] is the cubit for the plants.
class PlantsCubit extends Cubit<PlantsState> {
  /// [PlantsCubit] is the cubit for the plants.
  PlantsCubit() : super(const PlantsState());

  /// [setName] is the function that sets the name of the plant.
  void setName(String name) => emit(state.copyWith(name: name));

  /// [setDescription] is the function that sets the description of the plant.
  void setDescription(String description) =>
      emit(state.copyWith(description: description));

  /// [setSeller] is the function that sets the seller of the plant.
  void setSeller(String seller) => emit(state.copyWith(seller: seller));

  /// [setPrice] is the function that sets the price of the plant.
  void setPrice(String price) => emit(state.copyWith(price: price));

  /// [setImage] is the function that sets the image of the plant.
  void setImage(File? image) => emit(state.copyWith(image: image));
}
