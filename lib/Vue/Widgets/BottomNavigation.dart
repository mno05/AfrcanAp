import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Data/User.dart';
import 'package:african_ap/Data/Instantane.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/LocalApp/Adhesion.dart';
import 'package:african_ap/Vue/LocalApp/Contacts.dart';
import 'package:african_ap/Vue/LocalApp/Messagerie.dart';
import 'package:african_ap/Vue/LocalApp/Principal.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatelessWidget {
  final bool isMessage;
  final bool isHome;
  final bool isSearch;
  BottomNavigation({
    super.key,
    this.isMessage = false,
    this.isHome = false,
    this.isSearch = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Media.height(context) * 0.08,
      color: AppData.BasicColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          isMessage
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        // CupertinoIcons.ellipses_bubble_fill,
                        FontAwesomeIcons.solidMessage,

                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 3,
                      color: Colors.white,
                    )
                  ],
                )
              : IconButton(
                  onPressed: () {
                    UserM us = Instantane.getUser();
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
                      Get.to(() => Messagerie(superUser: us,));
                    }
                  },
                  icon: Icon(
                    // CupertinoIcons.ellipses_bubble_fill,
                    FontAwesomeIcons.solidMessage,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
          isHome
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        // Icons.home_sharp,
                        FontAwesomeIcons.homeLgAlt,

                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 3,
                      color: Colors.white,
                    )
                  ],
                )
              : IconButton(
                  onPressed: () async {
                    // UserM user = await SaveUser.getUser();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Principal(),
                        ));
                  },
                  icon: Icon(
                    // Icons.home_sharp,
                    FontAwesomeIcons.homeLgAlt,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
          isSearch
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        // CupertinoIcons.search,
                        FontAwesomeIcons.search,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 3,
                      color: Colors.white,
                    )
                  ],
                )
              : IconButton(
                  onPressed: () {
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
                  icon: Icon(
                    // CupertinoIcons.search,
                    FontAwesomeIcons.search,

                    size: 35,
                    color: Colors.white,
                  ),
                ),
        ],
      ),
    );
  }
}
