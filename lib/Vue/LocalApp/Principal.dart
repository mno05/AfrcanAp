import 'dart:convert';
import 'dart:developer';

import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Data/SaveSuperUser.dart';
import 'package:african_ap/Data/SaveUser.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Models/User.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/Auth/LoginVue.dart';
import 'package:african_ap/Vue/LocalApp/Adhesion.dart';
import 'package:african_ap/Vue/LocalApp/Commentaire.dart';
import 'package:african_ap/Vue/LocalApp/Message.dart';
import 'package:african_ap/Vue/LocalApp/PostVue.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:african_ap/Vue/Widgets/BottomNavigation.dart';
import 'package:http/http.dart' as http;
import 'package:african_ap/Vue/Widgets/Drawer.dart';
import 'package:african_ap/Vue/Widgets/PostContainer.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Principal extends StatefulWidget {
  User user;
  // SuperUser? superUser;
  Principal({
    super.key,
    required this.user,
    // this.superUser,
  });

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  var data;
  Map<String, String> nbrAime = {};
  int nbr = 0;
  bool get = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPosts();
    // then((value1) => getNbrAimes(value1).then((value) => nbrAime[value1]=value));
  }

  // Future<List<String>>
  getPosts() async {
    final response = await http.post(
      Uri.parse(
          "https://africanap.000webhostapp.com/african_ap/recupPosts.php/"),
    );
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
        get = true;
      });
      // return data[""]["idUser"];
    }

    // log(' Resultat : ${data}');
  }

  Future getNbrAimes(idPost) async {
    final response = await http.post(
        Uri.parse(
            "https://africanap.000webhostapp.com/african_ap/AimesNomber.php/"),
        body: {
          "IdPost": idPost,
          "IdUser": widget.user.Id,
        });
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
  }

  Future Aimer(idPost) async {
    final response = await http.post(
        Uri.parse("https://africanap.000webhostapp.com/african_ap/Aimer.php/"),
        body: {
          "IdPost": idPost,
          "IdUser": widget.user.Id,
        });
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data["data"][0] == "Aime") {
        DesAimer(idPost);
      }
      // log(data["data"][0]);
      return data;
    }
  }

  Future DesAimer(idPost) async {
    final response = await http.post(
        Uri.parse(
            "https://africanap.000webhostapp.com/african_ap/DesAimer.php/"),
        body: {
          "IdPost": idPost,
          "IdUser": widget.user.Id,
        });
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      log(data["data"][0]);
      return data;
    }
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
          SaveUser.getUser().then((value) {
            if (value.isLambda) {
              BasicsWidgets.YesOrNoDialogue(
                context: context,
                msg:
                    "Vous ne pouvez pas poster, veuillez adh??rer la plateforme pour cel??.",
                YesText: "J'adh??re",
                NoText: "Non merci",
                NonPressed: () {
                  Navigator.pop(context);
                },
                YesPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Adhesion(),
                )),
              );
            } else {
              SaveSuperUser.getSuperUser().then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostVue(
                        superUser: value,
                      ),
                    ));
              });
            }
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    // log(data);
    // getNbrAimes("25");
    Aimer("29");
    double h = Media.height(context);
    double w = Media.width(context);
    return Scaffold(
      drawer: DrawerC(
        prenom: widget.user.prenom,
        nom: widget.user.nom,
        pathImage: widget.user.imageName,
      ),
      appBar: AppBar(
        backgroundColor: Color(0xffEB7D30),
        actions: [
          ActionContainer(
            Icons.message,
            tap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Message(),));
            },
          ),
          ActionContainer(
            Icons.notifications,
            tap: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.grey.shade300,
        height: h,
        width: w,
        child: !get
            ? Center(
                child: Center(
                  child: Container(
                    width: w * .3,
                    child: Lottie.asset("assets/Load.json"),
                  ),
                ),
              )
            : Center(
                child: ListView.builder(
                  itemCount: data.length,
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
                                    widget.user.imageName,
                                  ),
                                  radius: h * 0.03,
                                ),
                                SizedBox(width: 10),
                                PostTF(),
                              ],
                            ),
                          ),
                          Container(
                            width: w,
                            child: FutureBuilder<dynamic>(
                            future: getNbrAimes(data[index]['idPost']),
                            builder: (context, sn) {
                              bool isLiked = sn.hasData
                                  ? sn.data["idUser"][2] == 1
                                  : false;
                              return PostContainer(
                                CommentTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CommentaireVue(
                                          UsNom: widget.user.nom,
                                          UsPrenom: widget.user.prenom,
                                          UsProfilPath: widget.user.imageName,
                                          idPost: data[index]['idPost'],
                                          idUser: widget.user.Id,
                                          isLike: isLiked,
                                          Legende: data[index]['Legende'],
                                          nbrAime: (!sn.hasData ||
                                                  sn.data?["idUser"][1] == null)
                                              ? "..."
                                              : sn.data["idUser"][1].toString(),
                                          Nom: data[index]['nom'],
                                          Prenom: data[index]['prenom'],
                                          PathContenu: data[index]
                                              ['PathContenu'],
                                          PathProfile: data[index]['imagePath'],
                                          TypeContenue: data[index]['type'],
                                        ),
                                      ));
                                },
                                isLike: isLiked,
                                onJaimeTap: () async {
                                  Aimer(data[index]['idPost']).then((aime) {
                                    setState(() {
                                      isLiked = isLiked;
                                    });
                                  });
                                },
                                Legende: data[index]['Legende'],
                                nbrAime: (!sn.hasData ||
                                        sn.data?["idUser"][1] == null)
                                    ? "..."
                                    : sn.data["idUser"][1].toString(),
                                Nom: data[index]['nom'],
                                Prenom: data[index]['prenom'],
                                PathContenu: data[index]['PathContenu'],
                                PathProfile: data[index]['imagePath'],
                                TypeContenue: data[index]['type'],
                              );
                            }),
                          ),
                        ],
                      );
                    } else {
                      return Container(
                        width: w,
                        child: FutureBuilder<dynamic>(
                            future: getNbrAimes(data[index]['idPost']),
                            builder: (context, sn) {
                              bool isLiked = sn.hasData
                                  ? sn.data["idUser"][2] == 1
                                  : false;
                              return PostContainer(
                                CommentTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CommentaireVue(
                                          UsNom: widget.user.nom,
                                          UsPrenom: widget.user.prenom,
                                          UsProfilPath: widget.user.imageName,
                                          idPost: data[index]['idPost'],
                                          idUser: widget.user.Id,
                                          isLike: isLiked,
                                          Legende: data[index]['Legende'],
                                          nbrAime: (!sn.hasData ||
                                                  sn.data?["idUser"][1] == null)
                                              ? "..."
                                              : sn.data["idUser"][1].toString(),
                                          Nom: data[index]['nom'],
                                          Prenom: data[index]['prenom'],
                                          PathContenu: data[index]
                                              ['PathContenu'],
                                          PathProfile: data[index]['imagePath'],
                                          TypeContenue: data[index]['type'],
                                        ),
                                      ));
                                },
                                isLike: isLiked,
                                onJaimeTap: () async {
                                  Aimer(data[index]['idPost']).then((aime) {
                                    setState(() {
                                      isLiked = isLiked;
                                    });
                                  });
                                },
                                Legende: data[index]['Legende'],
                                nbrAime: (!sn.hasData ||
                                        sn.data?["idUser"][1] == null)
                                    ? "..."
                                    : sn.data["idUser"][1].toString(),
                                Nom: data[index]['nom'],
                                Prenom: data[index]['prenom'],
                                PathContenu: data[index]['PathContenu'],
                                PathProfile: data[index]['imagePath'],
                                TypeContenue: data[index]['type'],
                              );
                            }),
                      );
                    }
                  },
                ),
              ),
      ),
      bottomNavigationBar: BottomNavigation(isHome: true),
    );
  }
}
