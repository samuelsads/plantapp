/// [UpdateRequest] is a model that represents the request to update a plant0
class UpdateRequest {
  /// [UpdateRequest] is a model that represents the request to update a plant
  const UpdateRequest({
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

  /// [toJson] is a method that converts the model to a json object
  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String(),
        'description': description,
        'photo_url': photoUrl,
      };
}
