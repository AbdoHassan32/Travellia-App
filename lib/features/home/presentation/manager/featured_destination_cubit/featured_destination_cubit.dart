import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travellia/features/home/data/models/hotel_model/Data.dart';

import '../../../data/repos/home_repo.dart';

part 'featured_destination_state.dart';

class FeaturedDestinationCubit extends Cubit<FeaturedDestinationState> {
  FeaturedDestinationCubit(this.homeRepo) : super(FeaturedDestinationInitial());
  final HomeRepo homeRepo;
  Future<void> fetchMainDestination() async {
    emit(FeaturedDestinationLoading());
    var result = await homeRepo.fetchHotels();
    result.fold(
        (failure) => emit(FeaturedDestinationFailure(failure.errMessage)),
        (hotels) => emit(FeaturedDestinationSuccess(hotels)));
  }
}
