import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karachi_connect/firebase_options.dart';
import 'package:karachi_connect/routes/route_name.dart';
import 'package:karachi_connect/routes/routes.dart';
import 'package:karachi_connect/utils/constants/colors.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor:
        Colors.transparent, // Make the status bar transparent (optional)
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor:
        AppColors.transparent, // Set the icons to black
    systemNavigationBarColor:
        Colors.transparent, // Set the bottom navigation bar color (optional)
    systemNavigationBarIconBrightness: Brightness
        .dark, // Set the icons of the bottom navigation to black (optional)
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
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
