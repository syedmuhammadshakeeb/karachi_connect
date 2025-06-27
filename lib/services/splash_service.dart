import 'dart:async';

import 'package:flutter/material.dart';
import 'package:karachi_connect/routes/route_name.dart';

class SplashService {
  void splashService(context) async {
    await Timer.periodic(const Duration(seconds: 5), (val) {
      Navigator.pushReplacementNamed(context, RouteName.loginScreen);
    });
  }
}
