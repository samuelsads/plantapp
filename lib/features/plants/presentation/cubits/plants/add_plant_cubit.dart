import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_plant_state.dart';

/// [AddPlantCubit] is the cubit for the plants.
class AddPlantCubit extends Cubit<AddPlantState> {
  /// [AddPlantCubit] is the cubit for the plants.
  AddPlantCubit() : super(const AddPlantState());

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
