import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_bloc.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_event.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_state.dart';
import 'package:karachi_connect/component/loading_component/loading_component.dart';

import 'package:karachi_connect/routes/route_name.dart';
import 'package:karachi_connect/screens/login_screen/component/login_ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailControllers = TextEditingController();
  final TextEditingController passwordControllers = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Form(
        key: _formKey,
        child: Scaffold(
            extendBodyBehindAppBar: true,
            body: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state.isSucess == true) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RouteName.main, (_) => false);
                }
              },
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return LoginUi(
                    emailControllers: emailControllers,
                    obsecure: state.isVisible,
                    emailValidator: (value) {
                      if (value == null && value?.isEmpty == true) {
                        return 'Email is required';
                      } else {
                        return null;
                      }
                    },
                    passwordValidator: (value) {
                      if (value == null && value?.isEmpty == true) {
                        return 'Password is required';
                      } else {
                        return null;
                      }
                    },
                    obsecureTap: () {
                      context.read<AuthBloc>().add(IsVisiblePassword());
                    },
                    onForgetPasswordTap: () {},
                    onLoginTap: () {
                      if (_formKey.currentState?.validate() == true) {
                        context.read<AuthBloc>().add(LoginEvent(
                            email: emailControllers,
                            password: passwordControllers));
                      }
                    },
                    ongoogleTap: () {},
                    onsignupNavigationTap: () {
                      Navigator.pushReplacementNamed(
                          context, RouteName.askingSignInScreen);
                    },
                    passwordControllers: passwordControllers,
                  );
                },
              ),
            )),
      ),
    );
  }
}
