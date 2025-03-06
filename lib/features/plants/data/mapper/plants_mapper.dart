import 'package:plant_app/features/plants/data/models/response/plants_model.dart';
import 'package:plant_app/features/plants/domain/entities/plants.dart';

/// Mapper for plants
Plants toElement(PlantsModel plants) => Plants(
      id: plants.id,
      name: plants.name,
      sellerName: plants.sellerName,
      photoUrl: plants.photoUrl,
      price: plants.price,
      arrivalDate: plants.arrivalDate,
      description: plants.description,
      update: plants.update,
    );

/// Mapper for plants
List<Plants> plantsMapper(List<PlantsModel> plants) =>
    plants.map(toElement).toList();
