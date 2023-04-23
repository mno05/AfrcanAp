import 'dart:developer';
import 'dart:io';

import 'package:african_ap/Data/SaveSuperUser.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveUser {
  static Sauvegarde({required UserM user}) async {
    log("In Sauvegerde");
    SharedPreferences sh = await SharedPreferences.getInstance();
    bool verif= await sh.setStringList("userLamda", [
      user.Id,
      user.prenom,
      user.nom,
      user.telephone,
      user.email,
      user.imageName,
      user.passw,
    ]);
    if(verif){
      log("Sauvegarde reussie");
    }else{
      log("Sauvegarde echoué");
    }
  }

  static Future<UserM> getUser() async {
    SharedPreferences sh = await SharedPreferences.getInstance();

    SuperUser su = await SaveSuperUser.getSuperUser();

    if(sh.getStringList("userLamda")!=null){
    return UserM(
        Id: sh.getStringList("userLamda")![0],
        prenom: sh.getStringList("userLamda")![1],
        nom: sh.getStringList("userLamda")![2],
        telephone: sh.getStringList("userLamda")![3],
        email: sh.getStringList("userLamda")![4],
        passw: sh.getStringList("userLamda")![6],
        imageName: sh.getStringList("userLamda")![5],
        isLambda: su.nom.isEmpty,
        imageData: File(""));
    }else{
      return UserM(prenom: 'nulo', nom: '', telephone: '', email: '', passw: '', imageName: '', imageData: File(''));
    }
  }
  static SupprimerUser() async{
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.remove("userLamda");
  }
}
