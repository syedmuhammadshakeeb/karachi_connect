import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_bloc.dart';
import 'package:karachi_connect/bloc/investor_bloc.dart/investor_bloc.dart';
import 'package:karachi_connect/bloc/investor_bloc.dart/investor_event.dart';
import 'package:karachi_connect/bloc/investor_bloc.dart/investor_state.dart';
import 'package:karachi_connect/component/loading_component/loading_component.dart';
import 'package:karachi_connect/component/profile_component/follow_profile_card.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/enviremnt/enviroment.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class MemberScreen extends StatefulWidget {
  const MemberScreen({super.key});

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<InvestorBloc>().add(GetInvestorEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    print("role ${AuthBloc.userRole}");
    return Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: AppColors.blueEC,
            title: const CustomText(
              text: 'Members',
              style: AppTextStyles.black22wbold,
            ),
          ),
        ),
        body: BlocBuilder<InvestorBloc, InvestorState>(
          builder: (context, state) {
            final investors = state.investorData;
            if (state.isLoading == true) {
              return const LoadingComponent();
            }
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.bgImage), fit: BoxFit.cover),
              ),
              child: ListView.builder(
                  itemCount: investors?.length ?? 0,
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  itemBuilder: (context, index) {
                    final investorData = investors?[index];
                    print("investers: ${investorData?.name}");
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: FollowProfileCard(
                        followers: investorData?.role,
                        image: AppImages.person,
                        onFollowTap: () {},
                        onTap: () {},
                        profileName: investorData?.name ?? '',
                      ),
                    );
                  }),
            );
          },
        ));
  }
}
