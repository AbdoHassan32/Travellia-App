import 'package:flutter/material.dart';
import 'package:travellia/constants.dart';
import 'package:travellia/core/utils/styles.dart';
import 'package:travellia/features/home/data/models/hotel_model/Data.dart';


class CustomPriceWidget extends StatelessWidget {
  const CustomPriceWidget({Key? key,required this.hotel}) : super(key: key);
final Data hotel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
         width: MediaQuery.of(context).size.width*.161,

          child: Text(
            hotel.price == null ? '0' : hotel.price!,
            style: Styles.textStyle29,
            softWrap: true,
            maxLines: 1,
          ),
        ),
        const  SizedBox(
          width: 4,
        ),
        Text(
          '/Person',
          style: Styles.textStyle14.copyWith(
            color: kGreyTextsColor,
          ),
        )
      ],
    );
  }
}
