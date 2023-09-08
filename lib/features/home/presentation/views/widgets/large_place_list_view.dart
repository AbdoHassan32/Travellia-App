import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellia/core/widgets/custom_error_widget.dart';
import 'package:travellia/features/home/presentation/manager/featured_destination_cubit/featured_destination_cubit.dart';
import 'package:travellia/features/home/presentation/views/widgets/item_large_place_list_view.dart';

class LargePlaceListView extends StatelessWidget {
  const LargePlaceListView({Key? key,required this.email}) : super(key: key);
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedDestinationCubit, FeaturedDestinationState>(
      builder: (context, state) {
        if (state is FeaturedDestinationSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.17,
            child: ListView.builder(
                itemCount: state.hotels.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(
                  left: 25,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  index == 6 || index == 15 || index == 24
                      ? index=index+1
                      : index;
                  return ItemLargePlaceListView(
                    hotel: state.hotels[index],
                    email: email,
                  );
                }),
          );
        } else {
          return const CustomErrorWidget(errMessage: 'error');
        }
      },
    );
  }
}
