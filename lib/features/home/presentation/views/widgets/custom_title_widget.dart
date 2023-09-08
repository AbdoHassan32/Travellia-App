import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travellia/core/utils/app_router.dart';

import '../../../../../core/utils/styles.dart';

class CustomTitleWidget extends StatelessWidget {
  const CustomTitleWidget({required this.email,required this.title,Key? key}) : super(key: key);
  final String title;
  final String email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: Styles.textStyle22.copyWith(
              color: const Color(0xff2A2A2A),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          TextButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kPopularHotelsDestinationView,extra: email);
              },
              child: Row(
                children:const  [
                  Text(
                    'View all',
                    style: Styles.textStyle14,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(Icons.arrow_forward_rounded),
                ],
              )),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
