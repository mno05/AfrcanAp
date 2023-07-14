import 'package:cloud_firestore/cloud_firestore.dart';

class Commentaire {
  String? idCommentaire;
  String idUser;
  String idPost;
  String contenu;
  String imagePath;
  String prenom;
  String nom;
  DateTime date;
  Commentaire({
    this.idCommentaire,
    required this.idUser,
    required this.idPost,
    required this.contenu,
    required this.imagePath,
    required this.prenom,
    required this.nom,
    required this.date,
  });

  static Commentaire fromFirestor(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return Commentaire(
      idCommentaire: data?["idCommentaire"],
      idUser: data?["idUser"],
      contenu: data?['contenu'],
      idPost: data?['idPost'],
      date: data?['date'],
      prenom: data?['prenom'],
      imagePath: data?['imagePath'],
      nom: data?['nom'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "idCommentaire": idCommentaire,
      "IdUser": idUser,
      "IdPost": idPost,
      "date": date.toString(),
      "idPost": idPost,
      "imagePath": imagePath,
      "prenom": prenom,
      "nom": nom,
    };
  }

  @override
  toString() {
    return "idCommentaire:${idCommentaire},idUser:${idUser},idPost:${idPost},contenu:${contenu},date:${date}";
  }
}
