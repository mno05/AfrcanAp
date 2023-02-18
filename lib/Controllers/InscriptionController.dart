import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:african_ap/Controllers/LoginController.dart';
import 'package:african_ap/Models/User.dart';
import 'package:african_ap/Vue/LocalApp/Principal.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:toast/toast.dart';

class InscriptionController {
  static void UserInscription(context, User user) async {
    BasicsWidgets.Load(context);
    try {
      String fileName = basename(user.imageData.path);
      String path = user.imageData.path;
      FormData formData;
      // String Url = "https://myap.moglich.net/api/inscription.php/";
      String url =
          "https://africanap.000webhostapp.com/african_ap/inscription.php/";
      if (user.imageName == "") {
        formData = FormData.fromMap({
          "prenom": user.prenom,
          "nom": user.nom,
          "telephone": user.telephone,
          "email": user.email,
          "passw": user.passw,
          "imageName": "",
        });
      } else {
        formData = FormData.fromMap({
          "prenom": user.prenom,
          "nom": user.nom,
          "telephone": user.telephone,
          "email": user.email,
          "passw": user.passw,
          "imageName": user.imageName,
          "imageData": await MultipartFile.fromFile(path, filename: fileName),
        });
      }
      final Response = await Dio().post(url, data: formData);
      if (Response.statusCode == 200) {
        String rs = Response.data.toString().replaceAll("\n", "");
        var data = jsonDecode(rs);
        var resultat = data["data"];
        int succes = resultat[1];
        if (succes == 1) {
          Toast.show("Inscription réussie");
          Navigator.pop(context);
          LoginController.UserLogin(
              context,
              User(
                  prenom: "",
                  nom: "",
                  telephone: "",
                  email: user.email,
                  passw: user.passw,
                  imageName: "",
                  imageData: File("")));
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
}
