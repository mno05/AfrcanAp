import 'dart:async';

import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Data/Instantane.dart';
import 'package:african_ap/Data/User.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Services/Auth.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/LocalApp/ProfileModif.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:african_ap/Vue/Widgets/ChangePage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';

class Compte extends StatefulWidget {
  const Compte({super.key});

  @override
  State<Compte> createState() => _CompteState();
}

class _CompteState extends State<Compte> {
  UserM? su;
  @override
  void initState() {
    // SaveSuperUser.getSuperUser().then((value) {
    //   setState(() {
    //     su = value;
    //   });
    // });
    su = Instantane.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF0),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h * 0.1),
        child: AppBar(
          leadingWidth: h * 0.15,
          backgroundColor: Colors.transparent,
          leading: Container(
            child: Image.asset("img/logo.png"),
          ),
          elevation: 0,
        ),
      ),
      body: su == null
          ? Center(
              child: Center(
                child: Container(
                  width: w * .3,
                  child: Lottie.asset("assets/Load.json"),
                ),
              ),
            )
          : Container(
              height: h,
              width: w,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: w * 0.14),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(su!.imagePath!),
                          radius: h * 0.04,
                        ),
                        title: Text(
                          '${su!.prenom} ${su!.nom}',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: w * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "${su!.domainesExpertise}",
                          style: TextStyle(
                            fontSize: w * 0.04,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: h * 0.06,
                      width: w / 1.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          width: 1,
                          color: Colors.black45,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          SaveSuperUser.getSuperUser().then((value) {
                            if (value.isLambda) {
                              ChangePage.Push(context: context, push: ProfileModif(user: value));
                            } else {
                              SaveSuperUser.getSuperUser().then((value) {
                                ChangePage.Push(context: context, push: ProfileModif(superUser: value,));
                              });
                            }
                          });
                        },
                        child: Center(
                            child: Text(
                          "Voir le profil",
                          style: TextStyle(color: AppData.BasicColor),
                        )),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: h / 4,
                      width: w,
                      decoration: BoxDecoration(
                        // color: Colors.black,
                        border: Border(
                          top: BorderSide(width: 1, color: Colors.black12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Compte",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Préferences et confidentialité",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Langue",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: h / 4,
                      width: w,
                      decoration: BoxDecoration(
                        // color: Colors.black,
                        border: Border(
                          top: BorderSide(width: 1, color: Colors.black12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gérer",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Posts et activité",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
      bottomSheet: Container(
        // height: h*0.2,
        width: w,
        child: ElevatedButton(
          onPressed: () {
             BasicsWidgets.Load(context);
                  BasicsWidgets.Load(context);
                  Timer(Duration(seconds: 3), (()async {
                    Navigator.pop(context);
                    SaveSuperUser.Supprimer();
                    await removeKey(AppData.userPref);
                    AuthServices().Logout(context);
                  }));
          },
          child: Text("Déconnexion"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppData.BasicColor)),
        ),
      ),
    );
  }
}
