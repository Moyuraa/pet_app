import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:final_project/style/size_config.dart';
import 'package:final_project/style/app_styles.dart';

class PetDetailPage extends StatelessWidget {
  const PetDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 50,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/dog_marly_cover.png',
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
                        'Marly',
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
                            'Arizona, U.S.',
                            style: kSourceSansProLight.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 4,
                              color: kLightGrey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint('Favorite Button Tapped');
                    },
                    child: SvgPicture.asset(
                      'assets/favorite_icon.svg',
                      width: 30,
                    ),
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
                          '6 Months',
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
                          'Brown',
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
                          '6KG',
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
                'Remember this sweet face? Several years ago Charlie came into our care when their person died. These two easy-going Lhasa Apso mixes quickly to settle into foster care. Living with kids, cats, and other dogs, they were the perfect guests, and once their vetting and evaluation was done this bonded pair found their home with a kind couple.',
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
              padding: const EdgeInsets.symmetric(
                horizontal: kPaddingHorizontal,
              ),
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
              padding: const EdgeInsets.symmetric(
                horizontal: kPaddingHorizontal,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 55,
                    width: SizeConfig.blockSizeHorizontal! * 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/dog_marly01.png',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: SizeConfig.blockSizeHorizontal! * 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        6,
                      ),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/dog_marly02.png',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: SizeConfig.blockSizeHorizontal! * 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/dog_marly03.png',
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
