import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Vue/Auth/LoginVue.dart';
import 'package:african_ap/Vue/Widgets/BoutonC.dart';
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
              isTitle: true,
              text:
                  "Vous souhaite  la bienvenue dans  la communauté africaine plus visible sur le marché du travail."),
          backgroundColor: Colors.white,
        ),
        IntroductionSliderItem(
          logo: IntroductionContainer(h, w,
              asset: "assets/cons.json",
              text:
                  "Les professionnels d’origine africaine sont mis en avant et grâce à l’action de la communauté, ils acquièrent un plus gros pouvoir d’action dans le monde de l’entreprise."),
          backgroundColor: Colors.white,
        ),
        IntroductionSliderItem(
          logo: IntroductionContainer(h, w,
              isTitle: true,
              asset: "assets/african.json",
              text:
                  "Créé par et pour les professionnels d’origine africaine."),
          backgroundColor: Colors.white,
        ),
      ],
      done: Done(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppData.BasicColorNew,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            "Commencez",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          alignment: Alignment.center,
        ),
        home: LoginVue(),
      ),
      next: Next(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppData.BasicColorNew,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            "Suivant",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          alignment: Alignment.center,
        ),
      ),
      // back: Back(child: Icon(Icons.arrow_back, color: Colors.white)),
      // dotIndicator: DotIndicator(
      //   unselectedColor: Colors.white,
      //   selectedColor: Colors.tealAccent,
      // ),
    );
  }

  Container IntroductionContainer(double h, double w,
      {String text = "", isTitle = false, required String asset}) {
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
                isTitle
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "African Professionals",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      )
                    : Container(),
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
