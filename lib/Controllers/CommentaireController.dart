import 'dart:convert';
import 'dart:developer';

import 'package:african_ap/Models/Commentaire.dart';
import 'package:dio/dio.dart';

class CommentaireController{

   static void Commenter(idUser,idPost,contenu) async {
    try {
      String url =
          "https://africanap.000webhostapp.com/african_ap/Commenter.php/";

      FormData formData = FormData.fromMap({
          "idPost":idUser,
          "idUser":idPost,
          "contenu":contenu
      });
      final Response = await Dio().post(url, data: formData);
      if (Response.statusCode == 200) {
        String rs = Response.data.toString().replaceAll("\n", "");
        var data = jsonDecode(rs);
        var resultat = data["data"];
        int succes = resultat[1];
        if (succes == 1) {
         log(data.toString());
        } else {
        //  log(data.toString());

          // Toast.show(resultat[0], duration: 8);
        }
        print(succes);
      }
    } catch (e) {
      // log(e.toString());
    }
  }
}