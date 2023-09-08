import 'package:flutter/material.dart';
import 'package:travellia/core/utils/assets.dart';
import 'package:travellia/core/utils/styles.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const  Text('Flutter developer',style: Styles.textStyle22,textAlign: TextAlign.center),

          Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(300),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(
                AssetsData.profile,
              height: MediaQuery.of(context).size.height*0.4,
            ),
          ),
        const  Text('This Application is made by Abdo Hassan with love ♥',style: Styles.textStyle22,textAlign: TextAlign.center),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
