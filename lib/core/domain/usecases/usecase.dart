import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:plant_app/core/errors/failures.dart';

/// Abstract class representing a generic use case.
///
/// [UseCase] encapsulates business logic and defines a method [call]
/// returning a Future containing an Either representing success or failure.
abstract class UseCase<Type, Params> {
  /// Executes the use case and returns a Future containing an Either where:
  /// - The left side represents a Failure in case of an error during execution.
  /// - The right side represents the result of successful execution.
  Future<Either<Failure, Type>> call(Params params);
}

/// Represents a use case parameter that requires no input parameters.
///
/// [NoParams] is used when a use case does not require any input parameters.
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
