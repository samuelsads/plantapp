import 'package:flutter/material.dart';
import 'package:plant_app/core/presentation/widgets/custom_buttom.dart';
import 'package:plant_app/core/presentation/widgets/custom_textformfield.dart';
import 'package:plant_app/features/login/viewmodel_login.dart';

/// [LoginPage] is a page that is displayed when the user is not logged in.
class LoginPage extends StatefulWidget {
  /// [LoginPage] is a page that is displayed when the user is not logged in.
  const LoginPage({super.key});

  static const pathName = '/login-page';

  /// [path] is the name of the page.
  static const path = 'login-page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController username;
  late TextEditingController password;

  @override
  void initState() {
    username = TextEditingController();
    password = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (mounted) {
          // FirebaseAuth.instance.authStateChanges().listen((User? user) {
          //   if (user == null) {
          //     print('User is currently signed out!');
          //   } else {
          //     print('User is signed in!');
          //   }
          // });
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 200,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'PLANTAPP',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            CustomtextFormField(
              title: 'Correo electrónico',
              controller: username,
              placeholder: 'example@example.com',
            ),
            CustomtextFormField(
              title: 'Contraseña',
              controller: password,
              isPassword: true,
              placeholder: 'Ingrese su contraseña',
              top: 0,
            ),
            CumstomButtom(
                title: 'Ingresar',
                onPressed: () => ViewmodelLogin()
                    .signIn(username.text.trim(), password.text.trim()))
          ],
        ),
      );
}
