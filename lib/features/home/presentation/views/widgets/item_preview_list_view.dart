import 'package:flutter/material.dart';


class ItemPreviewListView extends StatelessWidget {
 const ItemPreviewListView({Key? key, required this.imageHotel}) : super(key: key);
  final String imageHotel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 12,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),

        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.network(
         imageHotel,
          height: MediaQuery.of(context).size.height*0.12,
fit: BoxFit.fill,
        ),
      ),
    );
  }
}
