import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plant_app/core/configs/get_it/service_locator.dart';
import 'package:plant_app/core/routes/app_router.dart';
import 'package:plant_app/core/theme/light_theme.dart';
import 'package:plant_app/features/authentication/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:plant_app/firebase_options.dart';
import 'package:plant_app/l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setUpServiceLocator();
  runApp(const MyApp());
}

/// This is the main application widget.
class MyApp extends StatefulWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: serviceLocator<AuthenticationBloc>()
          ..add(const VerifyAuthStateEvent()),
        child: MaterialApp.router(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('es'),
          ],
          routerConfig: appRouter,
          theme: LightTheme().theme(),
          debugShowCheckedModeBanner: false,
          title: 'PlantApp',
        ),
      );
}
