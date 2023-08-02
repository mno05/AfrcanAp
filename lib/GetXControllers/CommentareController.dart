import 'dart:developer';
import 'package:african_ap/Models/Commentaire.dart';
import 'package:african_ap/Services/dbServices.dart';
import 'package:get/get.dart';

class CommentaireXController extends GetxController {
  @override
  void onInit() {
    // getAllUsers();
    // log(idni)
    super.onInit();
  }
  var listCommentaires = <Commentaire>[].obs;
  RxInt nbr = RxInt(-1);
  Future<List<Commentaire>> getAllCommentaires({required String id}) async {
    // dbServices().getCommentaireCollection().snapshots().listen((event) {
      dbServices().getCommentaire(id: id).then((qsn) async {
        
        listCommentaires.clear();
        nbr.value = qsn.docs.length;
        // log("The length of qs is"+ qsn.docs.length.toString());
        for (var doc in qsn.docs) {
          Commentaire msg = Commentaire.fromFirestor(doc);
          printInfo(info: "Element récuperé est : ${msg.contenu}");
          await dbServices().getUserM(msg.idUser).then((user) {
            Commentaire cmt = Commentaire(
                idUser: msg.idUser,
                idPost: msg.idPost,
                contenu: msg.contenu,
                imagePath: user.imagePath!,
                prenom: user.prenom,
                nom: user.nom,
                date: msg.date,
                idCommentaire: msg.idCommentaire);
            log(doc.data().toString());
            listCommentaires.add(cmt);
          });
        }
      });
    // });
    return listCommentaires;
  }

  viderListCommentaires() {
    listCommentaires.clear();
  }
}
