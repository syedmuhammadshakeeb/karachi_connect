import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_bloc.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_event.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_state.dart';

import 'package:karachi_connect/routes/route_name.dart';
import 'package:karachi_connect/screens/document_upload_screen/document_upload_screen.dart';
import 'package:karachi_connect/screens/sign_up_screen/component/sign_up_ui.dart';

class SignupScreen extends StatelessWidget {
  final String? signUpAs;
  const SignupScreen({super.key, this.signUpAs});

  @override
  Widget build(BuildContext context) {
    final emailControllers = TextEditingController();
    final nameControllers = TextEditingController();
    final passwordControllers = TextEditingController();
    final phoneNoControllers = TextEditingController();
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
          extendBodyBehindAppBar: true,
          body: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Center(
                  child: SignUpUi(
                obsecure: state.isVisible,
                obsecureTap: () {
                  context.read<AuthBloc>().add(IsVisiblePassword());
                },
                loginNavigationTap: () {
                  Navigator.pop(context);
                },
                onGoogleTap: () {},
                onSignUpTap: () {
                  Navigator.pushNamed(context, RouteName.documentUploadScreen,
                      arguments: DocumentUploadScreenArgument(
                        emailController: emailControllers,
                        nameController: nameControllers,
                        passwordController: passwordControllers,
                        phoneController: phoneNoControllers,
                        role: signUpAs,
                      ));
                },
                emailControllers: emailControllers,
                nameControllers: nameControllers,
                passwordControllers: passwordControllers,
                phoneNoControllers: phoneNoControllers,
              ));
            },
          )),
    );
  }
}

class SignupScreenArguemnt {
  final String? signUpAs;
  SignupScreenArguemnt({this.signUpAs});
}
