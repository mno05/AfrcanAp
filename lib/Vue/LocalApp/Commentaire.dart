import 'dart:developer';
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/GetXControllers/CommentareController.dart';
import 'package:african_ap/GetXControllers/PostContoller.dart';
import 'package:african_ap/Models/Commentaire.dart';
import 'package:african_ap/Services/dbServices.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/Widgets/PostContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../GetXControllers/PostEnHContoller.dart';

// ignore: must_be_immutable
class CommentaireVue extends StatefulWidget {
  String PathContenu;
  String Legende;
  String Prenom;
  String Nom;
  String PathProfile;
  String TypeContenue;
  String idUser;
  String idPost;
  String UsProfilPath;
  String UsPrenom;
  String UsNom;
  String Portee;
  int index;
  String idProprioPost;
  DateTime datePost;
  String UserType;
  String nbrAime;
  bool isLike;
  bool isHauteur;

  CommentaireVue(
      {super.key,
      required this.UsNom,
      required this.UsPrenom,
      required this.UsProfilPath,
      required this.Prenom,
      required this.Legende,
      required this.PathContenu,
      required this.Nom,
      required this.PathProfile,
      required this.UserType,
      required this.TypeContenue,
      required this.idUser,
      required this.idPost,
      required this.Portee,
      required this.nbrAime,
      required this.isLike,
      required this.idProprioPost,
      required this.index,
      this.isHauteur = false,
      required this.datePost});

  @override
  State<CommentaireVue> createState() => _CommentaireVueState();
}

class _CommentaireVueState extends State<CommentaireVue> {
  TextEditingController Cmt = TextEditingController();
  CommentaireXController cmc = Get.put(CommentaireXController());
  PostXcontroller postc = Get.put(PostXcontroller());
  PostenHXcontroller postenHc = Get.put(PostenHXcontroller());

  List<Commentaire> cmts = [];
  var dataCommentaires;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // log(widget.idPost);
    cmc.getAllCommentaires(id: widget.idPost).then((value) {
      setState(() {
        cmts = value;
      });
    });
  }

  @override
  void dispose() {
    cmc.viderListCommentaires();
    // cmc.dispose();
    super.dispose();
  }
  // getCommentaires(idPost) async {
  //   // log("Here");
  //   final response = await http.post(
  //       Uri.parse("https://myap.moglich.net/api/recupCommentaire.php/"),
  //       body: {
  //         "idPost": idPost,
  //       });

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       dataCommentaires = json.decode(response.body);
  //       for (var i = 0; i < dataCommentaires.length; i++) {
  //         int year = int.parse(
  //             dataCommentaires[i]["date"].toString().split("-").first);
  //         int month =
  //             int.parse(dataCommentaires[i]["date"].toString().split("-")[1]);
  //         int day = int.parse(dataCommentaires[i]["date"]
  //             .toString()
  //             .split("-")
  //             .last
  //             .split(" ")
  //             .first);
  //         String hour = dataCommentaires[i]["date"]
  //             .toString()
  //             .split("-")
  //             .last
  //             .split(" ")
  //             .last
  //             .split(":")
  //             .first;
  //         String minute = dataCommentaires[i]["date"]
  //             .toString()
  //             .split("-")
  //             .last
  //             .split(" ")
  //             .last
  //             .split(":")[1];

  //         cmts.add(
  //           Commentaire(
  //             imagePath: dataCommentaires[i]["imagePath"],
  //             nom: dataCommentaires[i]["nom"],
  //             prenom: dataCommentaires[i]["prenom"],
  //             idUser: widget.idUser,
  //             idPost: idPost,
  //             contenu: dataCommentaires[i]["contenu"],
  //             date: DateTime(year, month, day),
  //           ),
  //           // ),
  //         );
  //       }
  //       // flagAsync = false;
  //       // flagAsyncSend = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // cmts.reversed;
    double h = Media.height(context);
    double w = Media.width(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Commentaire"),
        backgroundColor: AppData.BasicColor,
      ),
      body: Obx(
        () => (cmc.nbr.value == -1)
            ? Center(
                child: Container(
                  width: w * .3,
                  child: Lottie.asset("assets/Load.json"),
                ),
              )
            : (cmc.nbr.value == 0)
                ? Center(
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PostContainer(
                        Portee: widget.Portee,
                        UserType: widget.UserType,
                        idPost: widget.idPost,
                        idProprioPost: widget.idProprioPost,
                        idUserClick: widget.idUser,
                        datePost: widget.datePost,
                        Legende: widget.Legende,
                        PathContenu: widget.PathContenu,
                        Prenom: widget.Prenom,
                        Nom: widget.Nom,
                        PathProfile: widget.PathProfile,
                        TypeContenue: widget.TypeContenue,
                        onJaimeTap: () {},
                        CommentTap: () {},
                        nbrAime: widget.nbrAime,
                        isLike: widget.isLike),
                  ))
                : Padding(
                    padding: EdgeInsets.only(
                      bottom: h * .08,
                    ),
                    child: Center(
                      child: ListView.builder(
                          // reverse: true,
                          itemCount: cmts.length,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Obx(
                                () => Column(
                                  children: [
                                    PostContainer(
                                      Portee: widget.Portee,
                                      UserType: widget.UserType,
                                      idPost: widget.idPost,
                                      idProprioPost: widget.idProprioPost,
                                      idUserClick: widget.idUser,
                                      datePost: widget.datePost,
                                      Legende: widget.Legende,
                                      PathContenu: widget.PathContenu,
                                      Prenom: widget.Prenom,
                                      Nom: widget.Nom,
                                      PathProfile: widget.PathProfile,
                                      TypeContenue: widget.TypeContenue,
                                      onJaimeTap: () async {
                                        if (widget.isHauteur) {
                                          await dbServices().actionLickOrDislickPH(
                                              widget.idPost, widget.index);
                                        } else {
                                          await dbServices().actionLickOrDislick(
                                              widget.idPost, widget.index);
                                        }
                                      },
                                      CommentTap: () {},
                                      nbrAime: (widget.isHauteur)
                                          ? postenHc.nbrAime[widget.index]
                                              .toString()
                                              .split("[")
                                              .first
                                          : postc.nbrAime[widget.index]
                                              .toString()
                                              .split("[")
                                              .first,
                                      isLike: (widget.isHauteur)
                                          ? postenHc.isLicked[widget.index]
                                          : postc.isLicked[widget.index],
                                    ),
                                    Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(cmts[index].imagePath),
                                    // radius: 10,
                                  ),
                                  title: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: (Colors.blue[200]),
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${cmts[index].prenom} ${cmts[index].nom}',
                                          style: GoogleFonts.nunito(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${cmts[index].contenu}',
                                          style:
                                              GoogleFonts.nunito(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                                  ],
                                ),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(cmts[index].imagePath),
                                    // radius: 10,
                                  ),
                                  title: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: (Colors.blue[200]),
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${cmts[index].prenom} ${cmts[index].nom}',
                                          style: GoogleFonts.nunito(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${cmts[index].contenu}',
                                          style:
                                              GoogleFonts.nunito(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                            // },
                          }),
                    ),
                  ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 10),
        // height: h * 0.1,
        width: w,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              child: Icon(
                Icons.emoji_emotions_outlined,
                color: Colors.black54,
              ),
            ),
            InkWell(
              child: Icon(
                Icons.link,
                color: Colors.black54,
              ),
            ),
            Container(
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.only(left: 10),
              width: w / 1.35,
              decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadiusDirectional.circular(25)),
              child: TextField(
                controller: Cmt,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Ecrire un commmentaire",
                  border: InputBorder.none,
                ),
              ),
            ),
            InkWell(
                child: Icon(
                  Icons.send,
                  color: Colors.green,
                ),
                onTap: () async {
                  if (Cmt.text.isEmpty) {
                  } else {
                    // CommentaireController.Commenter(
                    //     widget.idUser, widget.idPost, Cmt.text);
                    Commentaire cmmt = Commentaire(
                        idCommentaire: widget.idPost,
                        idUser: widget.idUser,
                        idPost: widget.idPost,
                        imagePath: widget.UsProfilPath,
                        nom: widget.UsNom,
                        prenom: widget.UsPrenom,
                        contenu: Cmt.text,
                        date: DateTime.now().toString());
                    await cmc.getAllCommentaires(id: widget.idPost);
                    cmts.add(cmmt);
                    
                    Cmt.text = "";
                    await dbServices().commenter(cmmt);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
