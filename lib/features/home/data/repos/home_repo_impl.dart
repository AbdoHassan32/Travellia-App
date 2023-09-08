import 'package:dartz/dartz.dart';
import 'package:travellia/core/errors/failures.dart';
import 'package:travellia/core/utils/api_service.dart';
import 'package:travellia/features/home/data/models/hotel_model/Data.dart';
import 'package:travellia/features/home/data/repos/home_repo.dart';

class HomeRepoImplement implements HomeRepo{
  final ApiService apiService;

  HomeRepoImplement(this.apiService);

  @override
  Future< Either< Failure, List<Data> > > fetchHotels() async {
     var data = await apiService.get(query: 'list?location_id=297549&adults=1&rooms=1&nights=2');
      List<Data> hotels = [];
      int i =0;

      print(data);
      for (var item in data['data']) {
        try {

          hotels.add(Data.fromJson(item));
          i++;
        } catch (e) {
          hotels.add(Data.fromJson(item));
          i++;
        }
      }

     return right(hotels);


  }

  /*@override
  Future<Either<Failure, List<DataDetails>>> fetchHotelDetails({required String locationId}) async {
    try {
      var data = await apiService.get(query: 'get-details?location_id=$locationId');
      List<DataDetails> hotels = [];
      for ( var item in data['data']) {
        try {
          hotels.add(DataDetails.fromJson(item));
        } catch (e) {
          hotels.add(DataDetails.fromJson(item));
        }
      }
      return right(hotels);

    }catch(e) {
      if(e is DioError){
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
          ServerFailure(e.toString())
      );
    }
  }
*/
}
