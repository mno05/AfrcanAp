import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:african_ap/Models/Post.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:toast/toast.dart';


class PostController {
  static void Publier(context, Post post) async {
    BasicsWidgets.Load(context);
    try {
      String path = post.fileData!.path;
      String fileName = basename(path);
      FormData formData;
      String url =
          "https://africanap.000webhostapp.com/african_ap/PostPublier.php/";
      if(post.PathContenu == "" || post.Legende==""){
        Toast.show("Veuillez écrire quelque chose");
      }
      else{
      if (post.PathContenu == "nul") {
        formData = FormData.fromMap({
          "idUser": post.idUser,
          "Portee": post.Portee,
          "Legende": post.Legende,
          "PathContenu": "",
          "fileData": File(""),
        });
      } else {
        formData = FormData.fromMap({
          "idUser": post.idUser,
          "Portee": post.Portee,
          "Legende": post.Legende,
          "PathContenu": post.PathContenu,
          "fileData": await MultipartFile.fromFile(path, filename: fileName),
        });
      }
      final Response = await Dio().post(url, data: formData);
      if (Response.statusCode == 200) {
        String rs = Response.data.toString().replaceAll("\n", "");
        var data = jsonDecode(rs);
        var resultat = data["data"];
        int succes = resultat[1];
        if (succes == 1) {
          log(resultat.toString());
          // Navigator.pop(context);
          // LoginControlle.UserLogin(
          //     context,
          //     User(
          //         prenom: "",
          //         nom: "",
          //         telephone: "",
          //         email: user.email,
          //         passw: user.passw,
          //         imageName: "",
          //         imageData: File("")));
        } else {
          Navigator.pop(context);
          Toast.show(resultat[0], duration: 8);
        }
        print(succes);
      }
      }
    } catch (e) {
      Navigator.pop(context);
      log(e.toString());
    }
  }
}
