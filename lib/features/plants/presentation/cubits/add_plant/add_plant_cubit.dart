import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_plant_state.dart';

/// [AddPlantCubit] is the cubit for the plants.
class AddPlantCubit extends Cubit<AddPlantState> {
  /// [AddPlantCubit] is the cubit for the plants.
  AddPlantCubit() : super(const AddPlantState());

  /// [onName] is the function that sets the name of the plant.
  void onName(String name) => emit(state.copyWith(name: name));

  /// [onDescription] is the function that sets the description of the plant.
  void onDescription(String description) =>
      emit(state.copyWith(description: description));

  /// [onSeller] is the function that sets the seller of the plant.
  void onSeller(String seller) => emit(state.copyWith(seller: seller));

  /// [onPrice] is the function that sets the price of the plant.
  void onPrice(String price) => emit(state.copyWith(price: price));

  /// [onImage] is the function that sets the image of the plant.
  void onImage(File? image) => emit(state.copyWith(image: image));
}
