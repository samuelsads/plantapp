part of 'add_plant_cubit.dart';

/// [AddPlantState] is the state of the plants.
class AddPlantState extends Equatable {
  /// [AddPlantState] is the state of the plants.
  const AddPlantState(
      {this.name = '',
      this.description = '',
      this.seller = '',
      this.price = 0.00,
      this.image,
      this.descriptionError = '',
      this.imageError = '',
      this.nameError = '',
      this.priceError = '',
      this.sellerError = ''});

  /// [name] is the name of the plant.
  final String name;

  /// [nameError] is the error of the name of the plant.
  final String nameError;

  /// [description] is the description of the plant.

  final String description;

  /// [descriptionError] is the error of the description of the plant.
  final String descriptionError;

  /// [seller] is the seller of the plant.
  final String seller;

  /// [sellerError] is the error of the seller of the plant.
  final String sellerError;

  /// [price] is the price of the plant.
  final double price;

  /// [priceError] is the error of the price of the plant.
  final String priceError;

  /// [image] is the image of the plant.
  final File? image;

  /// [imageError] is the error of the image of the plant.
  final String imageError;

  /// [copyWith] is a function that returns a new instance of [AddPlantState] with the given parameters.
  AddPlantState copyWith({
    String? name,
    String? description,
    String? seller,
    double? price,
    File? image,
    String? descriptionError,
    String? imageError,
    String? nameError,
    String? priceError,
    String? sellerError,
  }) =>
      AddPlantState(
        name: name ?? this.name,
        description: description ?? this.description,
        seller: seller ?? this.seller,
        price: price ?? this.price,
        image: image ?? this.image,
        descriptionError: descriptionError ?? this.descriptionError,
        imageError: imageError ?? this.imageError,
        nameError: nameError ?? this.nameError,
        priceError: priceError ?? this.priceError,
        sellerError: sellerError ?? this.sellerError,
      );
  @override
  List<Object?> get props => [
        name,
        description,
        seller,
        price,
        image,
        descriptionError,
        imageError,
        nameError,
        priceError,
        sellerError,
      ];
}
