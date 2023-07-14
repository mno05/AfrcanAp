import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
class Post {
  String? idPost;
  String idUser;
  String Portee;
  String? Legende;
  String? date;
  String? userPrenom;
  String? userNom;
  String? userType;
  String? userPathProfile;
  List<dynamic>? idUsersLicked;
  String? PathContenu;
  String type;
  File? fileData;
  Post({
    this.idPost,
    required this.idUser,
    required this.Portee,
    this.Legende,
    this.date,
    required this.type,
    this.PathContenu,
    this.fileData,
    this.userNom,
    this.userPrenom,
    this.userPathProfile,
    this.userType,
    this.idUsersLicked,
    
  });
  factory Post.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Post(
      idPost: data?["idPost"],
      idUser: data?['idUser'],
      Portee: data?['Portee'],
      Legende: data?['Legende'],
      date: data?['date'],
      type: data?['type'],
      PathContenu: data?['PathContenu'],
      userType: data?['userType'],

      fileData: data?['fileData'],

      userNom: data?['userNom'],
      userPrenom: data?['userPrenom'],
      userPathProfile: data?['userPathProfile'],
      idUsersLicked: data?['idUsersLicked'],
    );
  }
  static Post fromFirestor(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return Post(
      idPost: data?["idPost"],
      idUser: data?['idUser'],
      Portee: data?['Portee'],
      Legende: data?['Legende'],
      date: data?['date'],
      type: data?['type'],
      idUsersLicked: data?['idUsersLicked'],
      userNom: data?['userNom'],
      userType: data?['userType'],

      userPathProfile: data?['userPathProfile'],
      userPrenom: data?['userPrenom'],
      PathContenu: data?['PathContenu'],
      fileData: data?['fileData'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (idPost != null) "idPost": idPost,
      if (idUser != null) "idUser": idUser,
      if (Portee != null) "Portee": Portee,
      if (Legende != null) "Legende": Legende,
      if (date != null) "date": date,
      if (userType != null) "userType": userType,
      if (type != null) "type": type,
      if (PathContenu != null) "PathContenu": PathContenu,
      if (fileData != null) "fileData": fileData,
    };
  }
}
