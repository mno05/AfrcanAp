import 'dart:developer';
import 'package:african_ap/Models/Post.dart';
import 'package:african_ap/Services/dbServices.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toast/toast.dart';

class PostController {
  static void Publier(context, Post post, String prenom, String nom) async {
    BasicsWidgets.Load(context);
    try {
      dbServices().savePost(post).then((_) {
        BasicsWidgets.alertWithLottieAutoCloseToPrincipal(
            sec: 3,
            msg: "Votre poste sera publié une fois validé",
            context: context,
            lottie: "done");
        // Toast.show("Post Publié");
      });
    } catch (e) {
      Navigator.pop(context);
      log(e.toString());
    }
  }

  static Supprimer(context, String idPost) async {
    BasicsWidgets.Load(context);
    try {
      dbServices().supprimerPost(idPost).then((value) {
        BasicsWidgets.alertWithLottieAutoCloseToPrincipal(
            sec: 2,
            msg: "Post Supprimé avec succès",
            context: context,
            lottie: "done");
      });
      log("Suppression reussie");
    } catch (e) {
      Navigator.pop(context);
      log('Here ..... : ' + e.toString());
      print(e);
    }
  }

  static void Modifier(context, Post post, String isChange) async {
    BasicsWidgets.Load(context);
    try {

      await dbServices().updatePost(post, isChange).then((_) {
        BasicsWidgets.alertWithLottieAutoCloseToPrincipal(
            sec: 2,
            msg: "Post modifié avec succès",
            context: context,
            lottie: "done");
        Toast.show("Post modifié");
      });
      log("Suppression reussie");

      // String url = "https://myap.moglich.net/api/PostUpdate.php/";
      // if (IsChange == "No") {
      //   formData = FormData.fromMap({
      //     "idPost": post.idPost,
      //     "Portee": post.Portee,
      //     "Legende": post.Legende,
      //     "PathContenu": "",
      //     "IsContenuChage": IsChange,
      //     "fileData": File(""),
      //     "type": post.type,
      //   });
      // } else {
      //   formData = FormData.fromMap({
      //     "idPost": post.idPost,
      //     "Portee": post.Portee,
      //     "Legende": post.Legende,
      //     "IsContenuChage": IsChange,
      //     "PathContenu": post.PathContenu,
      //     "fileData": await MultipartFile.fromFile(path, filename: fileName),
      //     "type": post.type,
      //   });
      // }
      // if (Response.statusCode == 200) {
      //   String rs = Response.data.toString().replaceAll("\n", "");
      //   var data = jsonDecode(rs);
      //   var resultat = data["data"];
      //   int succes = resultat[1];
      //   if (succes == 1) {
      //     log(resultat.toString());
      //     BasicsWidgets.alertWithLottieAutoCloseToPrincipal(
      //         sec: 2,
      //         msg: "Post Modifié avec succès",
      //         context: context,
      //         lottie: "done");
      //     // Toast.show("Post Publié");
      //   } else {
      //     Navigator.pop(context);
      //     Toast.show(resultat[0], duration: 8);
      //   }
      //   print(succes);
      // }
      // }
    } catch (e) {
      Navigator.pop(context);
      log(e.toString());
    }
  }

  static void Republier(context, Post post) async {
    BasicsWidgets.Load(context);
    try {
      await dbServices().republier(post).then((_) {
        BasicsWidgets.alertWithLottieAutoCloseToPrincipal(
            sec: 4,
            msg: "Poste envoyé pour être valider",
            context: context,
            lottie: "done");
        Toast.show("Post républié");
      });
      log("républié reussie");
    } catch (e) {
      Navigator.pop(context);
      log(e.toString());
    }
  }
}
