import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_bloc.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_event.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_state.dart';

import 'package:karachi_connect/routes/route_name.dart';
import 'package:karachi_connect/screens/document_upload_screen/document_upload_screen.dart';
import 'package:karachi_connect/screens/sign_up_screen/component/sign_up_ui.dart';

class SignupScreen extends StatefulWidget {
  final String? signUpAs;
  const SignupScreen({super.key, this.signUpAs});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailControllers = TextEditingController();
  final nameControllers = TextEditingController();
  final passwordControllers = TextEditingController();
  final phoneNoControllers = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passFieldKey =
      GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocProvider(
        // lazy: false,
        create: (context) => AuthBloc(),
        child: Scaffold(
            extendBodyBehindAppBar: true,
            body: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return Center(
                    child: SignUpUi(
                  passwordKey: _passFieldKey,
                  passwordError: state.passwordError,
                  emailValidator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter email';
                    }
                    if (value?.contains('@gmail.com') == false) {
                      return 'Please enter valid email';
                    } else {
                      return null;
                    }
                  },
                  nameValidator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter name';
                    } else {
                      return null;
                    }
                  },
                  passwordValidator: (value) {
                    context.read<AuthBloc>().add(PasswordValidator(value));
                  },
                  phoneValidator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter phone number';
                    } else {
                      return null;
                    }
                  },
                  obsecure: state.isVisible,
                  obsecureTap: () {
                    context.read<AuthBloc>().add(IsVisiblePassword());
                  },
                  loginNavigationTap: () {
                    Navigator.pop(context);
                  },
                  onGoogleTap: () {},
                  onSignUpTap: () {
                    // Trigger password validation event
                    context
                        .read<AuthBloc>()
                        .add(PasswordValidator(passwordControllers.text));

                    // Wait for state to update
                    Future.delayed(const Duration(milliseconds: 300), () {
                      // Proceed if password is valid and form is valid
                      if (_formKey.currentState?.validate() == true &&
                          state.passwordError == null) {
                        Navigator.pushReplacementNamed(
                          context,
                          RouteName.documentUploadScreen,
                          arguments: DocumentUploadScreenArgument(
                            emailController: emailControllers,
                            nameController: nameControllers,
                            passwordController: passwordControllers,
                            phoneController: phoneNoControllers,
                            role: widget.signUpAs,
                          ),
                        );
                      }
                    });
                  },
                  emailControllers: emailControllers,
                  nameControllers: nameControllers,
                  passwordControllers: passwordControllers,
                  phoneNoControllers: phoneNoControllers,
                ));
              },
            )),
      ),
    );
  }
}

class SignupScreenArguemnt {
  final String? signUpAs;
  SignupScreenArguemnt({this.signUpAs});
}
