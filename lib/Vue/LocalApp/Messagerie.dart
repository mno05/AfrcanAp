import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/LocalApp/Message.dart';
import 'package:african_ap/Vue/Widgets/BottomNavigation.dart';
import 'package:african_ap/Vue/Widgets/StateCircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Messagerie extends StatefulWidget {
  const Messagerie({super.key});

  @override
  State<Messagerie> createState() => _MessagerieState();
}

class _MessagerieState extends State<Messagerie> {
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
        body: Container(
          height: h,
          width: w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: h * 0.1,
                width: w,
                padding: EdgeInsets.only(left: w * 0.05),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Message",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppData.BasicColor,
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(child: Icon(Icons.more_horiz_sharp)),
                            SizedBox(width: 5),
                            InkWell(
                                child: Icon(
                                    CupertinoIcons.pencil_ellipsis_rectangle)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          height: h * 0.05,
                          width: w / 1.5,
                          color: Colors.grey[350],
                          child: TextField(
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.search,
                                color: Colors.black54,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        InkWell(
                          child: Icon(Icons.format_list_bulleted_rounded),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Message(),)),
                      leading: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("img/profil.png"),
                            radius: 30,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 5,
                            child: StateCircle(true),
                          ),
                        ],
                      ),
                      title: Text(
                        "Moïse NDJADI",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Boni yo?"),
                      trailing: Text("12:34"),
                    ),
                    ListTile(
                      leading: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("img/profil.png"),
                            radius: 30,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 5,
                            child: StateCircle(true),
                          ),
                        ],
                      ),
                      title: Text(
                        "Moïse NDJADI",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Boni yo?"),
                      trailing: Text("12:34"),
                    ),
                    ListTile(
                      leading: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("img/profil.png"),
                            radius: 30,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 5,
                            child: StateCircle(true),
                          ),
                        ],
                      ),
                      title: Text(
                        "Moïse NDJADI",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Boni yo?"),
                      trailing: Text("12:34"),
                    ),
                    ListTile(
                      leading: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("img/profil.png"),
                            radius: 30,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 5,
                            child: StateCircle(true),
                          ),
                        ],
                      ),
                      title: Text(
                        "Moïse NDJADI",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Boni yo?"),
                      trailing: Text("12:34"),
                    ),
                    ListTile(
                      leading: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("img/profil.png"),
                            radius: 30,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 5,
                            child: StateCircle(true),
                          ),
                        ],
                      ),
                      title: Text(
                        "Moïse NDJADI",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Boni yo?"),
                      trailing: Text("12:34"),
                    ),
                    ListTile(
                      leading: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("img/profil.png"),
                            radius: 30,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 5,
                            child: StateCircle(true),
                          ),
                        ],
                      ),
                      title: Text(
                        "Moïse NDJADI",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Boni yo?"),
                      trailing: Text("12:34"),
                    ),
                    ListTile(
                      leading: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("img/profil.png"),
                            radius: 30,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 5,
                            child: StateCircle(true),
                          ),
                        ],
                      ),
                      title: Text(
                        "Moïse NDJADI",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Boni yo?"),
                      trailing: Text("12:34"),
                    ),
                    ListTile(
                      leading: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("img/profil.png"),
                            radius: 30,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 5,
                            child: StateCircle(true),
                          ),
                        ],
                      ),
                      title: Text(
                        "Moïse NDJADI",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Boni yo?"),
                      trailing: Text("12:34"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigation(
          isMessage: true,
        ));
  }
}
