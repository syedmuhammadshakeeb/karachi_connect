import 'package:flutter/material.dart';
import 'package:karachi_connect/component/auth_appbar/auth_appbar.dart';
import 'package:karachi_connect/component/auth_screen_component/auth_screen_component.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50), child: AuthAppbar()),
        body: Center(child: AuthScreenComponent()));
  }
}
