import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/visilibilty_icon_bloc/visibility_bloc.dart';
import 'package:karachi_connect/bloc/visilibilty_icon_bloc/visibility_state.dart';
import 'package:karachi_connect/bloc/visilibilty_icon_bloc/visiblity_event.dart';
import 'package:karachi_connect/component/auth_screen_component/auth_screen_component.dart';
import 'package:karachi_connect/routes/route_name.dart';
import 'package:karachi_connect/utils/enviremnt/enviroment.dart';

class SignupScreen extends StatelessWidget {
  final String? signUpAs;
  const SignupScreen({super.key, this.signUpAs});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VisibilityBloc(),
      child: Scaffold(
          extendBodyBehindAppBar: true,
          body: BlocBuilder<VisibilityBloc, VisibilityState>(
            builder: (context, state) {
              return Center(
                  child: AuthScreenComponent(
                isSignInAuth: true,
                suffixIcon: [
                  const SizedBox.shrink(),
                  InkWell(
                      onTap: () {
                        context.read<VisibilityBloc>().add(IsVisiblePassword());
                      },
                      child: state.isVisible == true
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility)),
                  const SizedBox.shrink(),
                ],
                prefixicon: const [
                  Icon(Icons.alternate_email_sharp),
                  Icon(Icons.lock_outline),
                  Icon(Icons.lock_outline)
                ],
                authTap: () {
                  if (signUpAs == Enviroment.investor) {
                    Navigator.pushNamed(
                        context, RouteName.documentUploadScreen);
                  } else {
                    Navigator.pushNamed(context, RouteName.loginScreen);
                  }
                },
                credentialText: const ['Email', 'Password', 'Confirm Password'],
                descripText: 'Enter your detail blow',
                obscureText: [false, state.isVisible, state.isVisible],
                onVisisbiltTap: () {
                  context.read<VisibilityBloc>().add(IsVisiblePassword());
                },
                haveAcoountOrNot: 'Already have an account?',
                signText: 'Sign In',
                signinTap: () {
                  Navigator.pushNamed(context, RouteName.loginScreen);
                },
                loginText: 'Sign Up',
                loginWithGoogleText: 'Login with phone Google',
                otherLoginText: 'Or sign in with',
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
