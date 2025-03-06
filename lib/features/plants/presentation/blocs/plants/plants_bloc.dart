import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/features/plants/data/models/request/plant_request.dart';
import 'package:plant_app/features/plants/domain/entities/plants.dart';
import 'package:plant_app/features/plants/domain/usecases/get_last_plants.dart'
    as get_last_plants;
import 'package:plant_app/features/plants/domain/usecases/get_plants.dart'
    as get_plants;
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
    required get_plants.GetPlants getPlants,
    required get_last_plants.GetLastPlants getLatestPlants,
  })  : _saveImage = saveImage,
        _savePlant = savePlant,
        _getPlants = getPlants,
        _getLatestPlants = getLatestPlants,
        super(const PlantsState()) {
    on<SavePlantEvent>(_onSavePlant);
    on<GetPlantsEvent>(_getPlantsBloc);
    on<GetLastPlantsEvent>(_getLatestPlantsBloc);
  }

  final save_image_firebase.SaveImage _saveImage;
  final save_plant.SavePlant _savePlant;

  final get_last_plants.GetLastPlants _getLatestPlants;

  final get_plants.GetPlants _getPlants;

  Future<void> _getPlantsBloc(
      GetPlantsEvent event, Emitter<PlantsState> emit) async {
    final response = await _getPlants(const get_plants.Params(limit: 10));
    response.fold((failure) async {
      emit(state.copyWith(
          getPlantsProgressStatus: RequestProgressStatus.error,
          verifyErrorMessage: mapFailureToMessage(failure)));
    }, (plants) async {
      emit(state.copyWith(
          getPlantsProgressStatus: RequestProgressStatus.success,
          plants: plants));
    });
  }

  Future<void> _getLatestPlantsBloc(
      GetLastPlantsEvent event, Emitter<PlantsState> emit) async {
    emit(state.copyWith(
      getLatestPlantsProgressStatus: RequestProgressStatus.loading,
    ));
    final response =
        await _getLatestPlants(const get_last_plants.Params(limit: 10));
    response.fold((failure) async {
      emit(state.copyWith(
          getLatestPlantsProgressStatus: RequestProgressStatus.error,
          verifyErrorMessage: mapFailureToMessage(failure)));
    }, (plants) async {
      emit(state.copyWith(
          getLatestPlantsProgressStatus: RequestProgressStatus.success,
          latestPlants: plants));
    });
  }

  Future<void> _onSavePlant(
      SavePlantEvent event, Emitter<PlantsState> emit) async {
    emit(
        state.copyWith(savePlantProgressStatus: RequestProgressStatus.loading));
    final urlPhoto =
        await _uploadImage(event.request.photo, event.request.name, emit);
    if (urlPhoto != '') {
      final request = event.request.copyWith(photoUrl: urlPhoto);
      final response = await _savePlant(save_plant.Params(request: request));
      response.fold((failure) async {
        emit(state.copyWith(
            savePlantProgressStatus: RequestProgressStatus.error,
            verifyErrorMessage: mapFailureToMessage(failure)));
      }, (_) async {
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
