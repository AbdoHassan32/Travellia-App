import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:travellia/core/utils/app_router.dart';
import 'package:travellia/core/utils/assets.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
      ),
      child: Row(
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: kItemBackgroundColor,
            ),
            child: IconButton(
              onPressed: () {
                GoRouter.of(context).go(AppRouter.kLoginView);

              },
              icon: const Icon(
                FontAwesomeIcons.arrowLeft,
                color: Color(0xffCBCBCB),
                size: 15,
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Column(
            children: [
              Text(
                'Current Location',
                style: Styles.textStyle14.copyWith(
                  color: kGreyTextsColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.locationDot,
                    color: Color(0xff1C9FE2),
                    size: 12.5,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Minya, Egypt',
                    style: Styles.textStyle17,
                  ),
                ],
              )
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 25,
            ),
            child: Image.asset(
              AssetsData.avatar,
              height: 36,
              width: 36,
            ),
          ),
        ],
      ),
    );
  }
}
