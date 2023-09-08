import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travellia/core/utils/assets.dart';

class SplashViewBody extends StatelessWidget {
  SplashViewBody(
      {required this.controllerForLogo,
      required this.sizeLottieAnimation,
      required this.sizeLogoAnimation,
      Key? key})
      : super(key: key);
  AnimationController controllerForLogo;
  Animation<double> sizeLogoAnimation;
  Animation<double> sizeLottieAnimation;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: controllerForLogo,
        builder: (context, _) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 1,
                ),
                Image.asset(
                  AssetsData.logo,
                  height: sizeLogoAnimation.value,
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Lottie.asset(
                      AssetsData.lottieTraveler,
                      height: sizeLottieAnimation.value,
                      width: double.infinity,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
