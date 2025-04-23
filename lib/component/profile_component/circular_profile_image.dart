import 'package:flutter/material.dart';

class CircularProfileImage extends StatelessWidget {
  final double? height, width;
  final String? image;
  const CircularProfileImage({super.key, this.height, this.width, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration:  BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(image ??""), fit: BoxFit.cover)),
    );
  }
}
