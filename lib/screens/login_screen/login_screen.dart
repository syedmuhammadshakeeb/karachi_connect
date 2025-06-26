import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_bloc.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_event.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_state.dart';

import 'package:karachi_connect/routes/route_name.dart';
import 'package:karachi_connect/screens/login_screen/component/login_ui.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailControllers = TextEditingController();
    final TextEditingController passwordControllers = TextEditingController();
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
          extendBodyBehindAppBar: true,
          body: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return LoginUi(
                emailControllers: emailControllers,
                obsecure: state.isVisible,
                obsecureTap: () {
                  context.read<AuthBloc>().add(IsVisiblePassword());
                },
                onForgetPasswordTap: () {},
                onLoginTap: () {
                  Navigator.pushNamed(context, RouteName.main);
                },
                ongoogleTap: () {},
                onsignupNavigationTap: () {
                  Navigator.pushNamed(context, RouteName.askingSignInScreen);
                },
                passwordControllers: passwordControllers,
              );
            },
          )),
    );
  }
}
