import 'package:flutter/material.dart';
import 'package:travellia/features/home/data/models/hotel_model/Data.dart';
import 'package:travellia/features/home/presentation/views/widgets/details_view_body.dart';



class HotelDetailsView extends StatelessWidget {
  const HotelDetailsView({required this.email, required this.hotel ,Key? key}) : super(key: key);
final Data hotel;
final String email;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: DetailsViewBody(hotel: hotel,email: email ),
    );
  }
}
