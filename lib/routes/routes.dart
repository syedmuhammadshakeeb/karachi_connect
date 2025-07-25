import 'package:flutter/material.dart';
import 'package:karachi_connect/routes/route_name.dart';
import 'package:karachi_connect/screens/account_sucessfull_screen/account_sucessfull_screen.dart';
import 'package:karachi_connect/screens/asking_signin_screen/asking_signin_screen.dart';
import 'package:karachi_connect/screens/chatting_screen/chatting_screen.dart';
import 'package:karachi_connect/screens/detail_post_screen/detail_post_screen.dart';
import 'package:karachi_connect/screens/document_upload_screen/document_upload_screen.dart';
import 'package:karachi_connect/screens/login_screen/login_screen.dart';

import 'package:karachi_connect/screens/main_screen/main_screen.dart';
import 'package:karachi_connect/screens/profile_screen/profile_screen.dart';
import 'package:karachi_connect/screens/search_screen/search_screen.dart';
import 'package:karachi_connect/screens/sign_up_screen/signup_screen.dart';
import 'package:karachi_connect/screens/splash_screen/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

PageRoute getPageRoute(Widget child,
    {PageTransitionType? transition, int duration = 500}) {
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
            transition: PageTransitionType.leftToRight);
      case RouteName.profileScreen:
      ProfileScreenArguments args = settings.arguments as ProfileScreenArguments;
        return getPageRoute( ProfileScreen(
          isFollow: args.isFollow,
          id: args.id,
        ),
            transition: PageTransitionType.leftToRight);
      case RouteName.detailPostScreen:
        DetailPostArgument args = settings.arguments as DetailPostArgument;
        return getPageRoute(
            DetailPostScreen(
              discription: args.discription,
              summery: args.summery,
              title: args.title,
            ),
            transition: PageTransitionType.leftToRight);
      case RouteName.searchScreen:
        return getPageRoute(const SearchScreen(),
            transition: PageTransitionType.leftToRight);
      case RouteName.loginScreen:
        return getPageRoute(const LoginScreen(),
            transition: PageTransitionType.leftToRight);
      case RouteName.accountSucessfullScreen:
        return getPageRoute(const AccountSucessfullScreen(),
            transition: PageTransitionType.leftToRight);
      case RouteName.documentUploadScreen:
        DocumentUploadScreenArgument args =
            settings.arguments as DocumentUploadScreenArgument;
        return getPageRoute(
            DocumentUploadScreen(
              nameController: args.nameController,
              passwordController: args.passwordController,
              phoneController: args.phoneController,
              emailController: args.emailController,
              profileImage: args.profileImage,
              role: args.role,
            ),
            transition: PageTransitionType.leftToRight);
      case RouteName.chattingScreen:
        ChattingScreenArgument args =
            settings.arguments as ChattingScreenArgument;
        return getPageRoute(
            ChattingScreen(
              name: args.name,
              userId: args.userId,
            ),
            transition: PageTransitionType.leftToRight);
      case RouteName.signUpScreen:
        SignupScreenArguemnt args = settings.arguments as SignupScreenArguemnt;
        return getPageRoute(
            SignupScreen(
              signUpAs: args.signUpAs,
            ),
            transition: PageTransitionType.leftToRight);

      case RouteName.splashScreen:
        return getPageRoute(const SplashScreen(),
            transition: PageTransitionType.leftToRight);
      case RouteName.askingSignInScreen:
        return getPageRoute(const AskingSigninScreen(),
            transition: PageTransitionType.leftToRight);
      default:
        throw Exception('Page not found: ${settings.name}');
    }
  }
}
