import 'package:flutter/material.dart';
import 'package:karachi_connect/component/custom_scroll/custom_scroll.dart';

class DetailPostScreen extends StatelessWidget {
  final String? title, summery, discription;
  const DetailPostScreen(
      {super.key, this.discription, this.summery, this.title});

  @override
  Widget build(BuildContext context) {
    return CustomScroll(
      discription: discription,
      summery: summery,
      title: title,
    );
  }
}

class DetailPostArgument {
  final String? title, summery, discription;
  const DetailPostArgument({this.discription, this.summery, this.title});
}
