import 'dart:developer';

import 'package:african_ap/Controllers/ContactsController.dart';
import 'package:african_ap/Controllers/MessageController.dart';
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Data/SaveUser.dart';
import 'package:african_ap/Models/Message.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/LocalApp/ContactPersonProfil.dart';
import 'package:african_ap/Vue/LocalApp/Principal.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:african_ap/Vue/Widgets/BottomNavigation.dart';
import 'package:african_ap/Vue/Widgets/ChangePage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:toast/toast.dart';

class Contacts extends StatefulWidget {
  final SuperUser superUser;
  const Contacts({super.key, required this.superUser});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List<SuperUser> superUsers = [];
  List<SuperUser> superUsersT = [];

  remplirUsers() async {
    await ContactsController.AllContacts().then((value) {
      var isMe;
      value.forEach((element) {
        if (element.adresseMail == widget.superUser.adresseMail) {
          isMe = element;
        }
      });
      value.remove(isMe);
      setState(() {
        superUsers = value;
        superUsersT = superUsers;
      });
    });
  }

  @override
  void initState() {
    remplirUsers();
    super.initState();
  }

  TextEditingController tx = TextEditingController();
  Widget ChearcheTF() {
    return Container(
      height: Media.height(context) * 0.06,
      width: Media.width(context) / 1.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
          border: Border.all(
            color: Colors.black45,
            width: 0,
          )),
      child: Padding(
        padding: EdgeInsets.only(left: 3, top: 0),
        child: TextField(
          controller: tx,
          // onEditingComplete: () {
          //   BasicsWidgets.Load(context);
          //   setState(() {});
          // },

          onChanged: (value) {
            superUsers = [];
            superUsers = superUsersT
                .where((element) =>
                    element.nom
                        .toString()
                        .toLowerCase()
                        .contains(value.toLowerCase()) ||
                    element.prenom.toLowerCase().contains(value.toLowerCase()))
                .toList();
            // for (var element in superUsers) {
            //   if (element.nom.contains(value) ||
            //       element.prenom.contains(value)) {}
            // }
            setState(() {
              superUsers = superUsers;
            });
          },
          onTap: () {
            print("");
          },
          decoration: InputDecoration(
            icon: Icon(Icons.search),
            hintText: "Rechercher",
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

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    double h = Media.height(context);
    double w = Media.width(context);
    remplirUsers;
    log(superUsers.length.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppData.BasicColor,
        toolbarHeight: h * 0.08,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(widget.superUser.imagePath),
            radius: 10,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChearcheTF(),
            ),
            ActionContainer(
              Icons.message,
              tap: () {},
            )
          ],
        ),
        // actions: [],
      ),
      body: superUsers.length == 0
          ? Center(
              child: Container(
                width: w * .3,
                child: Lottie.asset("assets/Load.json"),
              ),
            )
          : ListView.builder(
              itemCount: superUsers.length,
              itemBuilder: (context, index) {
                return Column(children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(superUsers[index].imagePath),
                      radius: 25,
                      backgroundColor: Colors.grey,
                    ),
                    title: Text(
                      "${superUsers[index].prenom} ${superUsers[index].nom}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text("${superUsers[index].domainesExpertise}"),
                    trailing: Text(
                      "Membre ${superUsers[index].type!="Honneur"?superUsers[index].type:"d'"+superUsers[index].type}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      ChangePage.SliderPush(
                          context: context,
                          push: ContactPersoView(
                            superUser: superUsers[index],
                            idEx: widget.superUser.idSuper,
                          ));
                    },
                  ),
                ]);
              },
              // itemBuilder: (context, index) =>
            ),
      bottomNavigationBar: BottomNavigation(isSearch: true),
    );
  }

  Container Contact(
    double h,
    double w, {
    required String path,
    required String nom,
    required String prenom,
    required String domaine,
    required String type,
  }) {
    return Container(
      height: h * 0.08,
      width: w,
      padding: EdgeInsets.all((8)),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(path),
              radius: 18,
            ),
            title: Text(
              "$prenom $nom",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text("$domaine"),
            trailing: Text(
              "Membre $type",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
