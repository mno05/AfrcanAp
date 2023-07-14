import 'dart:developer';

import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Models/Post.dart';
import 'package:african_ap/Services/dbServices.dart';
import 'package:get/get.dart';


class PostenHXcontroller extends GetxController {
  // @override
  // void onInit() {
  //   super.onInit();
  // }
  var listPosts = <Post>[].obs;
  var nbrAime = [].obs;
  var isLicked = [].obs;
  RxInt nbr=RxInt(-1);
  Future<List<Post>> getPosts() async {
    dbServices().getPostenH().get().then((querySnapshot) {     
        nbr.value=querySnapshot.docs.length;
        // printInfo(info: "SIZE POST EN HAUTEUR AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa ${nbr.value}");
        listPosts.clear();
        nbrAime.clear();
        isLicked.clear();
        for (var docs in querySnapshot.docs) {
          Post postR = Post.fromFirestor(docs);
          dbServices().getUserM(postR.idUser).then((user) {
            Post post = Post(
              userNom: user.nom,
              userPathProfile: user.imagePath,
              userPrenom: user.prenom,
              userType: user.type,
              Legende: postR.Legende,
              PathContenu: postR.PathContenu,
              date: postR.date,
              idPost: postR.idPost,
              idUsersLicked: postR.idUsersLicked,
              fileData: postR.fileData,
              idUser: postR.idUser,
              Portee: postR.Portee,
              type: postR.type,
            );
            if (!listPosts.contains(post)) {
              nbrAime.add(post.idUsersLicked!.length);
              isLicked.add(post.idUsersLicked!.contains(AppData.Uid));
              listPosts.add(post);
            }
          });
          // UserM sup = docs.data() as UserM;
        }
        

      });
    // dbServices().getPostenHCollection().snapshots().listen((event) {
    //     printInfo(info: "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ ${b}");
    //   b=b+1;
    //   // dbServices().getPostenH().get().then((querySnapshot) {     
    //   //   nbr.value=querySnapshot.docs.length;
    //   //   printInfo(info: "SIZE POST EN HAUTEUR AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa ${nbr.value}");
    //   //   listPosts.clear();
    //   //   nbrAime.clear();
    //   //   isLicked.clear();
    //   //   for (var docs in querySnapshot.docs) {
    //   //     Post postR = Post.fromFirestor(docs);
    //   //     dbServices().getUserM(postR.idUser).then((user) {
    //   //       Post post = Post(
    //   //         userNom: user.nom,
    //   //         userPathProfile: user.imagePath,
    //   //         userPrenom: user.prenom,
    //   //         userType: user.type,
    //   //         Legende: postR.Legende,
    //   //         PathContenu: postR.PathContenu,
    //   //         date: postR.date,
    //   //         idPost: postR.idPost,
    //   //         idUsersLicked: postR.idUsersLicked,
    //   //         fileData: postR.fileData,
    //   //         idUser: postR.idUser,
    //   //         Portee: postR.Portee,
    //   //         type: postR.type,
    //   //       );
    //   //       if (!listPosts.contains(post)) {
    //   //         nbrAime.add(post.idUsersLicked!.length);
    //   //         isLicked.add(post.idUsersLicked!.contains(AppData.Uid));
    //   //         listPosts.add(post);
    //   //       }
    //   //     });
    //   //     // UserM sup = docs.data() as UserM;
    //   //   }
        

    //   // });
   
   
    // });



    printInfo(info: "SIZE POST EN HAUTEUR NNNNNNNNNNNNNNNNNNNNNNNN ${listPosts}");
    return listPosts;
  }

  aimer(index){
    log("Poste aimé à ${nbrAime[index]}");
    nbrAime[index]++;
  }
  desaimer(index){
    nbrAime[index]--;
  }
}
