import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellia/core/widgets/custom_error_widget.dart';
import 'package:travellia/core/widgets/custom_loading_widget.dart';
import 'package:travellia/features/home/presentation/manager/featured_destination_cubit/featured_destination_cubit.dart';
import 'package:travellia/features/home/presentation/manager/featured_destination_cubit/featured_destination_cubit.dart';
import 'package:travellia/features/home/presentation/views/widgets/Item_popular_destination_list_view.dart';

class PopularDestinationListView extends StatelessWidget {
  const PopularDestinationListView({required this.email,Key? key, required this.itemCount }) : super(key: key);
  final int itemCount;
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedDestinationCubit, FeaturedDestinationState>(
      builder: (context, state) {
        if (state is FeaturedDestinationSuccess){
          return ListView.builder(
              itemCount: itemCount==0?state.hotels.length:itemCount ,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                index == 6 || index == 15 || index == 24 ? index=index+1 : index;
                return Padding(
                padding:const EdgeInsets.only(
                  bottom: 6,
                  top: 6,
                ),
                child: ItemPopularDestinationListView(hotel: state.hotels[index],email: email,),
              );});
        }
        else{
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
