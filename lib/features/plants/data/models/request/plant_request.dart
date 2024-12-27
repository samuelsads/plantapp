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
  });

  /// [name] is the name of the plant
  final String name;

  /// [sellerName] is the name of the seller
  final String sellerName;

  /// [photo] is the photo of the plant
  final File photo;

  /// [price] is the price of the plant
  final String price;

  ///  [update] is the update request
  final List<UpdateRequest> update;

  /// [description] is the description of the plant
  final String description;

  /// [arrivaalDate] is the arrival date of the plant ]
  final DateTime arrivalDate;

  /// [toJson] is a method that converts the model to a json object
  Map<String, dynamic> toJson() => {
        'name': name,
        'seller_name': sellerName,
        'photo': photo,
        'price': price,
        'update': update.map((e) => e.toJson()).toList(),
        'description': description,
        'arrival_date': arrivalDate.toIso8601String(),
      };
}
