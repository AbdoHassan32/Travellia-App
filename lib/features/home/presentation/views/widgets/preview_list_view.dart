import 'package:flutter/material.dart';
import 'package:travellia/features/home/data/models/hotel_model/Data.dart';
import 'package:travellia/features/home/presentation/views/widgets/item_preview_list_view.dart';


class PreviewListView extends StatelessWidget {
  const PreviewListView({Key? key, required this.hotel}) : super(key: key);
  final Data hotel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.12,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(
            left: 25,
          ),
          itemCount: 1 ,
          itemBuilder: (context, index) =>  ItemPreviewListView(imageHotel: hotel.photo!.images!.small!.url!,)),
    );
  }
}
