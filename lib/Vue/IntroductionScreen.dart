import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Vue/Auth/LoginVue.dart';
import 'package:flutter/material.dart';
import 'package:introduction_slider/source/presentation/pages/pages.dart';
import 'package:introduction_slider/source/presentation/presentation.dart';

class IntroductionS extends StatelessWidget {
  const IntroductionS({super.key});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return IntroductionSlider(
      items: [
        IntroductionSliderItem(
          logo: IntroductionContainer(h, w),
          backgroundColor: AppData.BasicColor,
        ),
        IntroductionSliderItem(
          logo: IntroductionContainer(h, w),
          backgroundColor: AppData.BasicColor,
        ),
        IntroductionSliderItem(
          logo: IntroductionContainer(h, w),
          backgroundColor: AppData.BasicColor,
        ),
      ],
      done: Done(
        child: Icon(Icons.done,color: Colors.white),
        home: LoginVue(),
      ),
      next: Next(child: Icon(Icons.arrow_forward,color: Colors.white,)),
      back: Back(child: Icon(Icons.arrow_back,color: Colors.white)),
      dotIndicator: DotIndicator(
        unselectedColor: Colors.white,
        selectedColor: Colors.tealAccent,
      ),
    );
  }

  Container IntroductionContainer(double h, double w) {
    return Container(
      height: h * 0.7,
      width: w * 0.9,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
    );
  }
}
