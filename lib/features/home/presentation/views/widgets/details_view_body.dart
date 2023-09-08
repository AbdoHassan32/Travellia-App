import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellia/core/utils/assets.dart';
import 'package:travellia/core/widgets/custom_button_widget.dart';
import 'package:travellia/core/widgets/custom_error_widget.dart';
import 'package:travellia/core/widgets/custom_loading_widget.dart';
import 'package:travellia/features/home/presentation/views/widgets/custom_details_app_bar_widget.dart';
import 'package:travellia/features/home/presentation/views/widgets/custom_details_widget.dart';
import 'package:travellia/features/home/presentation/views/widgets/custom_preview_title.dart';
import 'package:travellia/features/home/presentation/views/widgets/preview_list_view.dart';

import 'package:travellia/features/home/data/models/hotel_model/Data.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({required this.email,required this.hotel,Key? key}) : super(key: key);
final Data hotel;
final String email;
  @override
  Widget build(BuildContext context) {
    return  Stack(
          children: [
            CachedNetworkImage(
              imageUrl:hotel.photo!.images!.large!.url!,
              height: MediaQuery.of(context).size.height * .53,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.black,
              ),
            ),
             CustomDetailsAppBarWidget(hotel: hotel,email: email,),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration:const BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
                  color: Colors.white,
                ),
                height: MediaQuery.of(context).size.height*.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    CustomDetailsWidget(hotel: hotel),
                     CustomPreviewTitle(hotel: hotel),
                    const SizedBox(
                      height: 18,
                    ),
                    PreviewListView(hotel: hotel),
                    const SizedBox(
                      height: 20,
                    ),
                      CustomButtonWidget(label: 'Not Available',buttonColor: Colors.grey,onPressed: (){

                     }),
                  ],
                ),
              ),
            ),
          ],
        );
      }
}
