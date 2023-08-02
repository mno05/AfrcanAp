import 'dart:async';

import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Vue/LocalApp/Principal.dart';
import 'package:african_ap/Vue/Widgets/BoutonC.dart';
import 'package:african_ap/Vue/Widgets/TxtFC.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class BasicsWidgets {
  static alert(String msg, BuildContext context,
      {Titre = "Message",}) {
    // Navigator.pop(context);
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) {
          return AlertDialog(
            // title: Text(Titre),
            content: Text(
              msg,
              style: GoogleFonts.nunito(),
            ),
            actions: [
              TextButton(
                  onPressed: (() => Navigator.of(context).pop()),
                  child: Text("OK"))
            ],
          );
        }));
  }

 static alertWithOkAction(String msg, BuildContext context, void Function()? onPressed,
      {Titre = "Message"}) {
    // Navigator.pop(context);
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) {
          return AlertDialog(
            // title: Text(Titre),
            content: Text(
              msg,
              style: GoogleFonts.nunito(),
            ),
            actions: [
              TextButton(
                  onPressed:  onPressed,
                  child: Text("OK"))
            ],
          );
        }));
  }
  static alertWithLottie(
      {required String msg,
      required BuildContext context,
      required String lottie}) {
    // Navigator.pop(context);
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) {
          return AlertDialog(
            content: Container(
              // color: Colors.red,
              height: 300,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    "assets/$lottie.json",
                    width: 250,
                    height: 250,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    msg,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: (() => Navigator.of(context).pop()),
                  child: Text("OK"))
            ],
          );
        }));
  }

  static alertWithLottieAutoCloseToPrincipal(
      {required String msg,
      required int sec,
      required BuildContext context,
      required String lottie}) {
    Navigator.pop(context);
    Timer(
      Duration(seconds: sec),
      () {
        Get.offAll(() => Principal());
      },
    );
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) {
          return AlertDialog(
            content: Container(
              // color: Colors.red,
              height: 300,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    "assets/$lottie.json",
                    width: 250,
                    height: 250,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    msg,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(),
                  ),
                ],
              ),
            ),
          );
        }));
  }

  static Done(BuildContext context) {
    // Navigator.pop(context);
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) {
          return AlertDialog(
            content: Material(
              child: Container(
                height: 50,
                width: 50,
                child: Lottie.asset("cons.json"),
              ),
            ),
          );
        }));
  }

  static YesOrNoDialogue({
    required BuildContext context,
    required String msg,
    Titre = "Message",
    void Function()? YesPressed,
    NonPressed,
    required String YesText,
    NoText,
  }) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) {
          return AlertDialog(
            // title: Text(Titre),
            content: Text(
              msg,
              style: GoogleFonts.nunito(),
            ),
            actions: [
              TextButton(
                  onPressed: NonPressed,
                  child: Text(
                    NoText,
                    style: GoogleFonts.nunito(),
                  )),
              TextButton(
                  onPressed: YesPressed,
                  child: Text(
                    YesText,
                    style: GoogleFonts.nunito(),
                  )),
            ],
          );
        }));
  }

  static ThreeActions(String msg, BuildContext context,
      {Titre = "Message",
      void Function()? YesPressed,
      NonPressed,
      CancelPressed,
      required String YesText,
      NoText,
      CancelText}) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Text(Titre),
            content: Text(msg),
            actions: [
              TextButton(
                  onPressed: NonPressed,
                  child: Text(
                    NoText,
                    style: TextStyle(color: AppData.BasicColor),
                  )),
              TextButton(
                  onPressed: YesPressed,
                  child: Text(YesText,
                      style: TextStyle(color: AppData.BasicColor))),
              TextButton(
                  onPressed: CancelPressed,
                  child: Text(CancelText,
                      style: TextStyle(color: AppData.BasicColor))),
            ],
          );
        }));
  }

  static Load(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) {
          return Center(
            child: Container(
              padding: EdgeInsets.all(10),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: CircularProgressIndicator(
                color: AppData.BasicColorNew,
              ),
            ),
          );
        }));
  }

  static BoitInfo(BuildContext context, TextEditingController controller,
      void Function() onTap,
      {bool isTaxis = false}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: ((context) {
        return Center(
          child: Container(
            padding: EdgeInsets.all(10),
            height: 200,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Material(
              child: Container(
                height: 20,
                width: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TxtFc(
                        Tcontroller: controller,
                        hintText: 'Nouvelle entrée',

                        // controller: controller,
                        // hintText: isTaxis?"Matricule":"AdresseMail",
                        // isMail: true,
                        // errM: "",
                        isNumber: isTaxis,
                        icon: Icons.abc,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonC(
                        text: "Valider",
                        onPressed: onTap,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
