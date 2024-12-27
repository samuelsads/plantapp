import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_app/core/configs/get_it/service_locator.dart';
import 'package:plant_app/core/presentation/widgets/inputs/custom_buttom.dart';
import 'package:plant_app/core/presentation/widgets/inputs/custom_text_form_field.dart';
import 'package:plant_app/features/authentication/data/models/request/login_model_request.dart';
import 'package:plant_app/features/authentication/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:plant_app/features/authentication/presentation/cubits/login/login_cubit.dart';
import 'package:plant_app/features/home/presentation/pages/home_page.dart';
import 'package:plant_app/utils/enums/request_progress_status.dart';
import 'package:plant_app/utils/extensions/build_context_extension.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider.value(
          value: serviceLocator<LoginCubit>(),
          child: BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state.authProgressStatus.isError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    state.verifyErrorMessage,
                  ),
                  backgroundColor: Colors.red,
                ));
              }

              if (state.authProgressStatus.isSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Login is success'),
                    backgroundColor: Colors.green,
                  ),
                );
                context
                    .goNamed(HomePage.pathName, pathParameters: {'page': '0'});
              }
            },
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
        ),
      );

  Widget _formButtoms() => BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) => BlocBuilder<LoginCubit, LoginCubitState>(
          builder: (context, cubitState) => CustomButtom(
              marginTop: 24,
              marginLeft: 24,
              marginRight: 24,
              title: (state.authProgressStatus.isLoading)
                  ? ''
                  : context.localizations.login,
              onPressed: (state.authProgressStatus.isLoading)
                  ? () {}
                  : () {
                      final authenticated = context.read<AuthenticationBloc>();
                      final cubit = context.read<LoginCubit>();
                      final isValid = cubit.validate(
                          appLocalizations: context.localizations);
                      if (isValid) {
                        final LoginModelRequest request = LoginModelRequest(
                            email: cubit.state.email,
                            password: cubit.state.password);
                        authenticated
                            .add(LoginWithFirebaseEvent(request: request));
                        return;
                      }
                    }),
        ),
      );

  Widget _formInputs(BuildContext context) =>
      BlocBuilder<LoginCubit, LoginCubitState>(
        builder: (context, cubitState) => Column(
          children: [
            CustomTextFormField(
              label: context.localizations.email,
              marginLeft: 24,
              marginRight: 24,
              errorMessage: cubitState.emailError,
              onChanged: (email) =>
                  context.read<LoginCubit>().onEmailChanged(email),
            ),
            CustomTextFormField(
              label: context.localizations.password,
              errorMessage: cubitState.passwordError,
              marginLeft: 24,
              marginRight: 24,
              marginTop: 12,
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
