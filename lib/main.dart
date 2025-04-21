import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:karachi_connect/firebase_options.dart';
import 'package:karachi_connect/routes/route_name.dart';
import 'package:karachi_connect/routes/routes.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:RouteName.splashScreen,
  onGenerateRoute: Routes.generateRoute,
   
    );
  }
}
