import 'package:flutter/cupertino.dart';
import 'package:travellia/features/home/presentation/views/widgets/custom_title_widget.dart';
import 'package:travellia/features/home/presentation/views/widgets/popular_destination_list_view.dart';

import '../../../../../core/utils/styles.dart';

class PopularHotelDestinationViewBody extends StatelessWidget {
  const PopularHotelDestinationViewBody({required this.email,Key? key}) : super(key: key);
  final String email;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
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
                'Popular Destination',
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
          const SizedBox(
            height: 20,
          ),
           PopularDestinationListView(itemCount: 0,email: email),
        ],
      ),
    );
  }
}
