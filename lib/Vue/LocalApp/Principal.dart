import 'dart:async';

import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Models/User.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/Auth/LoginVue.dart';
import 'package:african_ap/Vue/LocalApp/Message.dart';
import 'package:african_ap/Vue/LocalApp/PostVue.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:african_ap/Vue/Widgets/BottomNavigation.dart';
import 'package:african_ap/Vue/Widgets/BoutonCusm.dart';
import 'package:african_ap/Vue/Widgets/Drawer.dart';
import 'package:african_ap/Vue/Widgets/PostContainer.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  User user;
  Principal({
    super.key,
    required this.user,
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
    return InkWell(
      child: Container(
        height: Media.height(context) * 0.06,
        width: Media.width(context) / 1.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
            border: Border.all(
              color: Colors.black45,
              width: 2,
            )),
        child: Center(child: Text("Commencer un post")),
      ),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostVue(user: widget.user,),)),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(widget.user.imageName,),
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
