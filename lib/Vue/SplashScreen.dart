import 'package:african_ap/Vue/IntroductionScreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../Controllers/HandleAuth.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.resumed) {
  //     log("Utilsation de l'app");
  //   } else {
  //     log("Non Utilsation de l'app");
  //   }
  // }
  @override
  Widget build(BuildContext context) {
      return AnimatedSplashScreen(
          duration: 3500,
          splash: Image.asset("img/logo.png"),
          splashIconSize: MediaQuery.of(context).size.height * 0.15,
          nextScreen: !getBoolAsync("isFirst") ? IntroductionS() : HandleAuth(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.white);
  }
}
