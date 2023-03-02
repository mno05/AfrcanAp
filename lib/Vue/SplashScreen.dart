import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:african_ap/Data/SaveSuperUser.dart';
import 'package:african_ap/Data/SaveUser.dart';
import 'package:african_ap/Models/User.dart';
import 'package:african_ap/Vue/Auth/LoginVue.dart';
import 'package:african_ap/Vue/IntroductionScreen.dart';
import 'package:african_ap/Vue/LocalApp/Principal.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () async {
      User user = await SaveUser.getUser();
      if (user.Id.isEmpty) {
        await SaveSuperUser.getSuperUser().then((value) {
          if (value.prenom.isEmpty) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => IntroductionS(),
            ));
          } else {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Principal(
                // superUser: value,
                  user: User(
                      prenom: value.prenom,
                      nom: value.nom,
                      telephone: value.telephone,
                      email: value.adresseMail,
                      passw: "",
                      imageName: value.imagePath,
                      imageData: File(''))),
            ));
          }
        });
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Principal(user: user),
        ));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3500,
        splash: Image.asset("img/logo.png"),
        splashIconSize: MediaQuery.of(context).size.height * 0.15,
        nextScreen: SplashScreen(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white);
    // Timer(
    //   Duration(seconds: 3),
    //   () => Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: (context) => LoginVue(),
    //   )),
    // );
    // super.initState();

  }
}
