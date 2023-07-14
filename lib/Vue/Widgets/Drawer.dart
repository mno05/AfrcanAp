import 'dart:async';
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Data/User.dart';
import 'package:african_ap/Services/Auth.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/Auth/LoginVue.dart';
import 'package:african_ap/Vue/LocalApp/Adhesion.dart';
import 'package:african_ap/Vue/LocalApp/Apropos.dart';
import 'package:african_ap/Vue/LocalApp/ContactUs.dart';
import 'package:african_ap/Vue/LocalApp/Contacts.dart';
import 'package:african_ap/Vue/LocalApp/Invitation.dart';
import 'package:african_ap/Vue/LocalApp/Parametre.dart';
import 'package:african_ap/Vue/LocalApp/ProfileModif.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:african_ap/Vue/Widgets/ChangePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class DrawerC extends StatelessWidget {
  final String prenom;
  final String nom;
  final String pathImage;
  const DrawerC({
    super.key,
    required this.prenom,
    required this.nom,
    required this.pathImage,
  });

  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);
    return Padding(
      padding: EdgeInsets.only(top: h * 0.11, bottom: h * 0.01),
      child: Drawer(
        // width: w/2,
        elevation: 5,
        backgroundColor: Colors.white70,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                padding: EdgeInsets.only(top: h * 0.04),
                height: h * 0.28,
                width: w,
                // color: Colors.black,
                child: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(pathImage),
                        radius: h * 0.07,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "$prenom $nom",
                        style: TextStyle(
                          color: AppData.BasicColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          SaveSuperUser.getSuperUser().then((value) {
                            if (value.isLambda) {
                              ChangePage.Push(
                                  context: context,
                                  push: ProfileModif(user: value));
                            } else {
                              SaveSuperUser.getSuperUser().then((value) {
                                ChangePage.Push(
                                    context: context,
                                    push: ProfileModif(
                                      superUser: value,
                                    ));
                              });
                            }
                          });
                        },
                        child: Text(
                          'Voir le profil',
                          style: TextStyle(color: Colors.black54),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                minLeadingWidth: -4,
                dense: true,
                minVerticalPadding: 0,
                style: ListTileStyle.drawer,
                contentPadding:
                    EdgeInsets.only(left: w * 0.09, top: -4, bottom: -4),
                leading: Icon(
                  Icons.home,
                  color: AppData.BasicColor,
                  size: 30,
                ),
                title: Text(
                  "Accueil",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Apropos(),
                      ));
                },
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                minLeadingWidth: -4,
                dense: true,
                minVerticalPadding: 0,
                style: ListTileStyle.drawer,
                contentPadding:
                    EdgeInsets.only(left: w * 0.09, top: -4, bottom: -4),
                leading: Icon(
                  Icons.info,
                  color: AppData.BasicColor,
                  size: 30,
                ),
                title: Text(
                  "A propos",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactUs(),
                      ));
                },
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                minLeadingWidth: -4,
                dense: true,
                minVerticalPadding: 0,
                style: ListTileStyle.drawer,
                contentPadding:
                    EdgeInsets.only(left: w * 0.09, top: -4, bottom: -4),
                leading: Icon(
                  Icons.mark_as_unread_sharp,
                  color: AppData.BasicColor,
                  size: 30,
                ),
                title: Text(
                  "Nous contacter",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Invitation(),
                  ));
                },
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                minLeadingWidth: -4,
                dense: true,
                minVerticalPadding: 0,
                style: ListTileStyle.drawer,
                contentPadding:
                    EdgeInsets.only(left: w * 0.09, top: -4, bottom: -4),
                leading: Icon(
                  Icons.share,
                  color: AppData.BasicColor,
                  size: 30,
                ),
                title: Text(
                  "Invitation",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              ListTile(
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

                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => Adhesion(),
                      // )));
                    } else {
                      Get.to(() => Contacts(superUser: us));
                    }
                  });
                },
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                minLeadingWidth: -4,
                dense: true,
                minVerticalPadding: 0,
                style: ListTileStyle.drawer,
                contentPadding:
                    EdgeInsets.only(left: w * 0.09, top: -4, bottom: -4),
                leading: Icon(
                  Icons.place,
                  color: AppData.BasicColor,
                  size: 30,
                ),
                title: Text(
                  "Trouver un membre",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Parametre(),
                      ));
                },
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                minLeadingWidth: -4,
                dense: true,
                minVerticalPadding: 0,
                style: ListTileStyle.drawer,
                contentPadding:
                    EdgeInsets.only(left: w * 0.09, top: -4, bottom: -4),
                leading: Icon(
                  Icons.settings,
                  color: AppData.BasicColor,
                  size: 30,
                ),
                title: Text(
                  "Paramètres",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  BasicsWidgets.Load(context);
                  Timer(
                    Duration(seconds: 3),
                    (() async {
                      // SaveUser.SupprimerUser();
                      // SaveSuperUser.Supprimer();
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //   builder: (context) => LoginVue(),
                      // ));
                      Navigator.pop(context);
                      SaveSuperUser.Supprimer();
                      await removeKey(AppData.userPref);
                      AuthServices().Logout(context);
                    }),
                  );
                },
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                minLeadingWidth: -4,
                dense: true,
                minVerticalPadding: 0,
                style: ListTileStyle.drawer,
                contentPadding:
                    EdgeInsets.only(left: w * 0.09, top: -4, bottom: -4),
                leading: Icon(
                  Icons.output,
                  color: AppData.BasicColor,
                  size: 30,
                ),
                title: Text(
                  "Déconnexion",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
