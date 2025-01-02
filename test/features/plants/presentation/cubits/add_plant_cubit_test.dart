import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/features/plants/presentation/cubits/add_plant/add_plant_cubit.dart';

class MockFile extends Mock implements File {}

class ParamsFake extends Fake implements File {}

void main() {
  late AddPlantCubit cubit;
  late MockFile mockFile;
  setUp(
    () {
      cubit = AddPlantCubit();
      mockFile = MockFile();
    },
  );

  setUpAll(
    () {
      registerFallbackValue(ParamsFake());
    },
  );

  test(
    'Initial state should be correct',
    () async {
      expect(cubit.state, const AddPlantState());
    },
  );

  group(
    'set data group test',
    () {
      blocTest(
        'emit correct state when setName is add',
        build: () => cubit,
        act: (bloc) => bloc.setName('name'),
        expect: () => <AddPlantState>[const AddPlantState(name: 'name')],
      );

      blocTest(
        'emit correct state when setDescription is add',
        build: () => cubit,
        act: (bloc) => bloc.setDescription('description'),
        expect: () =>
            <AddPlantState>[const AddPlantState(description: 'description')],
      );

      blocTest(
        'emit correct state when setSeller is add',
        build: () => cubit,
        act: (bloc) => bloc.setSeller('seller'),
        expect: () => <AddPlantState>[const AddPlantState(seller: 'seller')],
      );

      blocTest(
        'emit correct state when setPrice is add',
        build: () => cubit,
        act: (bloc) => bloc.setPrice(1200),
        expect: () => <AddPlantState>[const AddPlantState(name: 'name')],
      );

      blocTest(
        'emit correct state when setImage is add',
        build: () => cubit,
        act: (bloc) => bloc.setImage(mockFile),
        expect: () => <AddPlantState>[AddPlantState(image: mockFile)],
      );
    },
  );
}
