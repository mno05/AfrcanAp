import 'dart:developer';
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Models/Post.dart';
import 'package:african_ap/Services/dbServices.dart';
import 'package:get/get.dart';

class PostXcontroller extends GetxController {
  // @override
  // void onInit() {
  //   getPosts();
  //   super.onInit();
  // }
  var listPosts = <Post>[].obs;
  var nbrAime = [].obs;
  var isLicked = [].obs;
  RxInt nbr = RxInt(-1);

  Future<List<Post>> getPosts() async {
    // dbServices().getPostCollection().snapshots().listen((event) {
    dbServices().getPost().get().then((querySnapshot) async{
      nbr.value = querySnapshot.docs.length;
      log(querySnapshot.docs.length.toString());
      listPosts.clear();
      nbrAime.clear();
      isLicked.clear();
      for (var docs in querySnapshot.docs) {
        Post postR = Post.fromFirestor(docs);
        await dbServices().getUserM(postR.idUser).then((user) {
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
    // });
    // listPosts.sort((a, b) => a.date!.compareTo(b.date!));
    // for (var el in listPosts) {
    //   printInfo(info: el.Legende.toString()+"dffffffffffffffffffffffffffffffffffffffffffffffffff");
    // }
    return listPosts;
  }
  aimer(index) {
    log("Poste aimé ${index}");
    log("Poste aimé à ${nbrAime[index]}");
    nbrAime[index]++;
  }

  desaimer(index) {
    log("Poste desaimé ${index}");
    log("Poste desaimé à ${nbrAime[index]}");
    nbrAime[index]--;
  }
}
