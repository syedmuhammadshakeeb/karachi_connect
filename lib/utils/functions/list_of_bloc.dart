import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_bloc.dart';
import 'package:karachi_connect/bloc/investor_bloc.dart/investor_bloc.dart';

class ListOfBloc {
  List<BlocProvider> listOfBloc() => [
     BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(), 
        ),
     BlocProvider<InvestorBloc>(
          create: (context) => InvestorBloc(), 
        ),
  ];
}