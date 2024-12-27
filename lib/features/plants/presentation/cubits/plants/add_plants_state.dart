part of 'add_plants_cubit.dart';

/// [AddPlantsState] is the state of the plants.
class AddPlantsState extends Equatable {
  /// [AddPlantsState] is the state of the plants.
  const AddPlantsState({
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

  /// [copyWith] is a function that returns a new instance of [AddPlantsState] with the given parameters.
  AddPlantsState copyWith({
    String? name,
    String? description,
    String? seller,
    String? price,
    File? image,
  }) =>
      AddPlantsState(
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
