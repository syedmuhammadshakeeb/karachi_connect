import 'package:flutter/material.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class AboutProfile extends StatelessWidget {
  const AboutProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.bgImage), fit: BoxFit.cover)),
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'About Me:',
              style: AppTextStyles.black28w600,
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text:
                  '''Here’s a concise text for the "About" section of an entrepreneur with experience in software development:I am an experienced entrepreneur with a strong background in software development. Over the years, I've built and led a successful software house, delivering innovative and efficient solutions for a diverse range of clients. My expertise spans backend development, system integrations, and application development, with a focus on creating high-performance, scalable software products.I believe in leveraging technology to solve complex business problems and improve operational efficiency. With a passion for staying ahead of industry trends, I am constantly exploring new technologies and methodologies to ensure the solutions I deliver are cutting-edge and impactful.As a founder, I have honed my skills in project management, team leadership, and client relations, ensuring that every project is executed to the highest standards. My mission is to continue driving growth and delivering software solutions that make a real difference in the world. Feel free to tweak it further based on your personal achievements or focus areas!''',
              style: AppTextStyles.black18w500,
            ),
          ],
        ),
      ),
    );
  }
}
