import 'dart:developer';
import 'dart:io';
import 'package:african_ap/Data/SaveSuperUser.dart';
import 'package:african_ap/Models/User.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:firebase_storage/firebase_storage.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

class dbServices {
  var db = FirebaseFirestore.instance;

//Sauvegarde user
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  FirebaseStorage _storage = FirebaseStorage.instance;

//UploadFile
  Future<String> UploadFile({required File file, required String ref}) async {
    Reference reference = _storage.ref().child(ref);
    UploadTask uploadTask = reference.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  //SaveUser
  UserSave(UserM user) {
    if (user.imageName == "") {
      String DefaultimageProfil =
          "https://firebasestorage.googleapis.com/v0/b/myapp-9aa8d.appspot.com/o/ProfileImage%2FDefault.png?alt=media&token=d3b7b0c6-8e76-4874-b065-58e6e34f7a00";
      db.collection("users").doc(user.Id).set({
        "Uid": user.Id,
        "prenom": user.prenom,
        "nom": user.nom,
        "email": user.email,
        "imageName": DefaultimageProfil,
        "isLamda": true
      });
      // userCollection.add({
      //   "Uid": user.Id,
      //   "prenom": user.prenom,
      //   "nom": user.nom,
      //   "email": user.email,
      //   "imageName": DefaultimageProfil,
      // });
    } else {
      UploadFile(
              file: user.imageData,
              ref: "ProfileImage/${user.prenom}_${user.nom}.png")
          .then((url) => db.collection("users").doc(user.Id).set({
                "Uid": user.Id,
                "prenom": user.prenom,
                "nom": user.nom,
                "email": user.email,
                "imageName": url,
                "isLamda": true
              }));
    }
  }

  UserGet(Uid) async {
    // log(Uid);
    return await db.collection("users").doc(Uid).get();
    // onError((error, stackTrace){
    //   log(error.toString());
    //   Toast.show(error.toString(),duration: 3);
    //   return {};
    // });
  }
}
