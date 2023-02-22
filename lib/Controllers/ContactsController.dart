import 'dart:convert';
import 'dart:developer';

import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class ContactsController {
  static Future<List<SuperUser>> AllContacts() async {
    final response = await http.post(Uri.parse(
        "https://africanap.000webhostapp.com/african_ap/recupAllContacts.php"));
    String rs = response.body.toString().replaceAll("\n", "");
    var data = jsonDecode(rs);
    List<dynamic> valuues = data;
    List<SuperUser> superUsers = [];

    for (int i = 0; i < valuues.length; i++) {
      superUsers.add(SuperUser(
          idSuper: data[i]["idSuper"],
          prenom: data[i]["prenom"],
          nom: data[i]["nom"],
          paysOrgine: data[i]["paysOrgine"],
          adresse: data[i]["adresse"],
          codePostal: data[i]["codePostal"],
          localite: data[i]["localite"],
          pays: data[i]["pays"],
          telephone: data[i]["telephone"],
          adresseMail: data[i]["adresseMail"],
          type: data[i]["type"],
          statutpro: data[i]["statutpro"],
          autreStatut: data[i]["autreStatut"],
          fonction: data[i]["fonction"],
          domainesExpertise: data[i]["domainesExpertise"],
          imagePath: data[i]["imagePath"]));
    }
    // superUsers.forEach((element) {log(element.ToMap().toString());});
    return superUsers;
  }

  static Contacter({required context, required idDes, required idEx}) async {
    try {
      String url =
          "https://africanap.000webhostapp.com/african_ap/Contacter.php/";

      FormData formData = FormData.fromMap({
        "idEx": idEx,
        "idDes": idDes,
      });
      final Response = await Dio().post(url, data: formData);
      if (Response.statusCode == 200) {
        String rs = Response.data.toString().replaceAll("\n", "");
        var data = jsonDecode(rs);
        var resultat = data["data"];
        int succes = resultat[1];
        if (succes == 1) {
          log("Contacter esimbi");
          Navigator.pop(context);
          BasicsWidgets.alert("La demande a été envoyée avec succes", context,
              Titre: "");
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
  static ContacterC({required idDes, required idEx}) async {
    try {
      String url =
          "https://africanap.000webhostapp.com/african_ap/Contacter.php/";

      FormData formData = FormData.fromMap({
        "idEx": idEx,
        "idDes": idDes,
      });
      final Response = await Dio().post(url, data: formData);
      if (Response.statusCode == 200) {
        String rs = Response.data.toString().replaceAll("\n", "");
        var data = jsonDecode(rs);
        var resultat = data["data"];
        int succes = resultat[1];
        if (succes == 1) {

        } else {
          Toast.show(resultat[0], duration: 8);
        }
        print(succes);
      }
    } catch (e) {
      log(e.toString());
    }
  }
  static Future<List<SuperUser>> ContactMessage(String idDes) async {
    final response = await http.post(
        Uri.parse(
            "https://africanap.000webhostapp.com/african_ap/MessageContact.php"),
        body: {"idDes": idDes});
    String rs = response.body.toString().replaceAll("\n", "");
    var data = jsonDecode(rs);
    List<dynamic> valuues = data;
    List<SuperUser> superUsers = [];
          log("Total : ${data.length}");

    for (int i = 0; i < valuues.length; i++) {
      superUsers.add(SuperUser(
          idSuper: data[i]["idSuper"],
          prenom: data[i]["prenom"],
          nom: data[i]["nom"],
          paysOrgine: data[i]["paysOrgine"],
          adresse: data[i]["adresse"],
          codePostal: data[i]["codePostal"],
          localite: data[i]["localite"],
          pays: data[i]["pays"],
          telephone: data[i]["telephone"],
          adresseMail: data[i]["adresseMail"],
          type: data[i]["type"],
          statutpro: data[i]["statutpro"],
          autreStatut: data[i]["autreStatut"],
          fonction: data[i]["fonction"],
          domainesExpertise: data[i]["domainesExpertise"],
          imagePath: data[i]["imagePath"]));
    }
    return superUsers;
  }
}
