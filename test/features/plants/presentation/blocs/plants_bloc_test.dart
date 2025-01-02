// ignore_for_file: discarded_futures

import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/errors/failures.dart';
import 'package:plant_app/features/plants/data/models/request/plant_request.dart';
import 'package:plant_app/features/plants/domain/usecases/save_image.dart'
    as save_image;
import 'package:plant_app/features/plants/domain/usecases/save_plant.dart'
    as save_plant;
import 'package:plant_app/features/plants/presentation/blocs/plants/plants_bloc.dart';
import 'package:plant_app/utils/enums/request_progress_status.dart';

class MockSaveImage extends Mock implements save_image.SaveImage {}

class MockStorage extends Mock implements Storage {}

class MockSavePlant extends Mock implements save_plant.SavePlant {}

class MockFile extends Mock implements File {}

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// Mock de FirebaseUser
class MockFirebaseUser extends Mock implements User {}

class ParamsFake extends Fake implements save_plant.Params {}

final getIt = GetIt.instance;

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockFirebaseAuth mockFirebaseAuth;
  late MockFirebaseUser mockFirebaseUser;
  late MockSaveImage mockSaveImage;
  late MockSavePlant mockSavePlant;
  late Storage hydratedStorage;
  late PlantsBloc plantsBloc;
  late MockFile mockFile;

  setUpAll(
    () {
      registerFallbackValue(ParamsFake());
      getIt.registerSingleton<FirebaseAuth>(MockFirebaseAuth());
      getIt.registerSingleton<FirebaseFirestore>(MockFirebaseFirestore());
    },
  );

  setUp(
    () async {
      hydratedStorage = MockStorage();

      HydratedBloc.storage = hydratedStorage;
      mockSaveImage = MockSaveImage();
      mockSavePlant = MockSavePlant();
      mockFile = MockFile();
      mockFirebaseAuth = MockFirebaseAuth();
      mockFirebaseUser = MockFirebaseUser();

      plantsBloc =
          PlantsBloc(saveImage: mockSaveImage, savePlant: mockSavePlant);

      //setUpServiceLocator();
      when(() => mockFirebaseAuth.currentUser).thenReturn(mockFirebaseUser);
      when(() => mockFirebaseUser.uid).thenReturn('1');
    },
  );

  test('FirebaseAuth test - mockear FirebaseAuth y User', () async {
    final user = mockFirebaseAuth.currentUser;

    // Verifica que el usuario mockeado tiene el ID correcto
    expect(user?.uid, '1');
  });

  test('Initial state should be correct', () async {
    // assert
    expect(plantsBloc.state, const PlantsState());
  });

  group(
    'SavePlantEvent',
    () {
      setUpAll(() {});

      blocTest<PlantsBloc, PlantsState>(
        'emits error state when image upload fails',
        setUp: () {
          when(() => mockFirebaseUser.uid).thenReturn('1');
          when(() => mockSaveImage(
                save_image.Params(image: mockFile, plantName: 'plant'),
              )).thenAnswer(
            (_) async => const Right('https://example.com/photo.jpg'),
          );
          when(() => mockSaveImage(
                save_image.Params(image: mockFile, plantName: 'plant'),
              )).thenAnswer(
            (_) async => const Left(BadRequestFailure()),
          );
          when(() => mockSavePlant(
                    save_plant.Params(
                        request: PlantRequest(
                            name: 'plant',
                            description: 'description',
                            photo: mockFile,
                            sellerName: 'sellerName',
                            arrivalDate: DateTime.now(),
                            price: 1200,
                            update: [],
                            userId: '1',
                            photoUrl: '')),
                  ))
              .thenAnswer((_) async => const Left(
                  BadRequestFailure())); // Mockea un fallo en la subida
        },
        build: () => plantsBloc,
        act: (bloc) => bloc.add(SavePlantEvent(
            request: PlantRequest(
                name: 'plant',
                description: 'description',
                photo: mockFile,
                sellerName: 'sellerName',
                arrivalDate: DateTime.now(),
                price: 1200,
                update: [],
                userId: '1',
                photoUrl: ''))),
        expect: () => <PlantsState>[
          const PlantsState(
              savePlantProgressStatus: RequestProgressStatus.loading),
          const PlantsState(
              savePlantProgressStatus: RequestProgressStatus.error,
              verifyErrorMessage: 'Something went wrong.'),
          const PlantsState(
              savePlantProgressStatus: RequestProgressStatus.error,
              verifyErrorMessage: 'Error al subir la imagen')
        ],
      );

      blocTest<PlantsBloc, PlantsState>(
        'emits error state when image upload is success but plant save has an error',
        setUp: () {
          when(() => mockFirebaseUser.uid).thenReturn('1');
          when(() => mockSaveImage(
                save_image.Params(image: mockFile, plantName: 'plant'),
              )).thenAnswer(
            (_) async => const Right('https://example.com/photo.jpg'),
          );

          when(() => mockSavePlant(any()))
              .thenAnswer((_) async => const Left(FirebaseFailure()));
        },
        build: () => plantsBloc,
        act: (bloc) => bloc.add(SavePlantEvent(
            request: PlantRequest(
                name: 'plant',
                description: 'description',
                photo: mockFile,
                sellerName: 'sellerName',
                arrivalDate: DateTime(2024),
                price: 1200,
                update: [],
                userId: '1',
                photoUrl: 'https://example.com/photo.jpg'))),
        expect: () => <PlantsState>[
          const PlantsState(
              savePlantProgressStatus: RequestProgressStatus.loading),
          const PlantsState(
              savePlantProgressStatus: RequestProgressStatus.error,
              verifyErrorMessage: 'Error from Firebase')
        ],
      );

      blocTest<PlantsBloc, PlantsState>(
        'emits success state when image upload and plant save is success',
        setUp: () {
          when(() => mockFirebaseUser.uid).thenReturn('1');
          when(() => mockSaveImage(
                save_image.Params(image: mockFile, plantName: 'plant'),
              )).thenAnswer(
            (_) async => const Right('https://example.com/photo.jpg'),
          );

          when(() => mockSavePlant(any()))
              .thenAnswer((_) async => const Right(null));
        },
        build: () => plantsBloc,
        act: (bloc) => bloc.add(SavePlantEvent(
            request: PlantRequest(
                name: 'plant',
                description: 'description',
                photo: mockFile,
                sellerName: 'sellerName',
                arrivalDate: DateTime(2024),
                price: 1200,
                update: [],
                userId: '1',
                photoUrl: 'https://example.com/photo.jpg'))),
        expect: () => <PlantsState>[
          const PlantsState(
              savePlantProgressStatus: RequestProgressStatus.loading),
          const PlantsState(
              savePlantProgressStatus: RequestProgressStatus.success)
        ],
      );
    },
  );
}
