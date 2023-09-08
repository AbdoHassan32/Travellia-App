part of 'featured_destination_cubit.dart';

@immutable
abstract class FeaturedDestinationState {}

class FeaturedDestinationInitial extends FeaturedDestinationState {}

class FeaturedDestinationLoading extends FeaturedDestinationState {}

class FeaturedDestinationFailure extends FeaturedDestinationState {
  final String errMessage;

   FeaturedDestinationFailure(this.errMessage);
}

class FeaturedDestinationSuccess extends FeaturedDestinationState {
  final List<Data> hotels;

   FeaturedDestinationSuccess(this.hotels);
}