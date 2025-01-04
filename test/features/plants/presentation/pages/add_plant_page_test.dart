import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_app/core/theme/light_theme.dart';
import 'package:plant_app/features/plants/data/datasource/plant_api_datasource.dart';
import 'package:plant_app/features/plants/data/datasource/plant_api_datasource_impl.dart';
import 'package:plant_app/features/plants/data/repositories/plant_repository_impl.dart';
import 'package:plant_app/features/plants/domain/repositories/plant_repository.dart';
import 'package:plant_app/features/plants/domain/usecases/save_image.dart'
    as save_image;
import 'package:plant_app/features/plants/domain/usecases/save_image.dart';
import 'package:plant_app/features/plants/domain/usecases/save_plant.dart'
    as save_plant;
import 'package:plant_app/features/plants/domain/usecases/save_plant.dart';
import 'package:plant_app/features/plants/presentation/blocs/plants/plants_bloc.dart';
import 'package:plant_app/features/plants/presentation/cubits/add_plant/add_plant_cubit.dart';
import 'package:plant_app/features/plants/presentation/pages/add_plant_page.dart';
import 'package:plant_app/l10n/app_localizations.dart';
import 'package:plant_app/utils/enums/request_progress_status.dart';

final getIt = GetIt.instance;

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements User {}

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockSaveImage extends Mock implements save_image.SaveImage {}

class MockSavePlant extends Mock implements save_plant.SavePlant {}

class ParamsFake extends Fake implements save_plant.Params {}

class MockFile extends Mock implements File {}

class MockAppLocalizations extends Mock implements AppLocalizations {
  @override
  String get name => 'Name';

  @override
  String get seller => 'Seller';

  @override
  String get price => 'Price';

  @override
  String get image => 'Image';

  @override
  String get description => 'Description';

  @override
  String get addPlant => 'Add Plant';
}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockFirebaseAuth mockFirebaseAuth;
  late MockFirebaseUser mockFirebaseUser;
  late MockFirebaseFirestore mockFirebaseFirestore;
  late MockSaveImage mockSaveImage;
  late MockSavePlant mockSavePlant;
  late MockFile mockFile;
  late MockAppLocalizations mockAppLocalizations;

  dotenv.testLoad(fileInput: '''
    CLOUD_NAME=12345
    UPLOAD_PRESET=2345
    ''');
  setUpAll(
    () {
      registerFallbackValue(ParamsFake());
      mockFile = MockFile();
      getIt.registerSingleton<FirebaseAuth>(MockFirebaseAuth());
      getIt.registerSingleton<FirebaseFirestore>(MockFirebaseFirestore());
      getIt.registerSingleton<PlantApiDataSource>(PlantApiDataSourceImpl(
          firestore: GetIt.instance<FirebaseFirestore>(),
          auth: GetIt.instance<FirebaseAuth>()));
      getIt.registerSingleton<PlantRepository>(PlantRepositoryImpl(
          dataSource: GetIt.instance<PlantApiDataSource>()));
      getIt.registerSingleton<SaveImage>(
          SaveImage(repository: GetIt.instance<PlantRepository>()));
      getIt.registerSingleton<SavePlant>(
          SavePlant(repository: GetIt.instance<PlantRepository>()));
      getIt.registerFactory(
        () => PlantsBloc(
            saveImage: GetIt.instance<SaveImage>(),
            savePlant: GetIt.instance<SavePlant>()),
      );

      getIt.registerFactory(
        AddPlantCubit.new,
      );
      when(() => mockFile.path).thenReturn('mock/path/to/image.jpg');
    },
  );

  setUp(
    () {
      mockAppLocalizations = MockAppLocalizations();

      mockSaveImage = MockSaveImage();
      mockSavePlant = MockSavePlant();
    },
  );

  testWidgets('Should find loading button', (tester) async {
    // Configura el BlocProvider y la UI
    await tester.pumpWidget(
      MultiBlocProvider(providers: [
        BlocProvider.value(
          value: GetIt.instance<PlantsBloc>()
            ..emit(const PlantsState(
                savePlantProgressStatus: RequestProgressStatus.loading)),
        ),
        BlocProvider.value(
          value: GetIt.instance<AddPlantCubit>(),
        )
      ], child: const AddPlantPageTest()),
    );

    // final bloc =
    //     BlocProvider.of<PlantsBloc>(tester.element(find.byType(AddPlantPage)));
    // bloc.add(SavePlantEvent(
    //     request: PlantRequest(
    //         name: 'plant',
    //         description: 'description',
    //         photo: mockFile,
    //         sellerName: 'sellerName',
    //         arrivalDate: DateTime.now(),
    //         price: 1200,
    //         update: [],
    //         userId: '1',
    //         photoUrl: 'http//:sads.com')));
    await tester.pump();
    await tester.pumpAndSettle();
    expect(find.text('Guardar'), findsOneWidget);
    // expect(
    //   find.byWidgetPredicate(
    //     (widget) =>
    //         widget is ElevatedButton && // Es un ElevatedButton
    //         widget.child is Row && // Su hijo es un Row
    //         (widget.child as Row).children.any((w) => w
    //             is CircularProgressIndicator), // Y dentro del Row hay un CircularProgressIndicator
    //   ),
    //   findsOneWidget,
    // );
  });
}

class AddPlantPageTest extends StatelessWidget {
  const AddPlantPageTest({
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: LightTheme().theme(),
        supportedLocales: const [
          Locale('es'),
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: const AddPlantPage(),
      );
}
