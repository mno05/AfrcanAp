import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:african_ap/Controllers/LoginController.dart';
import 'package:african_ap/Data/SaveSuperUser.dart';
import 'package:african_ap/Data/SaveUser.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Models/User.dart';
import 'package:african_ap/Vue/Auth/Inscription.dart';
import 'package:african_ap/Vue/LocalApp/Principal.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:toast/toast.dart';

class SuperUserController {
  static void Inscription(context, SuperUser superUser) async {
    BasicsWidgets.Load(context);
    try {
      String url =
          "https://myap.moglich.net/api/inscriptionSuperUser.php/";
      FormData formData = FormData.fromMap(superUser.ToMap());
      final Response = await Dio().post(url, data: formData);
      if (Response.statusCode == 200) {
        String rs = Response.data.toString().replaceAll("\n", "");
        var data = jsonDecode(rs);
        var resultat = data["data"];
        int succes = resultat[1];
        if (succes == 1) {
          Navigator.pop(context);
          LoginController.Supprimer(context, superUser.adresseMail);
          SaveSuperUser.Sauvegarde(superUser: superUser);
          Toast.show("Vous étes maintenant membre ${superUser.type}",
              duration: 5);
          SaveUser.getUser().then((v) => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Principal(user: v)),
              ));
        } else {
          Navigator.pop(context);
          Toast.show(resultat[0], duration: 8);
        }
        print(succes);
      }
    } catch (e) {
      Navigator.pop(context);
      log(e.toString());
    }
  }

  static SuperUserLogin(context,
      {required String email, required String mtp}) async {
    final reponse = await http.post(
        Uri.parse(
            "https://myap.moglich.net/api/loginSu.php/"),
        body: {"email_telephone": email, "passw": mtp});
    if (reponse.statusCode == 200) {
      try {
        String rs = reponse.body.toString().replaceAll("\n", "");
        var data = jsonDecode(rs);
        var resultat = data["data"];
        var recupUser = resultat[2];
        int succes = resultat[1];
        if (succes == 1) {
          log("Login");
          User us = User(
            Id: recupUser["idSuper"],
            prenom: recupUser["prenom"],
            nom: recupUser["nom"],
            telephone: recupUser["telephone"],
            email: recupUser["adresseMail"],
            imageName: recupUser["imagePath"],
            imageData: File(""),
            passw: recupUser["mtp"],
          );
          SuperUser su = SuperUser(
              mtp: recupUser["mtp"],
              idSuper: recupUser["idSuper"],
              prenom: recupUser["prenom"],
              nom: recupUser["nom"],
              paysOrgine: recupUser["paysOrgine"],
              adresse: recupUser["adresse"],
              codePostal: recupUser["codePostal"],
              localite: recupUser["localite"],
              pays: recupUser["pays"],
              telephone: recupUser["telephone"],
              adresseMail: recupUser["adresseMail"],
              type: recupUser["type"],
              statutpro: recupUser["statutpro"],
              autreStatut: recupUser["autreStatut"],
              fonction: recupUser["fonction"],
              domainesExpertise: recupUser["domainesExpertise"],
              imagePath: recupUser["imagePath"]);

          SaveSuperUser.Sauvegarde(superUser: su);
          SaveUser.Sauvegarde(user: us);
          await SaveUser.getUser().then((value) =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Principal(user: value),
              )));
        } else {
          Navigator.pop(context);
          Toast.show(resultat[0]);
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
  static SuperUserLoginWithoutPw(context,
      {required String email}) async {
    final reponse = await http.post(
        Uri.parse(
            "https://myap.moglich.net/api/loginSu2.php/"),
        body: {"email_telephone": email});
    if (reponse.statusCode == 200) {
      try {
        String rs = reponse.body.toString().replaceAll("\n", "");
        var data = jsonDecode(rs);
        var resultat = data["data"];
        var recupUser = resultat[2];
        int succes = resultat[1];
        if (succes == 1) {
          log("Login");
          User us = User(
            Id: recupUser["idSuper"],
            prenom: recupUser["prenom"],
            nom: recupUser["nom"],
            telephone: recupUser["telephone"],
            email: recupUser["adresseMail"],
            imageName: recupUser["imagePath"],
            imageData: File(""),
            passw: recupUser["mtp"],
          );
          SuperUser su = SuperUser(
              mtp: recupUser["mtp"],
              idSuper: recupUser["idSuper"],
              prenom: recupUser["prenom"],
              nom: recupUser["nom"],
              paysOrgine: recupUser["paysOrgine"],
              adresse: recupUser["adresse"],
              codePostal: recupUser["codePostal"],
              localite: recupUser["localite"],
              pays: recupUser["pays"],
              telephone: recupUser["telephone"],
              adresseMail: recupUser["adresseMail"],
              type: recupUser["type"],
              statutpro: recupUser["statutpro"],
              autreStatut: recupUser["autreStatut"],
              fonction: recupUser["fonction"],
              domainesExpertise: recupUser["domainesExpertise"],
              imagePath: recupUser["imagePath"]);
          SaveSuperUser.Supprimer();
          SaveSuperUser.Sauvegarde(superUser: su);
          SaveUser.Sauvegarde(user: us);
          await SaveUser.getUser().then((value) =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Principal(user: value),
              )));
        } else {
          Navigator.pop(context);
          Toast.show(resultat[0]);
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
}
