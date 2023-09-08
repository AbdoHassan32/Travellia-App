import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:travellia/features/home/data/models/hotel_model/Data.dart';
import 'package:travellia/features/home/presentation/views/widgets/custom_location_widget.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';

class ItemLargePlaceListView extends StatelessWidget {
  const ItemLargePlaceListView({required this.email,required this.hotel,Key? key}) : super(key: key);
  final Data hotel;
  final String email;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(AppRouter.kDetailsViewName,extra: hotel,pathParameters: {
          'email' : email,
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(
          right: 12,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl:hotel.photo!.images!.large!.url! ?? '',
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.black,
                ),
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.width * 0.56,
                fit: BoxFit.fill,
                colorBlendMode: BlendMode.darken,
                color: Colors.black26,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.56,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 14.0,
                        bottom: 14,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:MediaQuery.of(context).size.width * 0.3 ,
                            child: Text(
                              hotel.name == null ? 'Name not found' : hotel.name!,
                              style: Styles.textStyle15.copyWith(
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              maxLines: 1,

                            ),
                          ),
                          CustomLocationWidget(iconSize: 10, style: Styles.textStyle12.copyWith(
                            color: Colors.white,
                          ),
                            color: Colors.white,location: hotel.locationString!,
                            widthOfText: MediaQuery.of(context).size.width*0.3, maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 14,
                        bottom: 14,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width*.089,
                            child: Text(
                             hotel.price == null ? '0' : hotel.price!,
                              style: Styles.textStyle15.copyWith(
                                color: Colors.white,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          Text(
                            '/Person',
                            style: Styles.textStyle12.copyWith(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
