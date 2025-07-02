import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/members_bloc.dart/memberr_bloc.dart';
import 'package:karachi_connect/bloc/members_bloc.dart/members_event.dart';
import 'package:karachi_connect/bloc/members_bloc.dart/members_state.dart';
import 'package:karachi_connect/component/profile_component/follow_profile_card.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/routes/route_name.dart';
import 'package:karachi_connect/screens/profile_screen/profile_screen.dart';

import 'package:karachi_connect/screens/search_screen/component/search_appbar.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<MembersBloc>().add(GetInvestorEvent());
    // });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return BlocBuilder<MembersBloc, MembersState>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: SearchAppbar(
                onChanged: (search) {
                  context
                      .read<MembersBloc>()
                      .add(GetInvestorEvent(searchQuery: search));
                },
                searchController: searchController,
                onCancelTap: () {
                  searchController.clear();
                  context.read<MembersBloc>().add(GetInvestorEvent());
                  Navigator.pop(context);
                },
              )),
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.bgImage), fit: BoxFit.fill)),
              child: BlocBuilder<MembersBloc, MembersState>(
                builder: (context, state) {
                  if (state.membersData == null) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: CustomText(
                          text: "Search Members",
                          style: AppTextStyles.black18wbold,
                        ),
                      ),
                    );
                  }
                  return ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: CustomText(
                          text: 'Search Results',
                          style: AppTextStyles.black20w700,
                        ),
                      ),
                      ListView.builder(
                          itemCount: state.membersData?.length,
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 20),
                          itemBuilder: (context, index) {
                            final data = state.membersData?[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: FollowProfileCard(
                                followers: data?.role,
                                image: AppImages.person,
                                onFollowTap: () {},
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteName.profileScreen,
                                      arguments: ProfileScreenArguments(
                                          isFollow: true));
                                },
                                profileName: data?.name ?? '',
                              ),
                            );
                          }),
                    ],
                  );
                },
              )),
        );
      },
    );
  }
}
