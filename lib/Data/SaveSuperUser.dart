import 'dart:developer';
import 'dart:io';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveSuperUser {
  static Sauvegarde({required SuperUser superUser}) async {
    log("In Sauvegerde");
    SharedPreferences sh = await SharedPreferences.getInstance();
    bool verif = await sh.setStringList("SuperUser", [
      superUser.idSuper!,
      superUser.prenom,
      superUser.nom,
      superUser.paysOrgine,
      superUser.adresse,
      superUser.codePostal,
      superUser.localite,
      superUser.pays,
      superUser.telephone,
      superUser.adresseMail,
      superUser.type,
      superUser.statutpro,
      superUser.autreStatut,
      superUser.fonction,
      superUser.domainesExpertise,
      superUser.imagePath,
    ]);
    if (verif) {
      log("Sauvegarde reussie");
    } else {
      log("Sauvegarde echoué");
    }
  }

  static Future<SuperUser> getSuperUser() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    if (sh.getStringList("SuperUser") != null) {
      return SuperUser(
          idSuper: sh.getStringList("SuperUser")![0],
          prenom: sh.getStringList("SuperUser")![1],
          nom: sh.getStringList("SuperUser")![2],
          paysOrgine: sh.getStringList("SuperUser")![3],
          adresse: sh.getStringList("SuperUser")![4],
          codePostal: sh.getStringList("SuperUser")![5],
          localite: sh.getStringList("SuperUser")![6],
          pays: sh.getStringList("SuperUser")![7],
          telephone: sh.getStringList("SuperUser")![8],
          adresseMail: sh.getStringList("SuperUser")![9],
          type: sh.getStringList("SuperUser")![10],
          statutpro: sh.getStringList("SuperUser")![11],
          autreStatut: sh.getStringList("SuperUser")![12],
          fonction: sh.getStringList("SuperUser")![13],
          domainesExpertise: sh.getStringList("SuperUser")![14],
          imagePath: sh.getStringList("SuperUser")![15]);
    } else {
      return SuperUser(prenom: "", nom: "", paysOrgine: "", adresse: "", codePostal: "", localite: "", pays: "", telephone: "", adresseMail: "", type: "", statutpro: "", autreStatut: "", fonction: "", domainesExpertise: "", imagePath: "");
    }
  }
  static Supprimer() async{
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.remove("SuperUser");
  }
}
