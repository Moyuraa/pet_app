import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:final_project/style/size_config.dart';
import 'package:final_project/style/app_styles.dart';

class PetDetailPage extends StatelessWidget {
  final String imageCoverURL;
  final String petName;
  final String location;
  final String age;
  final String color;
  final String weight;
  final String introduction;
  final String imageDis1URL;
  final String imageDis2URL;
  final String imageDis3URL;

  const PetDetailPage({
    super.key,
    required this.imageCoverURL,
    required this.petName,
    required this.location,
    required this.age,
    required this.color,
    required this.weight,
    required this.introduction,
    required this.imageDis1URL,
    required this.imageDis2URL,
    required this.imageDis3URL,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        shadowColor: Colors.purple,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 50,
              child: Stack(
                children: [
                  Image.asset(
                    imageCoverURL,
                    height: SizeConfig.blockSizeVertical! * 60,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(42),
                          topRight: Radius.circular(42),
                        ),
                        color: kWhite,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical! * 8,
                        left: SizeConfig.blockSizeHorizontal! * 8,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset(
                          'assets/arrow_left_icon.svg',
                          width: 40,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: kPaddingHorizontal,
              ),
              transform: Matrix4.translationValues(0, -12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        petName,
                        style: kSourceSansProBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 6,
                          color: kGrey,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/pin_point_icon.svg',
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            location,
                            style: kSourceSansProLight.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 4,
                              color: kLightGrey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: kPaddingHorizontal,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kPaddingHorizontal,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kLightOrange,
                    ),
                    width: SizeConfig.blockSizeHorizontal! * 25,
                    child: Column(
                      children: [
                        Text(
                          age,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: kSourceSansProBold.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 4,
                            color: kOrange,
                          ),
                        ),
                        Text(
                          'Age',
                          style: kSourceSansProLight.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            color: kLightGrey,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kLightOrange,
                    ),
                    width: SizeConfig.blockSizeHorizontal! * 25,
                    child: Column(
                      children: [
                        Text(
                          color,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: kSourceSansProBold.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 4,
                            color: kOrange,
                          ),
                        ),
                        Text(
                          'Color',
                          style: kSourceSansProLight.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            color: kLightGrey,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kLightOrange,
                    ),
                    width: SizeConfig.blockSizeHorizontal! * 25,
                    child: Column(
                      children: [
                        Text(
                          weight,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: kSourceSansProBold.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 4,
                            color: kOrange,
                          ),
                        ),
                        Text(
                          'Weight',
                          style: kSourceSansProLight.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            color: kLightGrey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: kPaddingHorizontal,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
              child: Text(
                'About me',
                style: kSourceSansProLight.copyWith(
                  color: kLightGrey,
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
              child: Text(
                introduction,
                style: kSourceSansProSemibold.copyWith(
                  color: kGrey,
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                ),
              ),
            ),
            const SizedBox(
              height: kPaddingHorizontal,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
              child: Text(
                'Photo Album',
                style: kSourceSansProLight.copyWith(
                  color: kLightGrey,
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 55,
                    width: SizeConfig.blockSizeHorizontal! * 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          imageDis1URL,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: SizeConfig.blockSizeHorizontal! * 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          imageDis2URL,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: SizeConfig.blockSizeHorizontal! * 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          imageDis3URL,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
