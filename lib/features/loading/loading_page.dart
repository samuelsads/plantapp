import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (mounted) {
          FirebaseAuth.instance.authStateChanges().listen((User? user) {
            if (user == null) {
              context.go('/login-page');
            } else {
              context.go('/home/0');
            }
          });
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.green,
          ),
        ),
      );
}
