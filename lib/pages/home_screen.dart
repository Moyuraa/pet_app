import 'package:flutter/material.dart';
import 'package:final_project/style/app_styles.dart';
import 'package:final_project/style/size_config.dart';
import 'package:final_project/widgets/pet_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: ListView(
        children: [
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.black,
                ),
                Icon(
                  Icons.notifications,
                  size: 30,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const SizedBox(height: 19),
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/images/welcome_message.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: SizeConfig.blockSizeHorizontal! * 38,
                  top: 0,
                  bottom: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello',
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontWeight: FontWeight.w300,
                              fontSize: SizeConfig.blockSizeHorizontal! * 5.5,
                              color: kBlack,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'NaRaPet',
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.blockSizeHorizontal! * 5.5,
                              color: kBlack,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '👋',
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                              color: kBlack,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Ready for an amazing and lucky experience 🐈 🐕 🐇 🐦',
                        style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                          color: kBlack,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          _buildPetSection('Dogs', '🐕', dogs, dogsName),
          const SizedBox(height: 30),
          _buildPetSection('Cats', '🐈', cats, catsName),
          const SizedBox(height: 30),
          _buildPetSection('Bunnies', '🐇', bunnies, bunniesName),
          const SizedBox(height: 30),
          _buildPetSection('Birds', '🐦', birds, birdsName),
        ],
      ),
    );
  }

  Widget _buildPetSection(
      String title, String emoji, List<String> images, List<String> names) {
    return Column(
      children: [
        Container(
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w700,
                  fontSize: SizeConfig.blockSizeHorizontal! * 6,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                emoji,
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w700,
                  fontSize: SizeConfig.blockSizeHorizontal! * 3,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 169,
          child: ListView.builder(
            itemCount: images.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                height: 169,
                width: 150,
                margin: EdgeInsets.only(
                  left: index == 0 ? 30 : 15,
                  right: index == images.length - 1 ? 30 : 0,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadiusList),
                  color: kWhite,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 14,
                      offset: const Offset(0, 3),
                      color: kBoxShadowColor.withOpacity(0.18),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(kBorderRadiusList),
                        child: Image.asset(
                          'assets/images/${images[index]}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: SizeConfig.blockSizeVertical! * 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.5),
                            color: kLightOrange,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Center(
                            child: Text(
                              'Adoption',
                              style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontWeight: FontWeight.w700,
                                fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
                                color: kOrange,
                              ),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.favorite_outline,
                          color: kRed,
                          size: 16,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          names[index],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontWeight: FontWeight.w700,
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            color: kGrey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Text(
                          '17 jun 2024',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.blockSizeHorizontal! * 2,
                            color: kLightGrey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
