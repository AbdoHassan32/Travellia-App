import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/assets.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Lottie.asset(
        AssetsData.lottieLoading,
        height: MediaQuery.of(context).size.height*0.2,
      ),
    );;
  }
}
