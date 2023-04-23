import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:african_ap/Controllers/NotificationController.dart';
import 'package:african_ap/Data/SaveUser.dart';
import 'package:african_ap/Models/Notifiacation.dart';
import 'package:african_ap/Models/Post.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Models/User.dart';
import 'package:african_ap/Vue/LocalApp/Principal.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:toast/toast.dart';

class PostController {
  static void Publier(context, Post post,String prenom,String nom) async {
    BasicsWidgets.Load(context);
    try {
      String path = post.fileData!.path;
      String fileName = basename(path);
      FormData formData;
      String url = "https://myap.moglich.net/api/PostPublier.php/";
      if (post.PathContenu == "nul") {
        formData = FormData.fromMap({
          "idUser": post.idUser,
          "Portee": post.Portee,
          "Legende": post.Legende,
          "PathContenu": "",
          "fileData": File(""),
          "type": post.type,
        });
      } else {
        formData = FormData.fromMap({
          "idUser": post.idUser,
          "Portee": post.Portee,
          "Legende": post.Legende,
          "PathContenu": post.PathContenu,
          "fileData": await MultipartFile.fromFile(path, filename: fileName),
          "type": post.type,
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
          NotificationController.Notifier(
            NotificationM(idUser: post.idUser, date: DateTime.now(), contenue: "Le membre $prenom $nom vient de publier un post sur la plateforme.", idPost: "11", portee: post.Portee,imagePath: "vide")
          );
          BasicsWidgets.alertWithLottieAutoCloseToPrincipal(
              sec: 2,
              msg: "Post publié avec succès",
              context: context,
              lottie: "done");
          Toast.show("Post Publié");
        } else {
          Navigator.pop(context);
          Toast.show(resultat[0], duration: 8);
        }
        print(succes);
      }
      // }
    } catch (e) {
      Navigator.pop(context);
      log(e.toString());
    }
  }

  static Supprimer(context, String idPost) async {
    BasicsWidgets.Load(context);
    String url = "https://myap.moglich.net/api/SupprimerPost.php/";

    final response =
        await Dio().post(url, data: FormData.fromMap({"idPost": idPost}));

    if (response.statusCode == 200) {
      try {
        String rs = response.data.toString().replaceAll("\n", "");
        var data = jsonDecode(rs);
        var resultat = data["data"];
        int succes = resultat[1];
        if (succes == 1) {
          BasicsWidgets.alertWithLottieAutoCloseToPrincipal(
              sec: 2,
              msg: "Post Supprimé avec succès",
              context: context,
              lottie: "delete");
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

   static void Modifier(context, Post post,String IsChange) async {
    BasicsWidgets.Load(context);
    try {
      String path = post.fileData!.path;
      String fileName = basename(path);
      FormData formData;
      String url = "https://myap.moglich.net/api/PostUpdate.php/";
      if (IsChange == "No") {
        formData = FormData.fromMap({
          "idPost": post.idPost,
          "Portee": post.Portee,
          "Legende": post.Legende,
          "PathContenu": "",
          "IsContenuChage": IsChange,
          "fileData": File(""),
          "type": post.type,
        });
      } else {
        formData = FormData.fromMap({
          "idPost": post.idPost,
          "Portee": post.Portee,
          "Legende": post.Legende,
          "IsContenuChage": IsChange,
          "PathContenu": post.PathContenu,
          "fileData": await MultipartFile.fromFile(path, filename: fileName),
          "type": post.type,
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
          BasicsWidgets.alertWithLottieAutoCloseToPrincipal(
              sec: 2,
              msg: "Post Modifié avec succès",
              context: context,
              lottie: "done");
          // Toast.show("Post Publié");
        } else {
          Navigator.pop(context);
          Toast.show(resultat[0], duration: 8);
        }
        print(succes);
      }
      // }
    } catch (e) {
      Navigator.pop(context);
      log(e.toString());
    }
  }


static void Republier(context, Post post) async {
    BasicsWidgets.Load(context);
    try {
      FormData formData;
      String url = "https://myap.moglich.net/api/PostRepublier.php/";
        formData = FormData.fromMap({
          "idUser": post.idUser,
          "Portee": post.Portee,
          "Legende": post.Legende,
          "PathContenu": post.PathContenu,
          "type": post.type,
        });
      final Response = await Dio().post(url, data: formData);
      if (Response.statusCode == 200) {
        String rs = Response.data.toString().replaceAll("\n", "");
        var data = jsonDecode(rs);
        var resultat = data["data"];
        int succes = resultat[1];
        if (succes == 1) {
          log(resultat.toString());
          BasicsWidgets.alertWithLottieAutoCloseToPrincipal(
              sec: 2,
              msg: "Post republié avec succès",
              context: context,
              lottie: "done");
          Toast.show("Post Publié");
        } else {
          Navigator.pop(context);
          Toast.show(resultat[0], duration: 8);
        }
        print(succes);
      }
      // }
    } catch (e) {
      Navigator.pop(context);
      log(e.toString());
    }
  }


}
