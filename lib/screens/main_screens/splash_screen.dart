import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:halisaha_app/helper/splash_service/splash_screen_features.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // CrudServices.usersToHive();
    return AnimatedSplashScreen(
        duration: 2000,
        splashIconSize: 300,
        splash: Image.asset("assets/images/splash.png"),
        nextScreen: SplashScreenFeature.goToNewPage(),
        splashTransition: SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.rightToLeft,
        backgroundColor: Colors.white);
  }
}
