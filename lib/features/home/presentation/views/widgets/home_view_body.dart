import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellia/core/widgets/custom_loading_widget.dart';
import 'package:travellia/features/home/presentation/manager/featured_destination_cubit/featured_destination_cubit.dart';
import 'package:travellia/features/home/presentation/manager/featured_destination_cubit/featured_destination_cubit.dart';
import 'package:travellia/features/home/presentation/views/widgets/category_list_view.dart';
import 'package:travellia/features/home/presentation/views/widgets/custom_app_bar_widget.dart';
import 'package:travellia/features/home/presentation/views/widgets/custom_title_widget.dart';
import 'package:travellia/features/home/presentation/views/widgets/large_place_list_view.dart';
import 'package:travellia/features/home/presentation/views/widgets/popular_destination_list_view.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_error_widget.dart';

class HomeViewBody extends StatelessWidget {
  HomeViewBody({Key? key, required this.email}) : super(key: key);
  late bool isLoading;
  late bool isError;
  final String email;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 44),
        child: BlocBuilder<FeaturedDestinationCubit, FeaturedDestinationState>(
          builder: (context, state) {
            if (state is FeaturedDestinationLoading) {
              return Column(
                children: [
                  const CustomAppBarWidget(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  const CustomLoadingWidget(),
                ],
              );
            } else if (state is FeaturedDestinationFailure) {
              return Column(
                children: [
                  const CustomAppBarWidget(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  CustomErrorWidget(errMessage: state.errMessage),
                ],
              );
            } else if (state is FeaturedDestinationSuccess) {
              return Column(
                children: [
                  const CustomAppBarWidget(),
                  const SizedBox(
                    height: 36,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Category',
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
                    height: 22,
                  ),
                  const CategoryListView(),
                  const SizedBox(
                    height: 22,
                  ),
                  LargePlaceListView(email: email),
                  const SizedBox(
                    height: 36,
                  ),
                  CustomTitleWidget(title: 'Popular Destination', email: email),
                  const SizedBox(
                    height: 22,
                  ),
                  PopularDestinationListView(
                    itemCount: 10,
                    email: email,
                  ),
                ],
              );
            } else {
              return const CustomErrorWidget(
                  errMessage: 'Something wrong happened');
            }
          },
        ),
      ),
    );
  }
}

/*child: Padding(
        padding: const EdgeInsets.only(top: 44),
        child: Column(
          children: const [
            CustomAppBarWidget(),
            SizedBox(
              height: 36,
            ),
            CustomTitleWidget(title: 'Category'),
            SizedBox(
              height: 22,
            ),
            CategoryListView(),
            SizedBox(
              height: 22,
            ),
            LargePlaceListView(),
            SizedBox(
              height: 36,
            ),
            CustomTitleWidget(title: 'Popular Destination'),
            SizedBox(
              height: 22,
            ),
            PopularDestinationListView(),
          ],
        ),
      ),

 */
