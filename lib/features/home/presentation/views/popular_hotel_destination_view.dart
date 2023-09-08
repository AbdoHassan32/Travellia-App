import 'package:flutter/material.dart';
import 'package:travellia/features/home/presentation/views/widgets/popular_hotel_destination_view_body.dart';

class PopularHotelDestinationView extends StatelessWidget {
  const PopularHotelDestinationView({required this.email,Key? key}) : super(key: key);
  final String email;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body:  SafeArea(child: PopularHotelDestinationViewBody(email: email)));
  }
}
