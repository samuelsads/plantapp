part of 'navigator_cubit.dart';

/// [NavigatorState] is a state that is used to navigate between pages.
class NavigatorState extends Equatable {
  /// [NavigatorState] is a state that is used to navigate between pages.
  const NavigatorState({
    this.currentPage = 0,
  });

  /// [currentPage] is the current page that is displayed.
  final int currentPage;

  /// Creates a new [NavigatorState] instance with updated properties
  NavigatorState copyWith({
    int? currentPage,
  }) =>
      NavigatorState(
        currentPage: currentPage ?? this.currentPage,
      );

  @override
  List<Object?> get props => [currentPage];
}
