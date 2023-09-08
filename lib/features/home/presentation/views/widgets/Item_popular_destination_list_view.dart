import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travellia/core/utils/app_router.dart';
import 'package:travellia/core/utils/styles.dart';
import 'package:travellia/features/home/data/models/hotel_model/Data.dart';
import 'package:travellia/features/home/presentation/views/widgets/custom_location_widget.dart';

import '../../../../../constants.dart';

class ItemPopularDestinationListView extends StatelessWidget {
  const ItemPopularDestinationListView({required this.email,required this.hotel, Key? key}) : super(key: key);
  final Data hotel;
  final String email;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(AppRouter.kDetailsViewName,extra: hotel,pathParameters: {
          'email':email,
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.11 + 26,
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurStyle: BlurStyle.outer,
                blurRadius: 0.5,
                offset: Offset(0, 0),
                spreadRadius: 1,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: CachedNetworkImage(
                imageUrl: hotel.photo!.images!.large!.url! ?? '' ,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * 0.16,
                  width: MediaQuery.of(context).size.width * 0.25,
                  color: Colors.black12,
                  colorBlendMode: BlendMode.darken,
                  errorWidget:  (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(
                     width: MediaQuery.of(context).size.width*.52,
                     child: Text(
                      hotel.name == null ? 'Name not found':hotel.name!,
                      style: Styles.textStyle17,
                       overflow: TextOverflow.ellipsis,
                       softWrap: true,
                     ),
                   ),
                  const SizedBox(
                    height: 4,
                  ),
                  CustomLocationWidget(
                      color: const Color(0xff1C9FE2),
                      iconSize: 8.25,
                      style: Styles.textStyle12.copyWith(
                        color: const Color(0xff1C9FE2),
                      ),
                    location: hotel.locationString!,
                    widthOfText: MediaQuery.of(context).size.width*0.3, maxLines: 1,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.52,
                    child: Text(
                      'This exceptional beach gets its striking color from microscopic animals called something being silly',
                      style: Styles.textStyle12.copyWith(
                        color: kGreyTextsColor,
                      ),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children:  [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*.089,
                        child: Text(
                          hotel.price!,
                          style: Styles.textStyle15,
                          maxLines: 1,
                        ),

                      ),
                      const SizedBox(
                        width: 4,
                      ),
                     const Text(
                        '/Person',
                        style: Styles.textStyle12,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
