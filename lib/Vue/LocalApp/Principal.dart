import 'dart:async';

import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/Auth/LoginVue.dart';
import 'package:african_ap/Vue/LocalApp/Message.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:african_ap/Vue/Widgets/BottomNavigation.dart';
import 'package:african_ap/Vue/Widgets/BoutonCusm.dart';
import 'package:african_ap/Vue/Widgets/Drawer.dart';
import 'package:african_ap/Vue/Widgets/PostContainer.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  String prenom;
  String nom;
  String telephone;
  String email;
  String img;

  Principal({
    super.key,
    required this.prenom,
    required this.nom,
    required this.telephone,
    required this.email,
    required this.img,
  });

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
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
    return Container(
      height: Media.height(context) * 0.06,
      width: Media.width(context) / 1.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
          border: Border.all(
            color: Colors.black45,
            width: 2,
          )),
      child: Padding(
        padding: EdgeInsets.only(left: 3, top: 0),
        child: TextField(
          decoration: InputDecoration(
            icon: SizedBox(
              width: 10,
            ),
            hintText: "Commencer un post",
            hintStyle: TextStyle(
              fontSize: 16,
              // fontFamily: "Milky",
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);
    return Scaffold(
      drawer: DrawerC(),
      appBar: AppBar(
        backgroundColor: Color(0xffEB7D30),
        actions: [
          ActionContainer(
            Icons.message,
            tap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Message(),));
            },
          ),
          ActionContainer(
            Icons.notifications,
            tap: (){},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("img/fondUp.png"),
                alignment: Alignment.topRight)),
        child: Container(
          height: h,
          width: w,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: h * 0.01, left: w * 0.08),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("img/profil.png"),
                        radius: h * 0.03,
                      ),
                      SizedBox(width: 10),
                      PostTF(),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                PostContainer(),
                PostContainer(),
                PostContainer(),
                PostContainer(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(isHome: true),
    );
  }
}
