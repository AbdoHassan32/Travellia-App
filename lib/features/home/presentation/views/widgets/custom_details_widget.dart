import 'package:flutter/cupertino.dart';
import 'package:travellia/features/home/data/models/hotel_model/Data.dart';
import 'package:travellia/features/home/presentation/views/widgets/custom_location_widget.dart';
import 'package:travellia/features/home/presentation/views/widgets/custom_price_widget.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class CustomDetailsWidget extends StatelessWidget {
  const CustomDetailsWidget({Key? key,required this.hotel}) : super(key: key);
final Data hotel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 25,
            left: 25,
            top: 25,
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Text(
                      hotel.name == null ? 'Name not Found':hotel.name!,
                      style: Styles.textStyle22,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ),
                 const SizedBox(
                    height: 8,
                  ),
                  CustomLocationWidget(
                      iconSize: 16,
                      style: Styles.textStyle17.copyWith(
                        color: const Color(0xff1C9FE2),
                      ),
                      color: const Color(0xff1C9FE2),
                      location: hotel.locationString!,
                    widthOfText: MediaQuery.of(context).size.width*0.5, maxLines: 2,
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
               CustomPriceWidget(hotel: hotel),
            ],
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Text(
            'The mighty Rinjani mountain of Gunung Rinjani is a massive volcano which towers over the island of Lombok. A climb to the top is one of the most exhilarating experiences you can have in Indonesia. At 3,726 meters tall, Gunung Rinjani is the second highest mountain in Indonesia  mountain in mountain in Indonesi mountain in Indonesimountain in Indonesimountain in Indonesi',
            style: Styles.textStyle12.copyWith(
              color: kGreyTextsColor,
            ),
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            textScaleFactor: 1.01,
          ),
        ),
        const SizedBox(
          height: 22,
        ),
      ],
    );
  }
}
