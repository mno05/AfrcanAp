import 'package:african_ap/Data/AppData.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BasicsWidgets {
  static alert(String msg, BuildContext context, {Titre = "Message"}) {
    // Navigator.pop(context);
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Text(Titre),
            content: Text(msg),
            actions: [
              TextButton(
                  onPressed: (() => Navigator.of(context).pop()),
                  child: Text("OK"))
            ],
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
            title: Text(Titre),
            content: Text(msg),
            actions: [
              TextButton(onPressed: NonPressed, child: Text(NoText)),
              TextButton(onPressed: YesPressed, child: Text(YesText)),
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
                    color: Color(0xffEB7D30),
                  ),
                ),
              );
            }))
        //     .timeout(Duration(seconds: 5),onTimeout: () {
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => alert("msg", context),));

        //       // alert("Nous avons racontré un problème pour se connecter", context,Titre: "Temps depassé");
        //       // Navigator.of(context).pop();
        //     }
        ;
  }
}
