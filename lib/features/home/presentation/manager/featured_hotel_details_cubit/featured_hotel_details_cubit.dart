/*import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travellia/features/home/data/models/hotel_model_for_another_api/hotel_details_model/Data.dart';

import '../../../data/repos/home_repo.dart';

part 'featured_hotel_details_state.dart';

class FeaturedHotelDetailsCubit extends Cubit<FeaturedHotelDetailsState> {
  FeaturedHotelDetailsCubit(this.homeRepo) : super(FeaturedHotelDetailsInitial());
  final HomeRepo homeRepo;
  Future<void> fetchHotelDetails({required String locationId}) async {
    emit(FeaturedHotelDetailsLoading());
    var result = await homeRepo.fetchHotelDetails(locationId: locationId);
    result.fold(
            (failure) => emit(FeaturedHotelDetailsFailure(failure.errMessage)),
            (hotels) => emit(FeaturedHotelDetailsSuccess(hotels)));
  }
}
*/