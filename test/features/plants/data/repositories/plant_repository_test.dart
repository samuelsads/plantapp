import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/errors/exceptions.dart';
import 'package:plant_app/core/errors/failures.dart';
import 'package:plant_app/features/plants/data/datasource/plant_api_datasource.dart';
import 'package:plant_app/features/plants/data/repositories/plant_repository_impl.dart';
import 'package:plant_app/features/plants/domain/repositories/plant_repository.dart';

class PlantApiDataSourceFake extends Mock implements PlantApiDataSource {}

class MockFile extends Mock implements File {}

final getIt = GetIt.instance;
void main() {
  late PlantRepository repository;
  late PlantApiDataSource dataSource;
  late MockFile mockFile;

  setUp(
    () {
      dataSource = PlantApiDataSourceFake();
      repository = PlantRepositoryImpl(dataSource: dataSource);
      mockFile = MockFile();
    },
  );

  test(
    'saveImage success',
    () async {
      when(() => dataSource.uploadPlantImage(
            image: mockFile,
            plantName: 'plantName',
          )).thenAnswer((_) async => 'imageUrl');

      final result = await repository.uploadPlantImage(
        image: mockFile,
        plantName: 'plantName',
      );

      expect(result, const Right('imageUrl'));

      verify(() => dataSource.uploadPlantImage(
            image: mockFile,
            plantName: 'plantName',
          )).called(1);
    },
  );

  test(
    'saveImage success',
    () async {
      when(() => dataSource.uploadPlantImage(
            image: mockFile,
            plantName: 'plantName',
          )).thenAnswer((_) async => 'imageUrl');

      final result = await repository.uploadPlantImage(
        image: mockFile,
        plantName: 'plantName',
      );

      expect(result, const Right('imageUrl'));

      verify(() => dataSource.uploadPlantImage(
            image: mockFile,
            plantName: 'plantName',
          )).called(1);
    },
  );

  test(
    'saveImage failure',
    () async {
      when(() => dataSource.uploadPlantImage(
            image: mockFile,
            plantName: 'plantName',
          )).thenThrow(BadRequestException());

      final result = await repository.uploadPlantImage(
        image: mockFile,
        plantName: 'plantName',
      );

      expect(result, const Left(BadRequestFailure()));

      verify(() => dataSource.uploadPlantImage(
            image: mockFile,
            plantName: 'plantName',
          )).called(1);
    },
  );
}
