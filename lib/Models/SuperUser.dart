import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
class UserM {
  String? Uid;
  String prenom;
  String nom;
  String? paysOrgine;
  String? adresse;
  String? codePostal;
  String? localite;
  String? pays;
  String? telephone;
  String adresseMail;
  bool isLambda;
  String? statutpro;
  String? domainesExpertise;
  String? imagePath;
  File? imageData;
  String? fonction;
  String? type;
  String? passW;
  String? dateAdhesion;
  bool? isRoot;

  UserM({
    this.Uid,
    required this.prenom,
    required this.nom,
    this.paysOrgine,
    this.adresse,
    this.codePostal,
    this.localite,
    this.pays,
    this.telephone,
    required this.adresseMail,
    required this.isLambda,
    this.type,
    this.statutpro,
    this.fonction,
    this.imageData,
    this.domainesExpertise,
    this.imagePath,
    this.isRoot = false,
    this.passW,
    this.dateAdhesion,
  });

  factory UserM.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data() as dynamic;
    late String? email;
    if (data['adresseMail'].toString() == "null") {
      email = data['email'].toString();
    } else {
      email = data['adresseMail'].toString();
    }
    return UserM(
      Uid: data?["Uid"],
      nom: data?['nom'],
      prenom: data?['prenom'],
      paysOrgine: data?['paysOrgine'],
      adresse: data?['adresse'],
      codePostal: data?['codePostal'],
      localite: data?['localite'],
      pays: data?['pays'],
      telephone: data?['telephone'],
      adresseMail: email,
      type: data?['type'],
      statutpro: data?['statutpro'],
      fonction: data?['fonction'],
      domainesExpertise: data?['domainesExpertise'],
      imagePath: data?['imageName'],
      isRoot: data?['isRoot'],
      isLambda: data?['isLambda'],
      dateAdhesion: data?['dateAdhesion'],
    );
  }

  static UserM fromFirestor(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data() as dynamic;
    late String? email;
    if (data['adresseMail'].toString() == "null") {
      email = data['email'].toString();
    } else {
      email = data['adresseMail'].toString();
    }
    return UserM(
      Uid: data?["Uid"],
      nom: data?['nom'],
      prenom: data?['prenom'],
      paysOrgine: data?['paysOrgine'],
      adresse: data?['adresse'],
      codePostal: data?['codePostal'],
      localite: data?['localite'],
      pays: data?['pays'],
      telephone: data?['telephone'],
      adresseMail: email,
      type: data?['type'],
      statutpro: data?['statutpro'],
      fonction: data?['fonction'],
      domainesExpertise: data?['domainesExpertise'],
      imagePath: data?['imageName'],
      isRoot: data?['isRoot'],
      isLambda: data?['isLambda'],
      dateAdhesion: data?['dateAdhesion'],
    );
  }

  static UserM fromJson(json) {
    final data = json;
    late String? email;
    if (data!['adresseMail'].toString() == "null") {
      email = data['email'].toString();
    } else {
      email = data['adresseMail'].toString();
    }
    return UserM(
      Uid: data?["Uid"],
      nom: data?['nom'],
      prenom: data?['prenom'],
      paysOrgine: data?['paysOrgine'],
      adresse: data?['adresse'],
      codePostal: data?['codePostal'],
      localite: data?['localite'],
      pays: data?['pays'],
      telephone: data?['telephone'],
      adresseMail: email,
      type: data?['type'],
      statutpro: data?['statutpro'],
      fonction: data?['fonction'],
      domainesExpertise: data?['domainesExpertise'],
      imagePath: data?['imageName'],
      isRoot: data?['isRoot'],
      isLambda: data?['isLambda'],
      dateAdhesion: data?['dateAdhesion'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (Uid != null) "Uid": Uid,
      if (nom != null) "nom": nom,
      if (prenom != null) "prenom": prenom,
      if (paysOrgine != null) "paysOrgine": paysOrgine,
      if (adresse != null) "adresse": adresse,
      if (codePostal != null) "codePostal": codePostal,
      if (localite != null) "localite": localite,
      if (pays != null) "pays": pays,
      if (telephone != null) "telephone": telephone,
      if (adresseMail != null) "adresseMail": adresseMail,
      if (type != null) "type": type,
      if (statutpro != null) "statutpro": statutpro,
      if (fonction != null) "fonction": fonction,
      if (domainesExpertise != null) "domainesExpertise": domainesExpertise,
      if (imagePath != null) "imageName": imagePath,
      "isRoot": false,
      "isLambda": false,
      if (dateAdhesion != null) "dateAdhesion": dateAdhesion,

      // if (nom != null) "nom": nom,
    };
  }

  // Map<String, String> ToMap() {
  //   return {
  //     "prenom": this.prenom,
  //     "nom": this.nom,
  //     "paysOrgine": this.paysOrgine,
  //     "adresse": this.adresse,
  //     "codePostal": this.codePostal,
  //     "localite": this.localite,
  //     "pays": this.pays,
  //     "telephone": this.telephone,
  //     "adresseMail": this.adresseMail,
  //     "statutpro": this.statutpro,
  //     "autreStatut": this.autreStatut,
  //     "fonction": this.fonction,
  //     "domainesExpertise": this.domainesExpertise,
  //     "imagePath": this.imagePath,
  //     "type": this.type,
  //     "passW": this.passW!,
  //     "dateAdhesion": this.dateAdhesion!
  //   };
  // }

  @override
  toString() {
    return "Uid: ${this.Uid},prenom: ${this.prenom},nom: ${this.nom},paysOrgine: ${this.paysOrgine},adresse: ${this.adresse},codePostal: ${this.codePostal},localite: ${this.localite},pays: ${this.pays},telephone: ${this.telephone},adresseMail: ${this.adresseMail},statutpro: ${this.statutpro},fonction: ${this.fonction},domainesExpertise: ${this.domainesExpertise},imagePath: ${this.imagePath},type: ${this.type},isLambda: ${this.isLambda}";
  }
}
