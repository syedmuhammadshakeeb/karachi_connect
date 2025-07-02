import 'package:flutter/material.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/screens/detail_post_screen/component/detail_post_screen_ui.dart';
import 'package:karachi_connect/utils/constants/colors.dart';

import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class CustomScroll extends StatefulWidget {
  final String? title, summery, discription;
  const CustomScroll({super.key, this.title, this.summery, this.discription});

  @override
  State<CustomScroll> createState() => _CustomScrollState();
}

class _CustomScrollState extends State<CustomScroll> {
  ScrollController scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();

    // Add the scroll listener after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.addListener(_scrollListener);
    });
  }

  void _scrollListener() {
    double threshold = 200; // Adjust the threshold for responsiveness
    if (scrollController.offset > threshold && !_isScrolled && mounted) {
      setState(() {
        _isScrolled = true;
      });
    } else if (scrollController.offset <= threshold && _isScrolled && mounted) {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  void dispose() {
    // Dispose the ScrollController when the widget is disposed
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            floating: true,
            centerTitle: true,
            automaticallyImplyLeading: false,
            pinned: true,
            backgroundColor: AppColors.blueEC,
            leading: _isScrolled == false
                ? InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios,
                        color: AppColors.white))
                : InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios,
                        color: AppColors.black)),
            title: _isScrolled == false
                ? null
                : CustomText(
                    text: widget.title ?? '',
                    style: AppTextStyles.black18w500,
                  ),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:
                  const EdgeInsets.only(right: 20, bottom: 20, left: 20),
              title: _isScrolled
                  ? null
                  : const CustomText(
                      text: 'Scroll to Read',
                      style: AppTextStyles.white25w600,
                    ),
              background: Image.asset(
                AppImages.garden,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Add more Sliver widgets here
          SliverToBoxAdapter(
              child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.bgImage), fit: BoxFit.cover),
            ),
            child: DetailPostScreenUi(
              title: widget.title,
              summery: widget.summery,
              discription: widget.discription,
            ),
          ))
        ],
      ),
    );
  }
}
