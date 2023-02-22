import 'dart:async';
import 'dart:developer';
import 'package:african_ap/Controllers/ContactsController.dart';
import 'package:african_ap/Controllers/MessageController.dart';
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Models/Message.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/LocalApp/Message.dart';
import 'package:african_ap/Vue/Widgets/BottomNavigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Messagerie extends StatefulWidget {
  final SuperUser superUser;
  const Messagerie({super.key, required this.superUser});
  @override
  State<Messagerie> createState() => _MessagerieState();
}

class _MessagerieState extends State<Messagerie> {
  List<SuperUser> superUsers = [];
  List<Messages> msg = [];
  Map<String, List<Messages>> IdExAnMessages = {};
  Map<String, List<Messages>> recup = {};

  bool NoMessage = false;
  remplirUsersEtMessages() async {
    await ContactsController.ContactMessage(widget.superUser.idSuper!)
        .then((Su) {
      Su.forEach((element) {
        MessageController.getMessage(
                idEx: element.idSuper!, idDes: widget.superUser.idSuper!)
            .then((ListMessages) {
          setState(() {
            msg.addAll(ListMessages);
            recup.addAll({element.idSuper!: msg});
            msg.clear();
          });
        });
        MessageController.getMessage(
                idDes: element.idSuper!, idEx: widget.superUser.idSuper!)
            .then((ListMessages) {
          setState(() {});
          msg.addAll(ListMessages);
          msg.sort((a, b) => a.compareTo(b));
          recup.update(element.idSuper!, (value) => List.from(msg.reversed));
        });
      });

      setState(() {
        IdExAnMessages = recup;
        log(recup.toString());

        superUsers = Su;
      });
    });
  }

  @override
  void initState() {
    try {
      remplirUsersEtMessages();
    } catch (e) {
      log(e.toString());
    }
    Timer(
      Duration(seconds: 15),
      () {
        if (superUsers.length == 0) {
          setState(() {
            superUsers.length = 0;
            NoMessage = true;
          });
        }
      },
    );
    // MessageController.getMessage(idEx: "14", idDes: "16");
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);
    log(IdExAnMessages.toString());
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
                child: NoMessage
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            "assets/noMessage.json",
                            animate: true,
                            fit: BoxFit.cover,
                            reverse: true,
                          ),
                          Text(
                            "Vous n'avez aucun message pour l'instant\nVeuillez envoyer une demande de conversation à la rechecher pour commencer une discusion",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    : IdExAnMessages.isEmpty
                        ? Center(
                            child: Center(
                              child: Container(
                                width: w * .3,
                                child: Lottie.asset("assets/Load.json"),
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: superUsers.length,
                            itemBuilder: (context, index) {
                              log(index.toString());
                              return Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          superUsers[index].imagePath),
                                      radius: 25,
                                      backgroundColor: Colors.grey,
                                    ),
                                    title: Text(
                                      "${superUsers[index].prenom} ${superUsers[index].nom}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "${IdExAnMessages["14"]!.last.text}",
                                      // "${IdExAnMessages[superUsers[index].idSuper]!.last}",
                                      // "${superUsers[index].idSuper}",
                                      maxLines: 1,
                                    ),
                                    trailing: Text(
                                      "${IdExAnMessages[superUsers[index].idSuper]!.last.dateTime.toString().split(" ").last.split(".").first.split(":").first}:${IdExAnMessages[superUsers[index].idSuper]!.last.dateTime.toString().split(" ").last.split(".").first.split(":")[1]}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => Message(
                                          SuperUserDes: widget.superUser,
                                          SuperUserEx: superUsers[index],
                                          messages: IdExAnMessages[
                                              superUsers[index].idSuper]!,
                                        ),
                                      ));
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigation(
          isMessage: true,
        ));
  }
}
