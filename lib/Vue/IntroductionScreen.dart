import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Vue/Auth/LoginVue.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_slider/source/presentation/pages/pages.dart';
import 'package:introduction_slider/source/presentation/presentation.dart';
import 'package:lottie/lottie.dart';

class IntroductionS extends StatelessWidget {
  const IntroductionS({super.key});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return IntroductionSlider(
      items: [
        IntroductionSliderItem(
          logo: IntroductionContainer(h, w,
              asset: "assets/welcome.json",
              text:
                  "AP vous souhaite  la bienvenue dans  la communauté africaine plus visible sur le marché du travail."),
          backgroundColor: AppData.BasicColor,
        ),
        IntroductionSliderItem(
          logo: IntroductionContainer(h, w,
              asset: "assets/cons.json",
              text:
                  "Les professionnels d’origine africaine sont mis en avant et grâce à l’action de la communauté, ils acquièrent un plus gros pouvoir d’action dans le monde de l’entreprise."),
          backgroundColor: AppData.BasicColor,
        ),
        IntroductionSliderItem(
          logo: IntroductionContainer(h, w,
              asset: "assets/african.json",
              text:
                  "AP a été créé par et pour les professionnels d’origine africaine."),
          backgroundColor: AppData.BasicColor,
        ),
      ],
      done: Done(
        child: Icon(Icons.done, color: Colors.white),
        home: LoginVue(),
      ),
      next: Next(
          child: Icon(
        Icons.arrow_forward,
        color: Colors.white,
      )),
      back: Back(child: Icon(Icons.arrow_back, color: Colors.white)),
      dotIndicator: DotIndicator(
        unselectedColor: Colors.white,
        selectedColor: Colors.tealAccent,
      ),
    );
  }

  Container IntroductionContainer(double h, double w,
      {String text = "", required String asset}) {
    return Container(
      height: h * 0.7,
      width: w * 0.9,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  asset,

                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
