import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/errors/failures.dart';
import 'package:plant_app/features/plants/domain/repositories/plant_repository.dart';
import 'package:plant_app/features/plants/domain/usecases/save_image.dart';

class MockPlantRepository extends Mock implements PlantRepository {}

class ParamsFake extends Fake implements Params {}

class MockFile extends Mock implements File {}

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements User {}

final getIt = GetIt.instance;
void main() {
  late SaveImage usecase;
  late MockPlantRepository mockPlantRepository;
  late MockFile mockFile;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockFirebaseUser mockFirebaseUser;

  setUpAll(
    () {
      mockFirebaseAuth = MockFirebaseAuth();
      mockFirebaseUser = MockFirebaseUser();

      getIt.registerSingleton<FirebaseAuth>(MockFirebaseAuth());
      getIt.registerSingleton<FirebaseFirestore>(MockFirebaseFirestore());
    },
  );

  setUp(
    () {
      mockPlantRepository = MockPlantRepository();
      mockFile = MockFile();

      usecase = SaveImage(repository: mockPlantRepository);
      when(() => mockFirebaseAuth.currentUser).thenReturn(mockFirebaseUser);
      when(() => mockFirebaseUser.uid).thenReturn('1');
    },
  );

  test(
    'Save image return success',
    () async {
      when(() => mockPlantRepository.uploadPlantImage(
              image: mockFile, plantName: 'plant'))
          .thenAnswer(
              (_) async => const Right('htttps://example.com/photo.jpg'));
      final resul = await usecase(Params(image: mockFile, plantName: 'plant'));
      expect(resul, const Right('htttps://example.com/photo.jpg'));
      verify(() => mockPlantRepository.uploadPlantImage(
          image: mockFile, plantName: 'plant')).called(1);
    },
  );

  test(
    'Save image return failure',
    () async {
      when(() => mockPlantRepository.uploadPlantImage(
              image: mockFile, plantName: 'plant'))
          .thenAnswer((_) async => const Left(BadRequestFailure()));
      final resul = await usecase(Params(image: mockFile, plantName: 'plant'));
      expect(resul, const Left(BadRequestFailure()));
      verify(() => mockPlantRepository.uploadPlantImage(
          image: mockFile, plantName: 'plant')).called(1);
    },
  );
}
