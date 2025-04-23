import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/tab_bar_bloc/tabbar_bloc.dart';
import 'package:karachi_connect/bloc/tab_bar_bloc/tabbar_events.dart';
import 'package:karachi_connect/bloc/tab_bar_bloc/tabbar_states.dart';
import 'package:karachi_connect/component/app_bar/app_bar.dart';
import 'package:karachi_connect/component/home_post_card/home_post_card.dart';
import 'package:karachi_connect/component/home_post_header/home_post_header.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.transparent,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: BlocBuilder<TabbarBloc, TabbarStates>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: CustomAppBar(
                  searchTap: () {},
                  notificationTap: () {},
                  chatTap: () {
                    context.read<TabbarBloc>().add(TabValueSelector(3));
                  },
                  isChatIcon: true,
                  isNotification: true,
                  isSearchIcon: true,
                ),
              );
            },
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.bgImage), fit: BoxFit.cover)),
        child: ListView(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
          children: [
            BlocBuilder<TabbarBloc, TabbarStates>(
              builder: (context, state) {
                return HomePostHeader(
                  onTap: () {
                    context.read<TabbarBloc>().add(TabValueSelector(2));
                  },
                  hpadding: 30,
                );
              },
            ),
            ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: 5,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: HomePostCard(),
                  );
                })
          ],
        ),
      ),
    );
  }
}
