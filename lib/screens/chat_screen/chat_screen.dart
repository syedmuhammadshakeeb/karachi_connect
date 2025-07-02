import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:karachi_connect/bloc/chat_bloc/chat_bloc.dart';
import 'package:karachi_connect/bloc/chat_bloc/chat_state.dart';
import 'package:karachi_connect/bloc/members_bloc.dart/memberr_bloc.dart';
import 'package:karachi_connect/bloc/members_bloc.dart/members_event.dart';
import 'package:karachi_connect/bloc/members_bloc.dart/members_state.dart';
import 'package:karachi_connect/component/chat_component/chat_profile_card.dart';
import 'package:karachi_connect/component/custom_text_field/custom_text_field.dart';
import 'package:karachi_connect/component/loading_component/loading_component.dart';
import 'package:karachi_connect/component/loading_image/loading_image.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/model/user_model/user_model.dart';
import 'package:karachi_connect/routes/route_name.dart';
import 'package:karachi_connect/screens/chatting_screen/chatting_screen.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/icons.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<MembersBloc>().add(GetInvestorEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.blueEC.withValues(alpha: 0.8),
          title: const CustomText(
            text: 'Inbox',
            style: AppTextStyles.black22wbold,
          ),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0)
                    .copyWith(bottom: 10),
                child: CustomTextField(
                  hintText: 'Search...',
                  onChanged: (value) {
                    context
                        .read<MembersBloc>()
                        .add(GetInvestorEvent(searchQuery: value));
                  },
                  fieldColor: AppColors.blueEC.withValues(alpha: 0.05),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0).copyWith(left: 20),
                    child: const LoadingImage(
                      image: AppIcons.searchField,
                      color: AppColors.blue07,
                      height: 24,
                      width: 24,
                    ),
                  ),
                  borderColor: AppColors.blue07,
                  textStyle: AppTextStyles.blue14w500,
                ),
              )),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.bgImage), fit: BoxFit.cover),
          ),
          child: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, chatstate) {
              return BlocBuilder<MembersBloc, MembersState>(
                builder: (context, state) {
                  List<UserModel> sortedMembers =
                      List.from(state.membersData ?? []);
                  sortedMembers.sort((a, b) {
                    // Compare timestamps for each member (if they exist)
                    DateTime? aTimestamp = chatstate.userLastTimestamps?[a.id];
                    DateTime? bTimestamp = chatstate.userLastTimestamps?[b.id];
                    if (aTimestamp != null && bTimestamp != null) {
                      return aTimestamp
                          .compareTo(bTimestamp); // Sort in ascending order
                    }
                    return 0; // Default to no change if timestamps are missing
                  });
                  if (state.isLoading == true) {
                    return const LoadingComponent();
                  }
                  return ListView.builder(
                      itemCount: state.membersData?.length ?? 0,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0)
                          .copyWith(top: 20),
                      itemBuilder: (context, index) {
                        String userId = state.membersData?[index].id ?? '';
                        String lastMessage =
                            chatstate.userLastMessages?[userId] ??
                                'No messages yet';
                        DateTime? lastTimestamp =
                            chatstate.userLastTimestamps?[userId];

                        // Format the timestamp to 12-hour format (e.g., 3:09 AM or PM)
                        String formattedTime = '';
                        if (lastTimestamp != null) {
                          formattedTime =
                              DateFormat('h:mm a').format(lastTimestamp);
                        }
                        print("formated time $formattedTime");
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: ChatProfileCard(
                            lastMessage: lastMessage,
                            profileName: state.membersData?[index].name ?? '',
                            time: formattedTime,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteName.chattingScreen,
                                  arguments: ChattingScreenArgument(
                                    name: state.membersData?[index].name ?? '',
                                    userId: state.membersData?[index].id ?? '',
                                  ));
                            },
                            image: AppImages.person,
                            onlineColor: AppColors.blue07,
                          ),
                        );
                      });
                },
              );
            },
          )),
    );
  }
}
