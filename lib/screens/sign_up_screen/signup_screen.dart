import 'package:flutter/material.dart';
import 'package:karachi_connect/component/auth_appbar/auth_appbar.dart';
import 'package:karachi_connect/component/auth_screen_component/auth_screen_component.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AuthAppbar(
              onTap: () {
                
              },
              dontHaveAccount: true,
              onLeadingIconTap: () {
                Navigator.pop(context);
              },
              buttonText: 'Sign In',
              haveAccountText: 'Already have an account?',
              getstarted: true,
              leadingIcon: Icons.arrow_back_ios_new_rounded,
            )),
        body: const Center(
            child: AuthScreenComponent(
          isSignInAuth: true,
          suffixIcon: [
            SizedBox.shrink(),
            Icon(Icons.visibility),
            Icon(Icons.visibility)
          ],
          prefixicon: [
            Icon(Icons.email),
            Icon(Icons.lock_outline),
            Icon(Icons.lock_outline)
          ],
          credentialText: ['Email', 'Password', 'Confirm Password'],
          descripText: 'Enter your detail blow',
          loginText: 'Sign Up',
          loginWithPhoneText: 'Login with phone no.',
          mainText: 'Karachi Connect',
          otherLoginText: 'Or sign in with',
          welcomText: 'Get started',
        )));
  }
}
