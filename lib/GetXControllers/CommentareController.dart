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


  Future<List<Commentaire>> getAllCommentaires({required String id}) async {
    dbServices().getCommentaireCollection().snapshots().listen((event) {
     dbServices().getCommentaire(id: id).then((qsn) {
      // log("The length of qs is"+ qsn.docs.length.toString());
      listCommentaires.clear();
      for (var doc in qsn.docs) {
        Commentaire msg = Commentaire.fromFirestor(doc);
      log(doc.data().toString());
        listCommentaires.add(msg);
      }
     });
    });
    return listCommentaires;
  }



}
