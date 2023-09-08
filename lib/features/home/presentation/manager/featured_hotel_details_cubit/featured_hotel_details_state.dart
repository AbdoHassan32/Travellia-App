/*part of 'featured_hotel_details_cubit.dart';

@immutable
abstract class FeaturedHotelDetailsState {}

class FeaturedHotelDetailsInitial extends FeaturedHotelDetailsState {}
class FeaturedHotelDetailsLoading extends FeaturedHotelDetailsState {}

class FeaturedHotelDetailsFailure extends FeaturedHotelDetailsState {
  final String errMessage;

  FeaturedHotelDetailsFailure(this.errMessage);
}

class FeaturedHotelDetailsSuccess extends FeaturedHotelDetailsState {
  final List<DataDetails> hotels;

  FeaturedHotelDetailsSuccess(this.hotels);
}*/