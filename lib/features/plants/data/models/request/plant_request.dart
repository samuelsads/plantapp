import 'dart:io';

import 'package:plant_app/features/plants/data/models/request/update_request.dart';

/// [PlantRequest] is a model class representing a Plant Request
class PlantRequest {
  /// [PlantRequest] is a model class representing a Plant Request
  const PlantRequest({
    required this.name,
    required this.sellerName,
    required this.photo,
    required this.price,
    required this.update,
    required this.description,
    required this.arrivalDate,
    required this.photoUrl,
    this.userId,
  });

  /// [name] is the name of the plant
  final String name;

  /// [sellerName] is the name of the seller
  final String sellerName;

  /// [photo] is the photo of the plant
  final File photo;

  /// [photoUrl] is the photourl of the plant
  final String photoUrl;

  /// [price] is the price of the plant
  final double price;

  ///  [update] is the update request
  final List<UpdateRequest> update;

  /// [description] is the description of the plant
  final String description;

  /// [arrivaalDate] is the arrival date of the plant ]
  final DateTime arrivalDate;

  /// [userId] is the user id of the plant
  final String? userId;

  /// [toJson] is a method that converts the model to a json object
  PlantRequest copyWith({
    String? name,
    String? sellerName,
    File? photo,
    double? price,
    List<UpdateRequest>? update,
    String? description,
    DateTime? arrivalDate,
    String? photoUrl,
    String? userId,
  }) =>
      PlantRequest(
        name: name ?? this.name,
        sellerName: sellerName ?? this.sellerName,
        photo: photo ?? this.photo,
        price: price ?? this.price,
        update: update ?? this.update,
        description: description ?? this.description,
        arrivalDate: arrivalDate ?? this.arrivalDate,
        photoUrl: photoUrl ?? this.photoUrl,
        userId: userId ?? this.userId,
      );

  /// [toJson] is a method that converts the model to a json object
  Map<String, dynamic> toJson() => {
        'name': name,
        'seller_name': sellerName,
        'price': price,
        'update': update.map((e) => e.toJson()).toList(),
        'description': description,
        'arrival_date': arrivalDate.toIso8601String(),
        'photo_url': photoUrl,
        'user_id': userId,
      };
}
