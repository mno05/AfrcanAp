import 'dart:convert';
import 'dart:developer';

import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

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
}
