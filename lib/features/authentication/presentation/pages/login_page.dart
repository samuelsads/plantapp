import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/core/configs/get_it/service_locator.dart';
import 'package:plant_app/core/presentation/widgets/inputs/custom_buttom.dart';
import 'package:plant_app/core/presentation/widgets/inputs/custom_text_form_field.dart';
import 'package:plant_app/features/authentication/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:plant_app/features/authentication/presentation/cubits/login/login_cubit.dart';

/// [LoginPage] is a page that is displayed when the user is not logged in.
class LoginPage extends StatefulWidget {
  /// [LoginPage] is a page that is displayed when the user is not logged in.
  const LoginPage({super.key});

  /// [pathName] is the name of the page.
  static const pathName = 'login-page';

  /// [path] is the name of the page.
  static const path = '/login-page';

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
        body: BlocProvider.value(
          value: serviceLocator<LoginCubit>(),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 24),
                      child: const Text(
                        'PLANTAPP',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              _formInputs(context),
              _formButtoms()
            ],
          ),
        ),
      );

  Widget _formButtoms() => BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) => CustomButtom(
            marginTop: 24,
            marginLeft: 24,
            marginRight: 24,
            title: 'Ingresar',
            onPressed: () {
              final authenticated = context.read<AuthenticationBloc>();
            }),
      );

  Widget _formInputs(BuildContext context) =>
      BlocBuilder<LoginCubit, LoginCubitState>(
        builder: (context, cubitState) => Column(
          children: [
            CustomTextFormField(
              label: 'Username',
              marginLeft: 24,
              marginRight: 24,
              onChanged: (email) =>
                  context.read<LoginCubit>().onEmailChanged(email),
            ),
            CustomTextFormField(
              label: 'Password',
              marginLeft: 24,
              marginRight: 24,
              obscureText: cubitState.hidePassword,
              suffixIcon: IconButton(
                  onPressed: () {
                    context.read<LoginCubit>().toggleHidePassword();
                  },
                  icon: cubitState.hidePassword
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility)),
              onChanged: (password) =>
                  context.read<LoginCubit>().onPasswordChanged(password),
            ),
          ],
        ),
      );
}
