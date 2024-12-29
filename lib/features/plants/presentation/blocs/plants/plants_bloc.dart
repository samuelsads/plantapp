import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/features/plants/data/models/request/plant_request.dart';
import 'package:plant_app/features/plants/domain/usecases/save_image.dart'
    as save_image_firebase;
import 'package:plant_app/features/plants/domain/usecases/save_plant.dart'
    as save_plant;
import 'package:plant_app/utils/enums/request_progress_status.dart';
import 'package:plant_app/utils/helpers/failure_helper.dart';

part 'plants_event.dart';
part 'plants_state.dart';

/// Bloc for plants
class PlantsBloc extends Bloc<PlantsEvent, PlantsState> {
  /// Constructor for PlantsBloc
  PlantsBloc({
    required save_image_firebase.SaveImage saveImage,
    required save_plant.SavePlant savePlant,
  })  : _saveImage = saveImage,
        _savePlant = savePlant,
        super(const PlantsState()) {
    on<SavePlantEvent>(_onSavePlant);
  }

  final save_image_firebase.SaveImage _saveImage;
  final save_plant.SavePlant _savePlant;
  Future<void> _onSavePlant(
      SavePlantEvent event, Emitter<PlantsState> emit) async {
    emit(
        state.copyWith(savePlantProgressStatus: RequestProgressStatus.loading));
    final urlPhoto =
        await _uploadImage(event.request.photo, event.request.name, emit);
    if (urlPhoto != '') {
      final request = event.request.copyWith(photoUrl: urlPhoto);
      final response = await _savePlant(save_plant.Params(request: request));
      response.fold((failure) {
        emit(state.copyWith(
            savePlantProgressStatus: RequestProgressStatus.error,
            verifyErrorMessage: mapFailureToMessage(failure)));
      }, (success) {
        emit(state.copyWith(
            savePlantProgressStatus: RequestProgressStatus.success));
      });
    } else {
      emit(state.copyWith(
          savePlantProgressStatus: RequestProgressStatus.error,
          verifyErrorMessage: 'Error al subir la imagen'));
    }
  }

  Future<String> _uploadImage(
      File image, String name, Emitter<PlantsState> emit) async {
    final response = await _saveImage(
        save_image_firebase.Params(image: image, plantName: name));
    return response.fold((failure) {
      emit(state.copyWith(
          savePlantProgressStatus: RequestProgressStatus.error,
          verifyErrorMessage: mapFailureToMessage(failure)));
      return '';
    }, (success) => success);
  }
}
