import 'dart:developer';
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Data/User.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Services/dbServices.dart';
import 'package:african_ap/Vue/Auth/LoginVue.dart';
import 'package:african_ap/Vue/LocalApp/Principal.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class AuthServices extends GetxController {
  static AuthServices instance = Get.find();
  // late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  // @override
  // void onReady() {
  //   super.onReady();
  //   _user = Rx<User?>(auth.currentUser);
  //   _user.bindStream(auth.userChanges());
  // }

  authStateChanges() {
    return auth.authStateChanges();
  }

  register(context, UserM user) {
    BasicsWidgets.Load(context);
    try {
      auth
          .createUserWithEmailAndPassword(
              email: user.adresseMail, password: user.passW!)
          .then((value) async {
        AppData.Uid = value.user!.uid;
        UserM userM = UserM(
            Uid: value.user!.uid,
            prenom: user.prenom,
            nom: user.nom,
            telephone: user.telephone,
            adresseMail: user.adresseMail,
            passW: user.passW,
            imagePath: user.imagePath,
            imageData: user.imageData,
            isLambda: true);

        await dbServices().UserSave(userM).then((_) async {
          await dbServices().getUserM(value.user!.uid).then((u) async {
            // log('Were are in' + u.toString());
            await SaveSuperUser.Sauvegarde(user: u);
            Get.offAll(() => Principal());
          });
        });
      }).onError((error, stackTrace) {
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
    BasicsWidgets.Load(context);
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: passW)
          .then((us) {
        AppData.Uid = us.user!.uid;
        log(AppData.Uid!);
        dbServices().getUserM(us.user!.uid).then((u) async {
          await SaveSuperUser.Sauvegarde(user: u);
          // Navigator.pop(context);
          Get.off(Principal());
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

  Logout(context) {
    auth.signOut().then((value) => Get.offAll(() => const LoginVue()));
  }
}
