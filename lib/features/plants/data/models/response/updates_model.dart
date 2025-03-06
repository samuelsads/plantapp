import 'package:plant_app/features/plants/domain/entities/updates.dart';

/// Updates model
class UpdatesModel extends Updates {
  /// Updates model
  const UpdatesModel({
    required super.date,
    required super.description,
    required super.photoUrl,
  });

  /// [fromJson] is a factory method that creates an instance of [UpdatesModel] from a JSON object.
  factory UpdatesModel.fromJson(Map<String, dynamic> json) => UpdatesModel(
        date: DateTime.parse(json['date']),
        description: json['description'],
        photoUrl: json['photo_url'],
      );
}
