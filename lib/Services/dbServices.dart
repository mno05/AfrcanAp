import 'dart:io';
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Data/User.dart';
import 'package:african_ap/GetXControllers/PostEnHContoller.dart';
import 'package:african_ap/Models/Commentaire.dart';
import 'package:african_ap/Models/Message.dart';
import 'package:african_ap/Models/Notifiacation.dart';
import 'package:african_ap/Models/Post.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import "package:firebase_storage/firebase_storage.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:african_ap/Data/Instantane.dart';

import '../GetXControllers/PostContoller.dart';

class dbServices {
  var db = FirebaseFirestore.instance;

  PostenHXcontroller postenHc = Get.put(PostenHXcontroller());
  PostXcontroller postc = Get.put(PostXcontroller());

//Sauvegarde user
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  CollectionReference postCollection =
      FirebaseFirestore.instance.collection("posts");
  CollectionReference postHCollection =
      FirebaseFirestore.instance.collection("postsHauteur");

  FirebaseStorage _storage = FirebaseStorage.instance;
  refUserDocs(uid) async {
    return await db.collection("users").doc(uid).withConverter(
        fromFirestore: UserM.fromFirestore,
        toFirestore: (UserM UserM, options) => UserM.toFirestore());
  }

//UploadFile
  Future<String> UploadFile({required File file, required String ref}) async {
    Reference reference = _storage.ref().child(ref);
    UploadTask uploadTask = reference.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  //SaveUser
  Future<dynamic> UserSave(UserM user) async {
    if (user.imagePath == "") {
      String defaultimageProfil =
          "https://firebasestorage.googleapis.com/v0/b/myapp-9aa8d.appspot.com/o/ProfileImage%2FDefault.png?alt=media&token=d3b7b0c6-8e76-4874-b065-58e6e34f7a00";
      return db.collection("users").doc(user.Uid).set({
        "Uid": user.Uid!,
        "prenom": user.prenom,
        "nom": user.nom,
        "adresseMail": user.adresseMail,
        "imageName": defaultimageProfil,
        "isLambda": true
      });
    } else {
      return UploadFile(
              file: user.imageData!,
              ref: "ProfileImage/${user.prenom}_${user.nom}.png")
          .then((url) => db.collection("users").doc(user.Uid).set({
                "Uid": user.Uid!,
                "prenom": user.prenom,
                "nom": user.nom,
                "adresseMail": user.adresseMail,
                "imageName": url,
                "isLambda": true
              }));
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> UserGet(Uid) async {
    // log(Uid);
    return await db.collection("users").doc(Uid).get();
    // onError((error, stackTrace){
    //   log(error.toString());
    //   Toast.show(error.toString(),duration: 3);
    //   return {};
    // });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> UpdateUserM(UserM su) async {
    await db
        .collection("users")
        .withConverter(
            fromFirestore: UserM.fromFirestore,
            toFirestore: (UserM UserM, options) => UserM.toFirestore())
        .doc(su.Uid)
        .update(su.toFirestore())
        .then((value) {});
    return UserGet(su.Uid);
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> UpdateUserDamandeAdh(
      UserM su) async {
    await db
        .collection("userDemande")
        .withConverter(
            fromFirestore: UserM.fromFirestore,
            toFirestore: (UserM UserM, options) => UserM.toFirestore())
        .doc(su.Uid)
        .set(su)
        .then((value) {});
    return UserGet(su.Uid);
  }

  Future<UserM> getUserM(uid) async {
    final ref = await refUserDocs(uid);
    final doc = await ref.get();
    // log(doc.toString());
    UserM sup = doc.data() as UserM;
    return sup;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getMembresRef() async {
    final ref =
        await db.collection("users").where("isLambda", isEqualTo: false);
    return await ref.get();
    // return sup;
  }

  Query<Map<String, dynamic>> GetAllMembre() {
    return db
        .collection("users")
        .where("isLambda", isEqualTo: false)
        .where("Uid", isNotEqualTo: AppData.Uid);
  }

  CollectionReference<Map<String, dynamic>> getCollection() {
    return db.collection("users");
  }

  CollectionReference<Map<String, dynamic>> getContactsCollection() {
    return db.collection("contacts");
  }

  CollectionReference<Map<String, dynamic>> getPostCollection() {
    return db.collection("posts");
  }

  CollectionReference<Map<String, dynamic>> getPostenHCollection() {
    return db.collection("postsHauteur");
  }

  CollectionReference<Map<String, dynamic>> getMessageCollection() {
    return db.collection("messages");
  }

  CollectionReference<Map<String, dynamic>> getCommentaireCollection() {
    return db.collection("commentaires");
  }

  CollectionReference<Map<String, dynamic>> getNotificationCollection() {
    return db.collection("notifications");
  }

  UpdateUserMProfile(context, UserM su) async {
    BasicsWidgets.Load(context);
    if (su.imageData == null) {
      UpdateUserM(su)
          .then((docS) =>
              SaveSuperUser.Sauvegarde(user: UserM.fromFirestor(docS)))
          .then((value) => Get.back());
    } else {
      UploadFile(
              file: su.imageData!,
              ref: "ProfileImage/${su.prenom}_${su.nom}.png")
          .then((url) {
        UpdateUserM(su)
            .then((docS) =>
                SaveSuperUser.Sauvegarde(user: UserM.fromFirestor(docS)))
            .then((value) => Get.back());
      });
    }
    // await db
    //     .collection("users")
    //     .withConverter(
    //         fromFirestore: UserM.fromFirestore,
    //         toFirestore: (UserM UserM, options) => UserM.toFirestore())
    //     .doc(su.Uid)
    //     .update(su.toFirestore())
    //     .then((value) {});
    // return UserGet(su.Uid);
  }

  Future savePost(Post post) async {
    String id_post =
        "Id_" + DateTime.now().toString().split(".").first.replaceAll(" ", "_");
    if (post.PathContenu == "nul") {
      postCollection.doc(id_post).set({
        "idPost": id_post,
        "idUser": post.idUser,
        "Portee": post.Portee,
        "Legende": post.Legende,
        "date": DateTime.now().toString(),
        "type": post.type,
        "PathContenu": "vide",
        "userNom": post.userNom,
        "userPathProfile": post.userPathProfile,
        "userType": post.userType,
        "userPrenom": post.userPrenom,
        "valide": false,
        "idUsersLicked": <String>[],
      });
    } else {
      return await UploadFile(
              file: post.fileData!, ref: "Post/${post.PathContenu}")
          .then((url) {
        postCollection.doc(id_post).set({
          "idPost": id_post,
          "idUser": post.idUser,
          "Portee": post.Portee,
          "Legende": post.Legende,
          "date": DateTime.now().toString(),
          "type": post.type,
          "PathContenu": url,
          "userNom": post.userNom,
          "userPathProfile": post.userPathProfile,
          "userType": post.userType,
          "valide": false,
          "userPrenom": post.userPrenom,
          "idUsersLicked": <String>[],
        });
      });
    }
    _notifier(NotificationM(
        idUser: post.idUser,
        contenue: "",
        typeNotif: "Post",
        portee: post.Portee,
        dest: post.Portee));
  }

  Future republier(Post post) async {
    String id_post =
        "Id_" + DateTime.now().toString().split(".").first.replaceAll(" ", "_");
    postCollection.doc(id_post).set({
      "idPost": id_post,
      "idUser": post.idUser,
      "Portee": post.Portee,
      "Legende": post.Legende,
      "date": DateTime.now().toString(),
      "type": post.type,
      "PathContenu": post.PathContenu,
      "userNom": post.userNom,
      "userPathProfile": post.userPathProfile,
      "userType": post.userType,
      "userPrenom": post.userPrenom,
      "idUsersLicked": <String>[],
    });
  }

  Future updatePost(Post post, String isChange) async {
    var docEx = await postCollection.doc(post.idPost).get();

    if (docEx.exists) {
      if (isChange == "No") {
        postCollection.doc(post.idPost).update({
          "Portee": post.Portee,
          "Legende": post.Legende,
          "date": DateTime.now().toString(),
          "type": post.type,
        });
      } else {
        return await UploadFile(
                file: post.fileData!, ref: "Post/${post.PathContenu}")
            .then((url) {
          postCollection.doc(post.idPost).update({
            "Portee": post.Portee,
            "Legende": post.Legende,
            "date": DateTime.now().toString(),
            "type": post.type,
            "PathContenu": url,
          });
        });
      }
    } else {
      if (isChange == "No") {
        postHCollection.doc(post.idPost).update({
          "Portee": post.Portee,
          "Legende": post.Legende,
          "date": DateTime.now().toString(),
          "type": post.type,
        });
      } else {
        return await UploadFile(
                file: post.fileData!, ref: "Post/${post.PathContenu}")
            .then((url) {
          postHCollection.doc(post.idPost).update({
            "Portee": post.Portee,
            "Legende": post.Legende,
            "date": DateTime.now().toString(),
            "type": post.type,
            "PathContenu": url,
          });
        });
      }
    }
  }

  Query<Map<String, dynamic>> getPost() {
    UserM user = Instantane.getUser();
    return (user.type != null)
        ? db
            .collection("posts")
            .where("Portee", whereIn: [user.type, "Tout"])
            .where("valide", isEqualTo: true)
            .orderBy("date", descending: true)
        : db
            .collection("posts")
            .where("Portee", isEqualTo: 'Tout')
            .where("valide", isEqualTo: true)
            .orderBy("date", descending: true);
    // .orderBy("date");
  }

  Query<Map<String, dynamic>> getPostenH() {
    UserM user = Instantane.getUser();
    return (user.type != null)
        ? db
            .collection("postsHauteur")
            .orderBy("date", descending: true)
            .where("Portee", whereIn: [user.type, "Tout"])
            .limit(2)
        : db
            .collection("postsHauteur")
            .orderBy("date", descending: true)
            .where("Portee", whereIn: ["Tout"])
            .limit(2);
  }

  _aimerPost(String idPost) {
    db.collection("posts").doc(idPost).update({
      "idUsersLicked": FieldValue.arrayUnion([AppData.Uid!])
    });
  }

  _desaimerPost(String idPost) {
    db.collection("posts").doc(idPost).update({
      "idUsersLicked": FieldValue.arrayRemove([AppData.Uid!])
    });
  }

//Aimer&DesaimerPour post en hauteur
  _aimerPostH(String idPost) {
    db.collection("postsHauteur").doc(idPost).update({
      "idUsersLicked": FieldValue.arrayUnion([AppData.Uid!])
    });
  }

  _desaimerPostH(String idPost) {
    db.collection("postsHauteur").doc(idPost).update({
      "idUsersLicked": FieldValue.arrayRemove([AppData.Uid!])
    });
  }
  actionLickOrDislick(String idPost,index) {
    db.collection("posts").doc(idPost).get().then((docs) {
      Post post = Post.fromFirestor(docs);
      if ((post.idUsersLicked!.contains(AppData.Uid))) {
        postc.desaimer(index);
        _desaimerPost(idPost);

      } else {
        postc.aimer(index);
        _aimerPost(idPost);

      }
    });
  }
  actionLickOrDislickPH(String idPost, index) {
    db.collection("postsHauteur").doc(idPost).get().then((docs) {
      Post post = Post.fromFirestor(docs);
      if ((post.idUsersLicked!.contains(AppData.Uid))) {
        postenHc.desaimer(index);
        _desaimerPostH(idPost);
      } else {
        postenHc.aimer(index);
        _aimerPostH(idPost);
      }
    });
  }

  Future<void> supprimerPost(String idPost) async {
    var dc = await db.collection("posts").doc(idPost).get();
    return (dc.exists)
        ? db.collection("posts").doc(idPost).delete()
        : db.collection("postsHauteur").doc(idPost).delete();
  }

  Future<dynamic> contacterUser({required Messages messages}) async {
    getContacts(messages.idDes).then((qsn) async {
      if (qsn.docs.length == 0) {
        String id = "Id_" +
            DateTime.now().toString().split(".").first.replaceAll(" ", "_");
        await db.collection("contacts").doc(id).set({
          "idContact": id,
          "idEx": FieldValue.arrayUnion([messages.idEx]),
          "idDes": FieldValue.arrayUnion([messages.idDes]),
          "lastMessage": messages.text,
          "date": messages.dateTime
        });
        _notifier(NotificationM(
            idUser: messages.idEx,
            contenue: messages.text,
            typeNotif: "Message",
            dest: messages.idDes));
        return await _envoyerMessage(id, messages);
      }
      if (qsn.docs.length == 1) {
        String id = qsn.docs[0]["idContact"];
        await db.collection("contacts").doc(id).update({
          "idEx": FieldValue.arrayUnion([messages.idEx]),
          "idDes": FieldValue.arrayUnion([messages.idDes]),
          "lastMessage": messages.text,
          "date": messages.dateTime
        });
        return await _envoyerMessage(id, messages);
      }
      // else {
      //   String idc = qsn.docs[0]["idContact"];
      //   db
      //       .collection("contacts")
      //       .doc(idc)
      //       .update({"lastMessage": messages.text, "date": messages.dateTime});
      // }
      // {
      //   toast("Vous êtes déjà en contact");
      // }
    });
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getContacts(String idEx) async {
    return await db
        .collection("contacts")
        .where("idDes", arrayContainsAny: [AppData.Uid!, idEx])
        // .where("idDes", arrayContains:idEx)
        .orderBy("date")
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getContactsRecup() async {
    return await db
        .collection("contacts")
        .where("idDes", arrayContains: AppData.Uid!)
        // .where("idDes", arrayContains:idEx)
        .orderBy("date")
        .get();
  }

  _envoyerMessage(String id, Messages ms) async {
    return await db.collection("messages").add({
      "idMessage": id,
      "idEx": ms.idEx,
      "idDes": ms.idDes,
      "date": ms.dateTime,
      'arrive': false,
      "text": ms.text,
    });
  }

  isArrive(String idMessage) {
    db.collection("messages").doc(idMessage).update({"arrive": true});
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getMessage(
      {required String id}) async {
    return await db
        .collection("messages")
        .where("idMessage", isEqualTo: id)
        .orderBy("date", descending: true)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getMessageForMe() async {
    return await db
        .collection("messages")
        .where("idDes", isEqualTo: AppData.Uid)
        .where("arrive", isEqualTo: false)
        .orderBy("date", descending: true)
        .get();
  }

  commenter(Commentaire commentaire) async {
    return await db.collection("commentaires").add(commentaire.toFirestore());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getCommentaire(
      {required String id}) async {
    return await db
        .collection("commentaires")
        .where("idPost", isEqualTo: id)
        .orderBy("date", descending: true)
        .get();
  }

  _notifier(NotificationM notif) async {
    return await db.collection("notifications").add(notif.toFirestore());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getNotifications() async {
    return await db
        .collection("notifications")
        .where("dest", whereIn: [AppData, 'Tout', Instantane.getUser().type])
        .where("idUser", isNotEqualTo: AppData.Uid)
        // .orderBy("date")
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getNewNotifications(
      {required String id}) async {
    return await db
        .collection("notifications")
        .where("dest", whereIn: [AppData, 'Tout', Instantane.getUser().type])
        .where("idUser", isNotEqualTo: AppData.Uid)
        .where("isArrive", isEqualTo: false)
        .where("isView", isEqualTo: false)
        .orderBy("date")
        .get();
  }

  isArriveNotif(String notifications) {
    db.collection("notifications").doc(notifications).update({"arrive": true});
  }

  isViewNotif(String notifications) {
    db.collection("notifications").doc(notifications).update({"isView": true});
  }
}
