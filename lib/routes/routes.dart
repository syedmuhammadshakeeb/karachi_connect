import 'package:flutter/material.dart';
import 'package:karachi_connect/main.dart' as RouteName;
import 'package:karachi_connect/screens/main_screen/main_screen.dart';
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


class Routes{
static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.main:
        return getPageRoute(const MainScreen(),
            transition: PageTransitionType.fade);
      default:
        return getPageRoute(const MainScreen(),
            transition: PageTransitionType.fade);
    }
}

}