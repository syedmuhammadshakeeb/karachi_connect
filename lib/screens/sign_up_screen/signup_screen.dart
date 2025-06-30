import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_bloc.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_event.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_state.dart';

import 'package:karachi_connect/routes/route_name.dart';
import 'package:karachi_connect/screens/document_upload_screen/document_upload_screen.dart';
import 'package:karachi_connect/screens/sign_up_screen/component/sign_up_ui.dart';
import 'package:karachi_connect/utils/enviremnt/enviroment.dart';

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
            body: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state.isSucess == true) {
                  Navigator.pushReplacementNamed(
                      context, RouteName.loginScreen);
                }
              },
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Center(
                      child: SignUpUi(
                        onImageTap:(){
                          context.read<AuthBloc>().add(ProfileImagePicker());
                        } ,
                        image:state.path ,
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
                            context
                                .read<AuthBloc>()
                                .add(PasswordValidator(value));
                          },
                          phoneValidator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Please enter phone number';
                            }
                            if ((value?.length) != 12) {
                              return 'Please enter valid phone number';
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
                            context.read<AuthBloc>().add(
                                PasswordValidator(passwordControllers.text));
                            if (widget.signUpAs == Enviroment.investor) {
                              // Wait for state to update
                              Future.delayed(const Duration(milliseconds: 300),
                                  () {
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
                            } else {
                              if (_formKey.currentState?.validate() == true) {
                                context.read<AuthBloc>().add(SignupEvent(
                                      email: emailControllers,
                                      password: passwordControllers,
                                      name: nameControllers,
                                      phoneNo: phoneNoControllers,
                                      role: widget.signUpAs,
                                    ));
                              }
                            }
                          }));
                },
              ),
            )),
      ),
    );
  }
}

class SignupScreenArguemnt {
  final String? signUpAs;
  SignupScreenArguemnt({this.signUpAs});
}
