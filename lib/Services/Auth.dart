import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:african_ap/Data/SaveUser.dart';
import 'package:african_ap/Models/User.dart';
import 'package:african_ap/Services/dbServices.dart';
import 'package:african_ap/Vue/LocalApp/Principal.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:african_ap/Vue/Widgets/ChangePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class AuthServices extends GetxController {
  static AuthServices instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
  }

  register(context, UserM user) {
    try {
      auth
          .createUserWithEmailAndPassword(
              email: user.email, password: user.passw)
          .then((value) => dbServices().UserSave(UserM(
              Id: value.user!.uid,
              prenom: user.prenom,
              nom: user.nom,
              telephone: user.telephone,
              email: user.email,
              passw: user.passw,
              imageName: user.imageName,
              imageData: user.imageData)))
          .onError((error, stackTrace) {
        String code =
            error.toString().split(" ").first.split("/")[1].split("]").first;
        switch (code) {
          case "email-already-in-use":
            Navigator.pop(context);
            Toast.show("Cette adresse E-mail existe déjà", duration: 3);
            break;
          case "invalid-email":
            Navigator.pop(context);
            Toast.show("Adresse E-mail invalide", duration: 3);
            break;
          case "weak-password":
            Navigator.pop(context);
            Toast.show("Le mode de passe doit contenir au moins 6 caractères",
                duration: 3);
            break;
          default:
            Navigator.pop(context);

            Toast.show(code, duration: 3);
        }
        log(code);
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future Login(context, String email, String passW) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: passW)
          .then((us) {
        dbServices().UserGet(us.user!.uid).then((docS) {
          final user = docS.data() as Map<String, dynamic>;
          if (user["isLamda"]) {
            UserM usM =UserM(
                    prenom: user["prenom"],
                    nom: user["nom"],
                    telephone: '',
                    email: user["email"],
                    passw: '',
                    imageName: user["imageName"],
                    imageData: File('')
                    );
            SaveUser.Sauvegarde(
                user:usM );
                ChangePage.pushReplacement(context: context, push: Principal(user: usM));

          } else {
            log("no");
          }
        });
      }).onError((error, stackTrace) {
        String code =
            error.toString().split(" ").first.split("/")[1].split("]").first;
        switch (code) {
          case "wrong-password":
            Navigator.pop(context);
            Toast.show("Le mot de passe est incorrect", duration: 3);
            break;
          case "invalid-email":
            Navigator.pop(context);
            Toast.show("Adresse E-mail invalide", duration: 3);
            break;
          case "user-not-found":
            Navigator.pop(context);
            Toast.show(
                "Nous n'avons pas réconnu cette adresse mail, veuillez vérifier si vous avez bien écrit",
                duration: 5);
            break;
          case "too-many-requests":
            Navigator.pop(context);
            Toast.show(
                "Vous avez entré plusieurs fois un mauvais mot de passe, nous avons bloqué l'accès de ce compte veuillez réssayer plustard avec un mot de passe",
                duration: 5);
            break;
          default:
            Navigator.pop(context);
            Toast.show(code, duration: 3);
        }
        log(code);
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
