import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:karachi_connect/routes/route_name.dart';
import 'package:karachi_connect/routes/routes.dart';

import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/functions/list_of_bloc.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

BuildContext? globalContext = navigatorKey.currentContext;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: AppColors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(
    MultiBlocProvider(
      providers: ListOfBloc().listOfBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.dark,
                  statusBarColor: AppColors.transparent,
                  statusBarIconBrightness: Brightness.dark))),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
