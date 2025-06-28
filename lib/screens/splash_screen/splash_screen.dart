
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_bloc.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_event.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_state.dart';
import 'package:karachi_connect/component/app_name/app_name.dart';

import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/icons.dart';
import 'package:karachi_connect/utils/constants/images.dart';

import '../../routes/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
     context.read<AuthBloc>().add(IsAuthenticated());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
       
       
          print("isauthticated: ${state.isauthticated}");
          if (state.isauthticated ?? false) {
            Navigator.pushReplacementNamed(context, RouteName.main);
          } else {
            Navigator.pushReplacementNamed(context, RouteName.loginScreen);
          }
        
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.bgImage), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: SvgPicture.asset(
                AppIcons.splashIcon,
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              const Align(alignment: Alignment.center, child: AppName())
            ],
          ),
        ),
      ),
    );
  }
}
