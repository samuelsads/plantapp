import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'plants_event.dart';
part 'plants_state.dart';

class PlantsBloc extends Bloc<PlantsEvent, PlantsState> {
  PlantsBloc() : super(PlantsInitial()) {
    on<PlantsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
