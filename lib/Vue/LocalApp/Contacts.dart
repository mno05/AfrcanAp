import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:african_ap/Vue/Widgets/BottomNavigation.dart';
import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
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
    double h = Media.height(context);
    double w = Media.width(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppData.BasicColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("img/profil.png"),
              radius: 15,
            ),
            ChearcheTF(),
            ActionContainer(
              Icons.message,
              tap: () {},
            )
          ],
        ),
        // actions: [],
      ),
      body: Container(
        height: h,
        width: w,
        padding: EdgeInsets.all((8)),
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("img/profil.png"),
                radius: 18,
              ),
              title: Text(
                "Moïse NDJADI",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                
              ),
              subtitle: Text("Informaticien"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(isSearch: true),
    );
  }
}
