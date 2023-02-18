import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:african_ap/Controllers/SuperUserController.dart';
import 'package:african_ap/Data/SaveUser.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Models/User.dart';
import 'package:african_ap/Vue/LocalApp/Principal.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class LoginController {
  static UserLogin(context, User user) async {
    BasicsWidgets.Load(context);
    final reponse = await http.post(
        Uri.parse("https://africanap.000webhostapp.com/african_ap/login.php/"),
        body: {"email_telephone": user.email, "passw": user.passw});
    if (reponse.statusCode == 200) {
      try {
        String rs = reponse.body.toString().replaceAll("\n", "");
        var data = jsonDecode(rs);
        var resultat = data["data"];
        var recupUser = resultat[2];
        int succes = resultat[1];
        if (succes == 1) {
          User us = User(
            Id: recupUser["idUser"],
            prenom: recupUser["Prenom"],
            nom: recupUser["nom"],
            telephone: recupUser["telephone"],
            email: recupUser["email"],
            imageName: recupUser["image"],
            imageData: File(""),
            passw: recupUser["passW"],
          );
          SaveUser.Sauvegarde(user: us);
          await SaveUser.getUser().then((value) =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Principal(user: value),
              )));
        } else {
          // Navigator.pop(context);
          // Toast.show(resultat[0],duration: 4);
          SuperUserController.SuperUserLogin(context,
              email: user.email, mtp: user.passw);
          log(resultat[0]);
        }
        log(succes.toString());
      } catch (e) {
        Navigator.pop(context);
        log(e.toString());
        print(e);
      }
    }
  }

  static Supprimer(context, String email) async {
    BasicsWidgets.Load(context);
    final reponse = await http.post(
        Uri.parse(
            "https://africanap.000webhostapp.com/african_ap/SupprimerUser.php/"),
        body: {"email": email});
    if (reponse.statusCode == 200) {
      try {
        String rs = reponse.body.toString().replaceAll("\n", "");
        var data = jsonDecode(rs);
        var resultat = data["data"];
        int succes = resultat[1];
        if (succes == 1) {
          log("Suppression reussie");
        } else {
          Navigator.pop(context);
          Toast.show(resultat[0]);
          log(resultat[0]);
        }
        log(succes.toString());
      } catch (e) {
        Navigator.pop(context);
        log('Here ..... : ' + e.toString());
        print(e);
      }
    }
  }
}
