import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/tab_bar_bloc/tabbar_bloc.dart';
import 'package:karachi_connect/bloc/tab_bar_bloc/tabbar_events.dart';
import 'package:karachi_connect/bloc/tab_bar_bloc/tabbar_states.dart';
import 'package:karachi_connect/component/loading_image/loading_image.dart';
import 'package:karachi_connect/screens/chat_screen/chat_screen.dart';
import 'package:karachi_connect/screens/home_screen/home_screen.dart';
import 'package:karachi_connect/screens/members_screen/member_screen.dart';
import 'package:karachi_connect/screens/post_screen/create_post_screen.dart';
import 'package:karachi_connect/screens/profile_screen/profile_screen.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/navbar_icons_label.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabbarBloc(),
      child: DefaultTabController(
        length: NavbarIconsLabel.navbarLength(),
        child: Scaffold(
          bottomNavigationBar: BlocBuilder<TabbarBloc, TabbarStates>(
            builder: (context, state) {
              return CurvedNavigationBar(
                animationCurve: Curves.ease,
                index: state.tabValue,
                backgroundColor: AppColors.transparent,
                animationDuration: const Duration(milliseconds: 500),
                buttonBackgroundColor: AppColors.blue07.withValues(alpha: 0.3),
                color: AppColors.blue07.withValues(alpha: 0.3),
                items: List.generate(
                    NavbarIconsLabel.navbarLength(),
                    (index) => bottomNavBarItem(
                          color: state.tabValue == index
                              ? AppColors.black
                              : AppColors.grey65,
                          image: NavbarIconsLabel.navbarIcon(
                              isInvestor: true)[index],
                        )),
                onTap: (val) {
                  context.read<TabbarBloc>().add(TabValueSelector(val));
                },
              );
            },
          ),
          body: BlocBuilder<TabbarBloc, TabbarStates>(
            builder: (context, state) {
              return state.tabValue == 0
                  ? const HomeScreen()
                  : state.tabValue == 1
                      ? const MemberScreen()
                      : state.tabValue == 2
                          ? const CreatePostScreen()
                          : state.tabValue == 3
                              ? const ChatScreen()
                              : const ProfileScreen();
            },
          ),
        ),
      ),
    );
  }

  CurvedNavigationBarItem bottomNavBarItem({
    String? image,
    Color? color,
  }) {
    return CurvedNavigationBarItem(
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
              color: AppColors.blueEC, shape: BoxShape.circle),
          child: Center(
            child: LoadingImage(
              image: image,
              height: 24,
              width: 24,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
