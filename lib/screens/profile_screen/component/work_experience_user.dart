import 'package:flutter/material.dart';
import 'package:karachi_connect/component/loading_image/loading_image.dart';
import 'package:karachi_connect/component/text/custom_text.dart';
import 'package:karachi_connect/utils/constants/colors.dart';
import 'package:karachi_connect/utils/constants/images.dart';
import 'package:karachi_connect/utils/styles/text_styles.dart';

class WorkExperienceUser extends StatelessWidget {
  const WorkExperienceUser({super.key});

  @override
  Widget build(BuildContext context) {
    List images = [
      AppImages.klabsLogo,
      AppImages.koderlabLogo,
      AppImages.quanrioLogo
    ];
    List companyNAme = [
      'K-Labs pvt ltd',
      'Koderlab pvt ltd',
      'Quanrio pvt ltd'
    ];
    List designation = [
      'Junior Software Engineer',
      'Associate Software Engineer',
      'Intern Software Engineer'
    ];
    List duration = ['2022-2023', '2021-2022', '2020-2021'];
    List location = ['Karachi', 'Karachi', 'Karachi'];

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.bgImage), fit: BoxFit.cover)),
      child: ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: LoadingImage(
                          image: images[index],
                          height: 50,
                          width: 50,
                        ),
                        title: CustomText(
                          text: companyNAme[index],
                          style: AppTextStyles.black18w700,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: designation[index],
                              style: AppTextStyles.black18w700,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text:
                                  'Duration: ${duration[index]} | Location: ${location[index]}',
                              style: AppTextStyles.black15w500,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
