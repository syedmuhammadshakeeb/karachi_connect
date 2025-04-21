import 'package:flutter/material.dart';
import 'package:karachi_connect/routes/route_name.dart';
import 'package:karachi_connect/screens/login_screen/login_screen.dart';

import 'package:karachi_connect/screens/main_screen/main_screen.dart';
import 'package:karachi_connect/screens/sign_up_screen/signup_screen.dart';
import 'package:karachi_connect/screens/splash_screen/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

PageRoute getPageRoute(Widget child,
    {PageTransitionType? transition, int duration = 300}) {
  return PageTransition(
      child: child,
      childCurrent: child,
      type: transition ?? PageTransitionType.rightToLeft,
      duration: Duration(milliseconds: duration),
      reverseDuration: const Duration(milliseconds: 250),
      maintainStateData: true, // Keep previous screen static
      fullscreenDialog: true, // Ensures only the new page animates
      opaque: false,
      alignment: Alignment.center);
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.main:
        return getPageRoute(const MainScreen(),
            transition: PageTransitionType.fade);
      case RouteName.loginScreen:
        return getPageRoute(const LoginScreen(),
            transition: PageTransitionType.fade);
      case RouteName.signUpScreen:
        return getPageRoute(const SignupScreen(),
            transition: PageTransitionType.fade);
      case RouteName.splashScreen:
        return getPageRoute(const SplashScreen(),
            transition: PageTransitionType.fade);
      default:
        throw Exception('Page not found: ${settings.name}'); 
    }
  }
}
