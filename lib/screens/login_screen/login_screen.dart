import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/visilibilty_icon_bloc/visibility_bloc.dart';
import 'package:karachi_connect/bloc/visilibilty_icon_bloc/visibility_state.dart';
import 'package:karachi_connect/bloc/visilibilty_icon_bloc/visiblity_event.dart';
import 'package:karachi_connect/component/auth_appbar/auth_appbar.dart';
import 'package:karachi_connect/component/auth_screen_component/auth_screen_component.dart';
import 'package:karachi_connect/routes/route_name.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VisibilityBloc(),
      child: Scaffold(
          extendBodyBehindAppBar: true,
          body: BlocBuilder<VisibilityBloc, VisibilityState>(
            builder: (context, state) {
              return AuthScreenComponent(
                isSignInAuth: true,
                onforgetPasswordTap: () {},
                suffixIcon: [
                  const SizedBox.shrink(),
                  InkWell(
                      onTap: () {
                        context.read<VisibilityBloc>().add(IsVisiblePassword());
                      },
                      child: state.isVisible == true
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility))
                ],
                prefixicon: const [
                  Icon(Icons.alternate_email),
                  Icon(Icons.lock_outline)
                ],
                credentialText: const ['Email', 'Password'],
                obscureText: [false, state.isVisible],
                descripText: 'Enter your detail blow',
                haveAcoountOrNot: 'Don\'t have an account?',
                signText: ' Sign Up',
                forgetPasswordText: 'Forgot your password?',
                loginText: 'Sign In',
                loginWithGoogleText: 'Sign In with Google',
                otherLoginText: 'Or sign in with',
                signinTap: () {
                  Navigator.pushNamed(context, RouteName.askingSignInScreen);
                },
                welcomText: 'Wellcome back',
              );
            },
          )),
    );
  }
}
