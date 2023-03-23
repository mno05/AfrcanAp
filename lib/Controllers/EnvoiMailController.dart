import 'dart:convert';
import 'dart:developer';

import 'package:african_ap/Vue/Auth/RecupOTP.dart';
import 'package:african_ap/Vue/Widgets/ChangePage.dart';
import 'package:flutter/widgets.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

class EnvoieMailController {
  static Envoiemail(String mail, context) async {
    final reponse = await http.post(
        Uri.parse("https://myap.moglich.net/api/EmailOtp/"),
        body: {"email": mail});
    if (reponse.statusCode == 200) {
      try {
        String rs = reponse.body.toString().replaceAll("\n", "");
        var data = jsonDecode(rs);
        var resultat = data["data"];
        int recupOtp = resultat[1];
        String succes = resultat[0];
        if (succes == "Valide") {
          return recupOtp;
        } else {
          Navigator.pop(context);
          Toast.show(succes);
        }
      } catch (e) {
        Navigator.pop(context);
        log(e.toString());
      }
    }
  }
}
