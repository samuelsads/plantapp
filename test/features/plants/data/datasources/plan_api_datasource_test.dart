import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/features/plants/data/datasource/plant_api_datasource.dart';
import 'package:plant_app/features/plants/data/datasource/plant_api_datasource_impl.dart';
import 'package:plant_app/features/plants/data/models/request/plant_request.dart';

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements User {}

// ignore: subtype_of_sealed_class
class MockCollectionReference extends Mock
    implements CollectionReference<Map<String, dynamic>> {}

// ignore: subtype_of_sealed_class
class MockDocumentReference extends Mock
    implements DocumentReference<Map<String, dynamic>> {}

class MockFile extends Mock implements File {}

void main() {
  late PlantApiDataSource dataSource;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockFirebaseUser mockFirebaseUser;
  late MockFirebaseFirestore mockFirebaseFirestore;
  late MockCollectionReference mockCollectionReference;
  late MockFile mockFile;
  late MockDocumentReference mockDocumentReference;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockFirebaseUser = MockFirebaseUser();
    mockFirebaseFirestore = MockFirebaseFirestore();
    mockCollectionReference = MockCollectionReference();
    mockDocumentReference = MockDocumentReference();
    mockFile = MockFile();

    dataSource = PlantApiDataSourceImpl(
      firestore: mockFirebaseFirestore,
      auth: mockFirebaseAuth,
    );
  });

  group('savePlant', () {
    test('savePlant calls firestore.collection().add() with correct data',
        () async {
      final plantRequest = PlantRequest(
        name: 'testPlant',
        sellerName: 'testSeller',
        photo: mockFile,
        price: 10.99,
        update: [],
        description: 'testDescription',
        arrivalDate: DateTime.now(),
        photoUrl: 'testImageUrl',
      );
      const userId = 'testUserId';

      when(() => mockFirebaseAuth.currentUser).thenReturn(mockFirebaseUser);
      when(() => mockFirebaseUser.uid).thenReturn(userId);
      when(() => mockFirebaseFirestore.collection('plants'))
          .thenReturn(mockCollectionReference);
      when(() => mockCollectionReference.add(any()))
          .thenAnswer((_) async => mockDocumentReference);

      await dataSource.savePlant(plantRequest: plantRequest);

      verify(() => mockFirebaseFirestore.collection('plants')).called(1);
      verify(() => mockCollectionReference.add(
            {
              'name': plantRequest.name,
              'seller_name': plantRequest.sellerName,
              'price': plantRequest.price,
              'update': plantRequest.update.map((e) => e.toJson()).toList(),
              'description': plantRequest.description,
              'arrival_date': plantRequest.arrivalDate.toIso8601String(),
              'photo_url': plantRequest.photoUrl,
              'user_id': userId,
            },
          )).called(1);
    });
    test('savePlant throws exception if firestore throws', () async {
      final plantRequest = PlantRequest(
        name: 'testPlant',
        sellerName: 'testSeller',
        photo: mockFile,
        price: 10.99,
        update: [],
        description: 'testDescription',
        arrivalDate: DateTime.now(),
        photoUrl: 'testImageUrl',
      );
      when(() => mockFirebaseAuth.currentUser).thenReturn(mockFirebaseUser);
      when(() => mockFirebaseUser.uid).thenReturn('testUserId');
      when(() => mockFirebaseFirestore.collection('plants'))
          .thenThrow(Exception('Firestore error'));
      expect(() => dataSource.savePlant(plantRequest: plantRequest),
          throwsA(isA<Exception>()));
    });
  });
}
