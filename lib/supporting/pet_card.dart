
import 'package:flutter/material.dart';
import 'package:final_project/style/app_styles.dart';
import 'package:final_project/style/size_config.dart';

class PetCard extends StatelessWidget {
  final String imagePath;
  final String petName;
  final String date;
  final bool isAdopted;

  const PetCard({
    Key? key,
    required this.imagePath,
    required this.petName,
    required this.date,
    this.isAdopted = false, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 169,
      width: 150,
      margin: const EdgeInsets.only(right: 15),
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
                imagePath, 
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
              Icon(
                isAdopted ? Icons.favorite : Icons.favorite_outline,
                color: isAdopted ? kRed : Colors.grey, 
                size: 16,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: Text(
                  petName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.w700,
                    fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    color: kGrey,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              Text(
                date,
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
  }
}
