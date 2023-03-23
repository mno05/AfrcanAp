import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChangePage {
  static SliderPush({required BuildContext context, required Widget push}) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(seconds: 1),
        transitionsBuilder: (context, animation, secondAnimation, child) {
          animation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          );
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return push;
        },
      ),
    );
  }
  static Push({required BuildContext context, required Widget push}){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => push,));
  }
}
