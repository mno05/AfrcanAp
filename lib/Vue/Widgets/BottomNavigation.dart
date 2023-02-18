import 'dart:io';

import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Data/SaveSuperUser.dart';
import 'package:african_ap/Data/SaveUser.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Models/User.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/Auth/LoginVue.dart';
import 'package:african_ap/Vue/LocalApp/Contacts.dart';
import 'package:african_ap/Vue/LocalApp/Message.dart';
import 'package:african_ap/Vue/LocalApp/Messagerie.dart';
import 'package:african_ap/Vue/LocalApp/Principal.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final bool isMessage;
  final bool isHome;
  final bool isSearch;
  const BottomNavigation({
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
                        CupertinoIcons.ellipses_bubble_fill,
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
                    SaveUser.getUser().then((value) {
                      if (value.isLambda) {
                        BasicsWidgets.alert(
                            "Vous n'etes pas éligible aux messages, veuillez adhérer la plateforme",
                            context);
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Messagerie(),
                            ));
                      }
                    });
                  },
                  icon: Icon(
                    CupertinoIcons.ellipses_bubble_fill,
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
                        Icons.home_sharp,
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
                    User user = await SaveUser.getUser();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Principal(user: user),
                        ));
                  },
                  icon: Icon(
                    Icons.home_sharp,
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
                        CupertinoIcons.search,
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
                    SaveUser.getUser().then((value) {
                      if (value.isLambda) {
                        BasicsWidgets.alert(
                            "Vous ne pouvez pas Contacter les membres, veuillez adhérer la plateforme",
                            context);
                      } else {
                        SaveSuperUser.getSuperUser().then((value) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Contacts(superUser: value),
                              ));
                        });
                      }
                    });
                  },
                  icon: Icon(
                    CupertinoIcons.search,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
        ],
      ),
    );
  }
}
