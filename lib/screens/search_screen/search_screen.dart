import 'package:flutter/material.dart';
import 'package:karachi_connect/component/text/custom_text.dart';

import 'package:karachi_connect/screens/search_screen/component/search_appbar.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: SearchAppbar(
            onChanged: (search) {
              // Handle search input
              print("Search input: $search");
            },
            searchController: searchController,
            onCancelTap: () {
              searchController.clear();
              Navigator.pop(context);
            },
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.bgImage), fit: BoxFit.fill)),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CustomText(
                text: "Search your favourite posts here",
                style: AppTextStyles.black18w700,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
