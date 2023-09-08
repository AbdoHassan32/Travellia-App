import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:travellia/core/widgets/custom_loading_widget.dart';
import 'package:travellia/features/favorites/data/models/hotel_firebase_model.dart';
import 'package:travellia/features/favorites/presentation/views/widgets/item_favorities_list_view.dart';
import '../../../../../core/utils/styles.dart';

class FavoriteViewBody extends StatelessWidget {
   FavoriteViewBody({required this.email,Key? key}) : super(key: key);
   final String email;
  CollectionReference favHotels = FirebaseFirestore.instance.collection('favHotels');
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: favHotels.orderBy('createdAt').get(),
        builder: (context , snapshot){
       if(snapshot.hasData){

         List<HotelFireBaseModel> hotelsList=[];
         for(int i=0;i<snapshot.data!.docs.length;i++){
           hotelsList.add(HotelFireBaseModel.fromJson(snapshot.data!.docs[i]));
         }
         return SingleChildScrollView(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               const SizedBox(
                 height: 25 ,
               ),
               Padding(
                 padding: const EdgeInsets.only(
                   left: 25,
                 ),
                 child: Text(
                     'Favorites',
                   style: Styles.textStyle22.copyWith(
                     color: const Color(0xff2A2A2A),
                   ),
               ),
               ),
             const  SizedBox(
                 height: 20,
               ),
               ListView.builder(
                  itemCount: hotelsList.length,
                 shrinkWrap: true,
                 physics:const NeverScrollableScrollPhysics(),
                 itemBuilder: (context, index) {
                   return hotelsList[index].id==email ? ItemFavoritiesListView(favHotel: hotelsList[index]) : Container();
               },)
             ],

           ),
         );
       }else{
         return Column(
           children: [
             const SizedBox(
               height: 25 ,
             ),
             Padding(
               padding: const EdgeInsets.only(
                 left: 25,
               ),
               child: Row(
                 children: [
                   Text(
                     'Favorites',
                     style: Styles.textStyle22.copyWith(
                       color: const Color(0xff2A2A2A),
                     ),
                   ),
                   const Spacer(
                     flex: 1,
                   ),
                   const SizedBox(
                     width: 20,
                   )
                 ],
               ),
             ),
             const Spacer(
               flex: 1,
             ),
             const CustomLoadingWidget(),
             const Spacer(
               flex: 1,
             ),
           ],

         );
       }
    }
    );
  }
}
