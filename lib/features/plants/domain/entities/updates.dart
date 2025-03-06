import 'package:equatable/equatable.dart';

/// [Updates] is a model class representing a plant update
class Updates extends Equatable {
  /// [Updates] is a model class representing a plant update
  const Updates({
    required this.date,
    required this.description,
    required this.photoUrl,
  });

  /// [date] is the date of the plant
  final DateTime date;

  /// [description] is the description of the plant
  final String description;

  /// [photoUrl] is the photo url of the plant
  final String photoUrl;

  @override
  List<Object?> get props => [date, description, photoUrl];
}
