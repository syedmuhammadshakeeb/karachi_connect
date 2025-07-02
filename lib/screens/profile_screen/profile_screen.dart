import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_bloc.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_event.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_state.dart';
import 'package:karachi_connect/bloc/post_bloc/post_bloc.dart';
import 'package:karachi_connect/bloc/post_bloc/post_event.dart';
import 'package:karachi_connect/bloc/post_bloc/post_state.dart';
import 'package:karachi_connect/component/custom_sliver_scroll/custom_sliver_scroll_widget.dart';
import 'package:karachi_connect/component/loading_component/loading_component.dart';
import 'package:karachi_connect/screens/profile_screen/component/about_profile.dart';

import 'package:karachi_connect/screens/profile_screen/component/profile_body.dart';
import 'package:karachi_connect/screens/profile_screen/component/work_experience_user.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/enviremnt/enviroment.dart';

class ProfileScreen extends StatefulWidget {
  final bool isFollow;
  final String? id;
  const ProfileScreen({super.key, this.isFollow = false, this.id});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<PostBloc>()
          .add(GetPostData(id: widget.id ?? AuthBloc.userId));
      context
          .read<AuthBloc>()
          .add(GetUserDataEvent(id: widget.id ?? AuthBloc.userId));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, postState) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (postState.isLoading == true) {
              return const LoadingComponent();
            }
            return Scaffold(
              body: CustomSliverScrollWidget(
                screens: const [
                  ProfileBody(),
                  WorkExperienceUser(),
                  AboutProfile(),
                ],
                coverImage: AppImages.garden,
                dob: 'Born November 7, 1987',
                following: '133',
                followrs: '154',
                joinedDate: 'Joined November 2010',
                location: 'Earth',
                link: 'neprokin.com',
                profession: AuthBloc.userRole == Enviroment.investor
                    ? 'Investor'
                    : 'Entrepreneur',
                profileImage: AuthBloc.userProfile ?? AppImages.profileImage,
                profileText: 'Stas Neprokin',
                tabText: [
                  'Posts',
                  AuthBloc.userRole == Enviroment.investor
                      ? 'Invested Companies'
                      : 'Work Experince',
                  'About'
                ],
                userBio: AuthBloc.userRole == Enviroment.investor
                    ? 'Founder of Neprokin'
                    : 'Designing Products that Users Love',
                userName: AuthBloc.userEmail?.split('@')[0],
                userTitle: AuthBloc.userName,
              ),
            );
          },
        );
      },
    );
  }
}

class ProfileScreenArguments {
  final bool isFollow;
  final String? id;
  ProfileScreenArguments({required this.isFollow, this.id});
}
