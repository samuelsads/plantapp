import 'package:plant_app/features/plants/data/models/response/updates_model.dart';
import 'package:plant_app/features/plants/domain/entities/plants.dart';

class PlantsModel extends Plants {
  const PlantsModel({
    required super.id,
    required super.name,
    required super.sellerName,
    required super.photoUrl,
    required super.price,
    required super.arrivalDate,
    required super.description,
    required super.update,
  });

  factory PlantsModel.fromJson(Map<String, dynamic> json) => PlantsModel(
        id: json['id'],
        name: json['name'],
        sellerName: json['seller_name'],
        photoUrl: json['photo_url'],
        price: json['price'],
        arrivalDate: DateTime.parse(json['arrival_date']),
        description: json['description'],
        update: List<UpdatesModel>.from(
            json['update'].map((x) => UpdatesModel.fromJson(x))),
      );
}
