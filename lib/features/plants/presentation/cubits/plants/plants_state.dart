part of 'plants_cubit.dart';

/// [PlantsState] is the state of the plants.
class PlantsState extends Equatable {
  /// [PlantsState] is the state of the plants.
  const PlantsState({
    this.name = '',
    this.description = '',
    this.seller = '',
    this.price = '',
    this.image,
  });

  /// [name] is the name of the plant.
  final String name;

  /// [description] is the description of the plant.

  final String description;

  /// [seller] is the seller of the plant.
  final String seller;

  /// [price] is the price of the plant.
  final String price;

  /// [image] is the image of the plant.
  final File? image;

  /// [copyWith] is a function that returns a new instance of [PlantsState] with the given parameters.
  PlantsState copyWith({
    String? name,
    String? description,
    String? seller,
    String? price,
    File? image,
  }) =>
      PlantsState(
        name: name ?? this.name,
        description: description ?? this.description,
        seller: seller ?? this.seller,
        price: price ?? this.price,
        image: image ?? this.image,
      );
  @override
  List<Object?> get props => [
        name,
        description,
        seller,
        price,
        image,
      ];
}
