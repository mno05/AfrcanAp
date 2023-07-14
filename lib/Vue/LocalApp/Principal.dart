import 'dart:io';
import 'package:african_ap/Data/User.dart';
import 'package:african_ap/Data/Instantane.dart';
import 'package:african_ap/GetXControllers/MessageController.dart';
import 'package:african_ap/GetXControllers/PostContoller.dart';
import 'package:african_ap/GetXControllers/PostEnHContoller.dart';
import 'package:african_ap/Models/Post.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Services/dbServices.dart';
import 'package:african_ap/Tools/DateDifference.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/LocalApp/Adhesion.dart';
import 'package:african_ap/Vue/LocalApp/Commentaire.dart';
import 'package:african_ap/Vue/LocalApp/PostVue.dart';
import 'package:african_ap/Vue/LocalApp/notification1.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:african_ap/Vue/Widgets/BottomNavigation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:african_ap/Vue/Widgets/Drawer.dart';
import 'package:african_ap/Vue/Widgets/PostContainer.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Principal extends StatefulWidget {
  Principal({
    super.key,
  });
  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  PostXcontroller postc = Get.put(PostXcontroller());
  PostenHXcontroller postenHc = Get.put(PostenHXcontroller());
  MessageXController msgc = Get.put(MessageXController());

  late UserM user;
  // @override
  // void setState(fn) {
  //   if (mounted) {
  //     super.setState(fn);
  //   }
  // }

  List<Post> listPosts = [];
  // Map<String, String> nbrAime = {};
  // int nbr = 0;
  // bool get = false;
  bool getUser = false;

  String typeUser = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = Instantane.getUser();
    postc.getPosts().then((value) {
      setState(() {
        listPosts = value;
      });
    });
    postenHc.getPosts();

    // postc.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);
    return Scaffold(
      drawer: DrawerC(
        prenom: user.prenom,
        nom: user.nom,
        pathImage: user.imagePath!,
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Container(
            color: Colors.grey.shade300,
            height: h,
            width: w,
            child: RefreshIndicator(
              onRefresh: () async {
                postc.getPosts();
                postenHc.getPosts();
              },
              child: Obx(
                () => (postc.nbr.value == -1)
                    ? Center(
                        child: Container(
                          width: w * .3,
                          child: Lottie.asset("assets/Load.json"),
                        ),
                      )
                    : Center(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: listPosts.length,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: h * 0.02,
                                        bottom: h * 0.02,
                                        left: w * 0.08),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.grey,
                                          backgroundImage: NetworkImage(
                                            user.imagePath!,
                                          ),
                                          radius: h * 0.03,
                                        ),
                                        SizedBox(width: 10),
                                        PostTF(),
                                      ],
                                    ),
                                  ),
                                  (postenHc.nbr < 0)
                                      ? Container(
                                          child: Container(),
                                        )
                                      : Container(
                                          height:
                                              (postenHc.nbr == 1) ? h / 2 : h,
                                          child: ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: 2,
                                            itemBuilder: (context, index) =>
                                                PostEnHauteur(w, index),
                                          ),
                                        ),
                                  Obx(
                                    () => Container(
                                      width: w,
                                      child: PostContainer(
                                        UserType: listPosts[index].userType!,
                                        Portee: listPosts[index].Portee,
                                        idPost: listPosts[index].idPost!,
                                        idProprioPost: listPosts[index].idUser,
                                        idUserClick: user.Uid!,
                                        datePost: DateDifference
                                            .dateFromServerToDateTime(
                                                listPosts[index].date!),
                                        CommentTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CommentaireVue(
                                                  UserType: postc
                                                      .listPosts[index]
                                                      .userType!,
                                                  Portee: postc
                                                      .listPosts[index].Portee,
                                                  idProprioPost: postc
                                                      .listPosts[index].idUser,
                                                  datePost: DateDifference
                                                      .dateFromServerToDateTime(
                                                          listPosts[index]
                                                              .date!),
                                                  UsPrenom: user.prenom,
                                                  UsNom: user.nom,
                                                  UsProfilPath: user.imagePath!,
                                                  idPost: postc
                                                      .listPosts[index].idPost!,
                                                  idUser: user.Uid!,
                                                  isLike: postc.isLicked[index],
                                                  Legende: postc
                                                      .listPosts[index]
                                                      .Legende!,
                                                  nbrAime: postc.nbrAime[index]
                                                      .toString()
                                                      .split("[")
                                                      .first,
                                                  Nom: postc.listPosts[index]
                                                      .userNom!,
                                                  Prenom: listPosts[index]
                                                      .userPrenom!,
                                                  PathContenu: postc
                                                      .listPosts[index]
                                                      .PathContenu!,
                                                  PathProfile: postc
                                                      .listPosts[index]
                                                      .userPathProfile!,
                                                  TypeContenue:
                                                      listPosts[index].type,
                                                ),
                                              ));
                                        },
                                        onJaimeTap: () async {
                                          await dbServices()
                                              .actionLickOrDislick(
                                                  listPosts[index].idPost!,
                                                  index);
                                        },
                                        isLike: postc.isLicked[index],
                                        Legende: listPosts[index].Legende,
                                        nbrAime: postc.nbrAime[index]
                                            .toString()
                                            .split("[")
                                            .first,
                                        Nom: listPosts[index].userNom!,
                                        Prenom: listPosts[index].userPrenom!,
                                        PathContenu:
                                            listPosts[index].PathContenu!,
                                        PathProfile: postc
                                            .listPosts[index].userPathProfile!,
                                        TypeContenue: listPosts[index].type,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Obx(
                                () => Container(
                                  width: w,
                                  child: PostContainer(
                                      UserType: listPosts[index].userType!,
                                      Portee: listPosts[index].Portee,
                                      idPost: listPosts[index].idPost!,
                                      idProprioPost: listPosts[index].idUser,
                                      idUserClick: user.Uid!,
                                      datePost: DateDifference
                                          .dateFromServerToDateTime(
                                              listPosts[index].date!),
                                      CommentTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => CommentaireVue(
                                                  UserType: postc
                                                      .listPosts[index]
                                                      .userType!,
                                                  Portee: postc
                                                      .listPosts[index].Portee,
                                                  idProprioPost: postc
                                                      .listPosts[index].idUser,
                                                  datePost:
                                                      DateDifference.dateFromServerToDateTime(
                                                          listPosts[index]
                                                              .date!),
                                                  UsNom: user.nom,
                                                  UsPrenom: user.prenom,
                                                  UsProfilPath: user.imagePath!,
                                                  idPost: postc
                                                      .listPosts[index].idPost!,
                                                  idUser: user.Uid!,
                                                  isLike: postc.isLicked[index],
                                                  Legende: postc
                                                      .listPosts[index]
                                                      .Legende!,
                                                  nbrAime: postc.nbrAime[index]
                                                      .toString()
                                                      .split("[")
                                                      .first,
                                                  Nom:
                                                      listPosts[index].userNom!,
                                                  Prenom: listPosts[index]
                                                      .userPrenom!,
                                                  PathContenu: postc
                                                      .listPosts[index]
                                                      .PathContenu!,
                                                  PathProfile: postc
                                                      .listPosts[index]
                                                      .userPathProfile!,
                                                  TypeContenue:
                                                      postc.listPosts[index].type),
                                            ));
                                      },
                                      onJaimeTap: () async {
                                        await dbServices().actionLickOrDislick(
                                            listPosts[index].idPost!, index);
                                      },
                                      isLike: postc.isLicked[index],
                                      Legende: listPosts[index].Legende,
                                      nbrAime: postc.nbrAime[index].toString(),
                                      // .split("[")
                                      // .first,
                                      Nom: listPosts[index].userNom!,
                                      Prenom: listPosts[index].userPrenom!,
                                      PathContenu:
                                          listPosts[index].PathContenu!,
                                      PathProfile: postc
                                          .listPosts[index].userPathProfile!,
                                      TypeContenue: listPosts[index].type),
                                ),
                              );
                            }
                          },
                        ),
                      ),
              ),
            )),
      ),
      bottomNavigationBar: BottomNavigation(isHome: true),
      appBar: AppBar(
        backgroundColor: Color(0xffEB7D30),
        actions: [
          ActionContainer(
            Icons.message,
            tap: () {
              SaveSuperUser.getSuperUser().then((us) {
                if (us.isLambda) {
                  BasicsWidgets.YesOrNoDialogue(
                      context: context,
                      msg:
                          "Vous n'êtes pas éligible pour accéder à cet option, veuillez adhérer la plateforme.",
                      YesText: "J'adhère",
                      NoText: "Non merci",
                      NonPressed: () {
                        Navigator.pop(context);
                      },
                      YesPressed: () => Get.to(() => Adhesion()));

                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => Adhesion(),
                  // )));
                } else {
                  Get.to(() => Principal());
                }
              });
            },
          ),
          ActionContainer(
            Icons.notifications,
            tap: () {
              // Notifications.showNigTextNotification(
              //     title: "Hi",
              //     body: "Hello Word",
              //     fln: flutterLocalNotificationsPlugin);
              SaveSuperUser.getSuperUser().then((us) {
                if (us.isLambda) {
                  BasicsWidgets.YesOrNoDialogue(
                      context: context,
                      msg:
                          "Vous n'êtes pas éligible pour accéder à cet option, veuillez adhérer la plateforme.",
                      YesText: "J'adhère",
                      NoText: "Non merci",
                      NonPressed: () {
                        Navigator.pop(context);
                      },
                      YesPressed: () => Get.to(() => Adhesion()));

                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => Adhesion(),
                  // )));
                } else {
                  Get.to(() => Notification1());
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Widget ActionContainer(IconData icon, {required void Function()? tap}) {
    return InkWell(
      onTap: tap,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white30,
          ),
          child: Icon(icon),
        ),
      ),
    );
  }

  Widget PostTF() {
    return InkWell(
        child: Container(
          height: Media.height(context) * 0.06,
          width: Media.width(context) / 1.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
            // border: Border.all(
            //   color: Colors.black45,
            //   width: 1,
            // ),
          ),
          child: Center(child: Text("Commencer un post")),
        ),
        onTap: () {
          SaveSuperUser.getSuperUser().then((us) {
            if (us.isLambda) {
              BasicsWidgets.YesOrNoDialogue(
                  context: context,
                  msg:
                      "Vous n'êtes pas éligible pour accéder à cet option, veuillez adhérer la plateforme.",
                  YesText: "J'adhère",
                  NoText: "Non merci",
                  NonPressed: () {
                    Navigator.pop(context);
                  },
                  YesPressed: () => Get.to(() => Adhesion()));
            } else {
              Get.to(() => PostVue(superUser: us));
            }
          });
        });
  }

  Widget PostEnHauteur(
    double w,
    int index,
  ) {
    return Container(
      width: w,
      child: Obx(
        () => PostContainer(
            UserType: postenHc.listPosts[index].userType!,
            Portee: postenHc.listPosts[index].Portee,
            idPost: postenHc.listPosts[index].idPost!,
            idProprioPost: postenHc.listPosts[index].idUser,
            idUserClick: user.Uid!,
            datePost: DateDifference.dateFromServerToDateTime(
                postenHc.listPosts[index].date!),
            CommentTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CommentaireVue(
                        UserType: postenHc.listPosts[index].userType!,
                        Portee: postenHc.listPosts[index].Portee,
                        idProprioPost: postenHc.listPosts[index].idUser,
                        datePost: DateDifference.dateFromServerToDateTime(
                            postenHc.listPosts[index].date!),
                        UsNom: user.nom,
                        UsPrenom: user.prenom,
                        UsProfilPath: user.imagePath!,
                        idPost: postenHc.listPosts[index].idPost!,
                        idUser: user.Uid!,
                        isLike: postc.isLicked[index],
                        Legende: postenHc.listPosts[index].Legende!,
                        nbrAime:
                            postenHc.nbrAime[index].toString().split("[").first,
                        Nom: postenHc.listPosts[index].userNom!,
                        Prenom: postenHc.listPosts[index].userPrenom!,
                        PathContenu: postenHc.listPosts[index].PathContenu!,
                        PathProfile: postenHc.listPosts[index].userPathProfile!,
                        TypeContenue: postenHc.listPosts[index].type),
                  ));
            },
            onJaimeTap: () async {
              await dbServices().actionLickOrDislickPH(
                  postenHc.listPosts[index].idPost!, index);
            },
            isLike: postenHc.isLicked[index],
            Legende: postenHc.listPosts[index].Legende,
            nbrAime: postenHc.nbrAime[index].toString().split("[").first,
            Nom: postenHc.listPosts[index].userNom!,
            Prenom: postenHc.listPosts[index].userPrenom!,
            PathContenu: postenHc.listPosts[index].PathContenu!,
            PathProfile: postenHc.listPosts[index].userPathProfile!,
            TypeContenue: postenHc.listPosts[index].type),
      ),
    );
  }

  Future<bool> onWillPop() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Voulez-vous quitter l\'application ?'),
          actions: <Widget>[
            TextButton(
              child: Text('Non'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('Oui'),
              onPressed: () {
                Navigator.of(context).pop(true);
                exit(0);
              },
            ),
          ],
        );
      },
    );
    return false;
  }

  // Future<void> onRefresh() async {
  //   postc.getPosts();
  // }
}
