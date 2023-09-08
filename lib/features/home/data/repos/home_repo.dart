import 'package:dartz/dartz.dart';
import 'package:travellia/core/errors/failures.dart';
import 'package:travellia/features/home/data/models/hotel_model/Data.dart';

abstract class HomeRepo
{
  Future< Either < Failure, List<Data>> >fetchHotels();
 // Future<Either< Failure, List<DataDetails>> >fetchHotelDetails({required String locationId});

}