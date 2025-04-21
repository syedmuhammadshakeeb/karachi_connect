import 'package:flutter/material.dart';
import 'package:karachi_connect/component/auth_appbar/auth_appbar.dart';
import 'package:karachi_connect/component/auth_screen_component/auth_screen_component.dart';
import 'package:karachi_connect/routes/route_name.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AuthAppbar(
              onTap: () {
                Navigator.pushNamed(context, RouteName.signUpScreen);
              },
              dontHaveAccount: true,
              onLeadingIconTap: () {
                Navigator.pop(context);
              },
              buttonText: 'Get Started',
              haveAccountText: 'Dom\'t have an account?',
              getstarted: true,
              leadingIcon: Icons.arrow_back_ios_new_rounded,
            )),
        body: const Center(
            child: AuthScreenComponent(
          isSignInAuth: true,
          suffixIcon: [SizedBox.shrink(), Icon(Icons.visibility)],
          prefixicon: [Icon(Icons.email), Icon(Icons.lock_outline)],
          credentialText: ['Email', 'Password'],
          descripText: 'Enter your detail blow',
          forgetPasswordText: 'Forgot your password?',
          loginText: 'Sign In',
          loginWithPhoneText: 'Login with phone no.',
          mainText: 'Karachi Connect',
          otherLoginText: 'Or sign in with',
          welcomText: 'Wellcome back',
        )));
  }
}
