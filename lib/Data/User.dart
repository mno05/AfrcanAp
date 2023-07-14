import 'dart:developer';
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SaveSuperUser {
  static Sauvegarde({required UserM user}) async {
    log("In Sauvegerde");
    SharedPreferences sh = await SharedPreferences.getInstance();
    Map<String, dynamic> userDataToSave = {
      if (user.Uid != null) "Uid": user.Uid,
      if (user.nom != null) "nom": user.nom,
      if (user.prenom != null) "prenom": user.prenom,
      if (user.paysOrgine != null) "paysOrgine": user.paysOrgine,
      if (user.adresse != null) "adresse": user.adresse,
      if (user.codePostal != null) "codePostal": user.codePostal,
      if (user.localite != null) "localite": user.localite,
      if (user.pays != null) "pays": user.pays,
      if (user.telephone != null) "telephone": user.telephone,
      if (user.adresseMail != null) "adresseMail": user.adresseMail,
      if (user.type != null) "type": user.type,
      if (user.statutpro != null) "statutpro": user.statutpro,
      if (user.fonction != null) "fonction": user.fonction,
      if (user.domainesExpertise != null)
        "domainesExpertise": user.domainesExpertise,
      if (user.imagePath != null) "imageName": user.imagePath,
      if (user.isRoot != null) "isRoot": user.isRoot,
      if (user.isLambda != null) "isLambda": user.isLambda,
      if (user.dateAdhesion != null) "dateAdhesion": user.dateAdhesion,
    };

    //Encodons cela

    String userEncode = json.encode(userDataToSave);
    bool verif = await sh.setString("user", userEncode);
    await setValue(AppData.userPref, userEncode).then((value) {
      if (value) {
        log("Sauvegarde reussie");
      } else {
        log("Sauvegarde echoué");
      }
    });
  }

  static Future<UserM> getSuperUser() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    String userDecode = sh.getString("user")!;

    Map<String, dynamic> data = json.decode(userDecode);
    return UserM(
      Uid: data["Uid"],
      nom: data['nom'],
      prenom: data['prenom'],
      paysOrgine: data['paysOrgine'],
      adresse: data['adresse'],
      codePostal: data['codePostal'],
      localite: data['localite'],
      pays: data['pays'],
      telephone: data['telephone'],
      adresseMail: data['adresseMail'],
      type: data['type'],
      statutpro: data['statutpro'],
      fonction: data['fonction'],
      domainesExpertise: data['domainesExpertise'],
      imagePath: data['imageName'],
      isRoot: data['isRoot'],
      isLambda: data['isLambda'],
      dateAdhesion: data['dateAdhesion'],
    );
    // } else {
    //      return UserM(
    //     prenom: "",
    //     nom: "",
    //     paysOrgine: "",
    //     adresse: "",
    //     codePostal: "",
    //     localite: "",
    //     pays: "",
    //     telephone: "",
    //     adresseMail: "",
    //     type: "",
    //     statutpro: "",
    //     autreStatut: "",
    //     fonction: "",
    //     domainesExpertise: "",
    //     imagePath: "",
    //     isLambda: null!,
    //   );
    // }

    // if (sh.getStringList("user") != null) {
    //   return UserM(
    //       Uid: sh.getStringList("SuperUser")![0],
    //       prenom: sh.getStringList("SuperUser")![1],
    //       nom: sh.getStringList("SuperUser")![2],
    //       paysOrgine: sh.getStringList("SuperUser")![3],
    //       adresse: sh.getStringList("SuperUser")![4],
    //       codePostal: sh.getStringList("SuperUser")![5],
    //       localite: sh.getStringList("SuperUser")![6],
    //       pays: sh.getStringList("SuperUser")![7],
    //       telephone: sh.getStringList("SuperUser")![8],
    //       adresseMail: sh.getStringList("SuperUser")![9],
    //       type: sh.getStringList("SuperUser")![10],
    //       statutpro: sh.getStringList("SuperUser")![11],
    //       autreStatut: sh.getStringList("SuperUser")![12],
    //       fonction: sh.getStringList("SuperUser")![13],
    //       domainesExpertise: sh.getStringList("SuperUser")![14],
    //       imagePath: sh.getStringList("SuperUser")![15],
    //       isRoot: (sh.getStringList("SuperUser")![16] == "true"),
    //       isLambda: (sh.getStringList("SuperUser")![17] == "true"));
    // } else {
    //   return UserM(
    //     prenom: "",
    //     nom: "",
    //     paysOrgine: "",
    //     adresse: "",
    //     codePostal: "",
    //     localite: "",
    //     pays: "",
    //     telephone: "",
    //     adresseMail: "",
    //     type: "",
    //     statutpro: "",
    //     autreStatut: "",
    //     fonction: "",
    //     domainesExpertise: "",
    //     imagePath: "",
    //     isLambda: null!,
    //   );
    // }
  }

  static Supprimer() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.remove("SuperUser");
  }
}
