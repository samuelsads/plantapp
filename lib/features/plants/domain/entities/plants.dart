import 'package:equatable/equatable.dart';
import 'package:plant_app/features/plants/domain/entities/updates.dart';

/// Plants entity
class Plants extends Equatable {
  /// Plants entity
  const Plants({
    required this.id,
    required this.name,
    required this.sellerName,
    required this.photoUrl,
    required this.price,
    required this.arrivalDate,
    required this.description,
    required this.update,
  });

  /// id of the plant
  final String id;

  /// name of the plant
  final String name;

  /// seller name of the plant
  final String sellerName;

  /// photo url of the plant
  final String photoUrl;

  /// price of the plant
  final double price;

  /// arrival date of the plant
  final DateTime arrivalDate;

  /// description of the plant
  final String description;

  /// update of the plant
  final List<Updates> update;

  @override
  List<Object?> get props => [
        id,
        name,
        sellerName,
        photoUrl,
        price,
        arrivalDate,
        description,
        update,
      ];
}
