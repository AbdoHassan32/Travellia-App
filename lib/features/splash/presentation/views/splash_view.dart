import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:travellia/constants.dart';
import 'package:travellia/core/utils/app_router.dart';
import 'package:travellia/core/utils/assets.dart';
import 'package:travellia/core/utils/screen_size.dart';
import 'package:travellia/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with TickerProviderStateMixin {
  final player = AudioPlayer();
  late AnimationController controllerForLogo;
  late AnimationController controllerForLottie;
  late Animation<double> sizeLogoAnimation;
  late Animation<double> sizeLottieAnimation;
  late Animation<double> curveAnimation;

  @override
  void initState()  {
    super.initState();

    logoAnimation();

   lottieAnimation();
    controllerForLogo.forward();

    controllerForLottie.forward();

    navigateToLogin();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  controllerForLogo.dispose();
  controllerForLottie.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSplashBackgroundColor,
      body: SplashViewBody(
        controllerForLogo: controllerForLogo,
        sizeLogoAnimation: sizeLogoAnimation,
        sizeLottieAnimation: sizeLottieAnimation,
      ),
    );
  }

  void logoAnimation() {
    controllerForLogo = AnimationController(
      vsync: this,
      duration: const Duration(seconds:6),
    );

    curveAnimation =
        CurvedAnimation(parent: controllerForLogo, curve: Curves.easeInQuint);

    sizeLogoAnimation = TweenSequence([
      TweenSequenceItem<double>(
        tween: Tween(begin: 0, end: 0),
        weight: 10,
      ),
      TweenSequenceItem<double>(
        tween: Tween(begin: 0, end: screenHeight * .35),
        weight: 10,
      ),
      TweenSequenceItem<double>(
        tween: Tween(begin: screenHeight * .35, end: screenHeight * .35),
        weight: 1000,
      ),
      TweenSequenceItem<double>(
        tween: Tween(begin: screenHeight * .35, end: 0),
        weight: 500,
      ),
    ]).animate(curveAnimation);
  }

  void lottieAnimation() {

    controllerForLottie = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    sizeLottieAnimation = TweenSequence([
      TweenSequenceItem<double>(
        tween: Tween(begin: 0, end:0),
        weight: 10,
      ),
      TweenSequenceItem<double>(
        tween: Tween(begin: 0, end: 0),
        weight: 20,
      ),
      TweenSequenceItem<double>(
        tween: Tween(begin: 0, end: screenHeight * .37),
        weight: 20,
      ),
      TweenSequenceItem<double>(
        tween: Tween(begin: screenHeight * .37, end: screenHeight * .37),
        weight: 80,
      ),
      TweenSequenceItem<double>(
        tween: Tween(begin: screenHeight * .37, end: 0),
        weight: 20,
      ),
      TweenSequenceItem<double>(
        tween: Tween(begin: 0, end: 0),
        weight: 10,
      ),
    ]).animate(controllerForLottie);
  }

  void navigateToLogin() {
    Future.delayed(
       const Duration(milliseconds: 6900),
            () {
          GoRouter.of(context).push(AppRouter.kLoginView);
        }
    );
  }
}
