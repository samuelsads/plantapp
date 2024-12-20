import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigator_state.dart';

/// [NavigatorCubit] is a cubit that is used to navigate between pages.
class NavigatorCubit extends Cubit<NavigatorState> {
  /// [NavigatorCubit] is a cubit that is used to navigate between pages.
  NavigatorCubit() : super(const NavigatorState());

  /// [navigateToPage] is a function that is used to navigate to a page.
  Future<void> navigateToPage(
    int page,
  ) async {
    emit(state.copyWith(currentPage: page));
  }
}
