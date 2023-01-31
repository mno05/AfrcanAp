import 'package:flutter/material.dart';
class BasicsWidgets {
  static alert(String msg, BuildContext context,{Titre="Message"}) {
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
