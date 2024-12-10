import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/features/authentication/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:plant_app/features/authentication/presentation/pages/login_page.dart';
import 'package:plant_app/features/home/home_page.dart';
import 'package:plant_app/utils/enums/request_progress_status.dart';

/// [LoadingPage] is a page that is displayed while the user is logged in.
class LoadingPage extends StatefulWidget {
  /// [LoadingPage] is a page that is displayed while the user is logged in.
  const LoadingPage({super.key});

  /// [pathName] is the name of the page.
  static String pathName = 'loading-page';

  /// [name] is the name of the page.
  static const path = '/loading';

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (timeStamp) {
    //     if (mounted) {
    //       FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //         if (user == null) {
    //           context.go('/login-page');
    //         } else {
    //           context.go('/home/0');
    //         }
    //       });
    //     }
    //   },
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state.verifyAuthState.isLoading) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.verifyErrorMessage),
                ),
              );
            } else if (state.verifyAuthState.isSuccess) {
              if (state.isAuthenticated) {
                context
                    .goNamed(HomePage.pathName, pathParameters: {'page': '0'});
              } else {
                context.goNamed(LoginPage.pathName);
              }
            }
          },
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          ),
        ),
      );
}
