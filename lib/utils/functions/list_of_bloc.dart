import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_bloc.dart';
import 'package:karachi_connect/bloc/chat_bloc/chat_bloc.dart';
import 'package:karachi_connect/bloc/members_bloc.dart/memberr_bloc.dart';
import 'package:karachi_connect/bloc/post_bloc/post_bloc.dart';

class ListOfBloc {
  List<BlocProvider> listOfBloc() => [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        BlocProvider<MembersBloc>(
          create: (context) => MembersBloc(),
        ),
        BlocProvider<PostBloc>(
          create: (context) => PostBloc(),
        ),
        BlocProvider<ChatBloc>(
          create: (context) => ChatBloc(),
        ),
      ];
}
