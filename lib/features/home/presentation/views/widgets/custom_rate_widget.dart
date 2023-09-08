import 'package:flutter/material.dart';
import 'package:travellia/constants.dart';
import 'package:travellia/core/utils/styles.dart';
import 'package:travellia/features/home/data/models/hotel_model/Data.dart';

class CustomRateWidget extends StatelessWidget {
  const CustomRateWidget({Key? key, required this.hotel}) : super(key: key);
  final Data hotel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       const Icon(
          Icons.star,
          size: 11,
          color: Color(0xffF8E545),
        ),
       const SizedBox(
          width: 4,
        ),
        Text(
          hotel.rating!,
          style: Styles.textStyle14.copyWith(
            color: kGreyTextsColor,
          ),
        ),
      ],
    );
  }
}
