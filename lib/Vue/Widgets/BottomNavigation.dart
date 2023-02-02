import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/LocalApp/Contacts.dart';
import 'package:african_ap/Vue/LocalApp/Message.dart';
import 'package:african_ap/Vue/LocalApp/Messagerie.dart';
import 'package:african_ap/Vue/LocalApp/Principal.dart';
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
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Messagerie(),));
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
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Principal(prenom: "prenom", nom: "nom", telephone: "telephone", email: "email", img: "img"),));
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
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Contacts() ,));
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
