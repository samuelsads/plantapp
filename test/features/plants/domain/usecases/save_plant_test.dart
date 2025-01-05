import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/errors/failures.dart';
import 'package:plant_app/features/plants/data/models/request/plant_request.dart';
import 'package:plant_app/features/plants/domain/repositories/plant_repository.dart';
import 'package:plant_app/features/plants/domain/usecases/save_plant.dart';

class MockPlantRepository extends Mock implements PlantRepository {}

class ParamsFake extends Fake implements Params {}

class MockFile extends Mock implements File {}

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements User {}

final getIt = GetIt.instance;
void main() {
  late SavePlant usecase;
  late MockPlantRepository mockPlantRepository;
  late MockFile mockFile;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockFirebaseUser mockFirebaseUser;

  setUpAll(
    () {
      mockFirebaseAuth = MockFirebaseAuth();
      mockFirebaseUser = MockFirebaseUser();
      registerFallbackValue(PlantRequest(
        name: 'test',
        description: 'test',
        photo: MockFile(),
        sellerName: 'test',
        arrivalDate: DateTime.now(),
        price: 0,
        update: const [],
        userId: 'test',
        photoUrl: 'samuel',
      ));
      registerFallbackValue(ParamsFake());
      getIt.registerSingleton<FirebaseAuth>(MockFirebaseAuth());
      getIt.registerSingleton<FirebaseFirestore>(MockFirebaseFirestore());
    },
  );

  setUp(
    () async {
      mockPlantRepository = MockPlantRepository();
      usecase = SavePlant(repository: mockPlantRepository);
      mockFile = MockFile();
      //setUpServiceLocator();
      when(() => mockFirebaseAuth.currentUser).thenReturn(mockFirebaseUser);
      when(() => mockFirebaseUser.uid).thenReturn('1');
    },
  );

  test('should return void with no failure', () async {
    when(() => mockFirebaseUser.uid).thenReturn('1');
    when(() => mockPlantRepository.savePlant(
            plantRequest: any(named: 'plantRequest')))
        .thenAnswer((_) async => const Right(null));

    // act
    final result = await usecase(Params(
        request: PlantRequest(
            name: 'plant',
            description: 'description',
            photo: mockFile,
            sellerName: 'sellerName',
            arrivalDate: DateTime.now(),
            price: 1200,
            update: [],
            userId: '1',
            photoUrl: 'samuel')));

    // assert
    expect(result, const Right(null));
    verify(() => mockPlantRepository.savePlant(
        plantRequest: any(named: 'plantRequest'))).called(1);
    verifyNoMoreInteractions(mockPlantRepository);
  });

  test('should return void with  failure', () async {
    when(() => mockFirebaseUser.uid).thenReturn('1');
    when(() => mockPlantRepository.savePlant(
            plantRequest: any(named: 'plantRequest')))
        .thenAnswer((_) async => const Left(FirebaseFailure()));

    // act
    final result = await usecase(Params(
        request: PlantRequest(
            name: 'plant',
            description: 'description',
            photo: mockFile,
            sellerName: 'sellerName',
            arrivalDate: DateTime.now(),
            price: 1200,
            update: [],
            userId: '2',
            photoUrl: 'samuel')));

    // assert
    expect(result, const Left(FirebaseFailure()));
    verify(() => mockPlantRepository.savePlant(
        plantRequest: any(named: 'plantRequest'))).called(1);
    verifyNoMoreInteractions(mockPlantRepository);
  });
}
