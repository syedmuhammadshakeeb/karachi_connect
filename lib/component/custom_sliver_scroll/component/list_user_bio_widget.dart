import 'package:flutter/material.dart';
import 'package:karachi_connect/bloc/auth_bloc/auth_bloc.dart';
import 'package:karachi_connect/component/custom_sliver_scroll/component/user_bio_component.dart';
import 'package:karachi_connect/utils/constants/icons.dart';
import 'package:karachi_connect/utils/enviremnt/enviroment.dart';

class ListUserBioWidget extends StatelessWidget {
  const ListUserBioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: List.generate(
              userBioIconAndText().length,
              (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 4.0, right: 12),
                    child: UserBioComponent(
                      icon: userBioIconAndText()[index]['icon'],
                      text: userBioIconAndText()[index]['text'],
                    ),
                  )),
        ),
        Row(
          children: List.generate(
              userBioIconAndText2().length,
              (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 4.0, right: 12),
                    child: UserBioComponent(
                      icon: userBioIconAndText2()[index]['icon'],
                      text: userBioIconAndText2()[index]['text'],
                    ),
                  )),
        ),
      ],
    );
  }
}

List<Map<String, dynamic>> userBioIconAndText() {
  return [
    {
      'icon': AppIcons.professionIcon,
      'text': AuthBloc.userRole == Enviroment.investor
          ? 'Investor'
          : 'Entrepreneur',
    },
    {
      'icon': AppIcons.locationIcon,
      'text': 'Earth',
    },
    {
      'icon': AppIcons.portfolioLinkIcon,
      'text': 'neprokin.com',
    },
  ];
}

List<Map<String, dynamic>> userBioIconAndText2() {
  return [
    {
      'icon': AppIcons.dobIcon,
      'text': 'Born November 7, 1987',
    },
    {
      'icon': AppIcons.dateIcon,
      'text': 'Joined November 2010',
    },
  ];
}
