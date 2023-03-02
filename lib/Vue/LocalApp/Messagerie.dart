import 'dart:async';
import 'dart:convert';
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
import 'package:http/http.dart' as http;

class Messagerie extends StatefulWidget {
  final SuperUser superUser;
  const Messagerie({super.key, required this.superUser});
  @override
  State<Messagerie> createState() => _MessagerieState();
}

class _MessagerieState extends State<Messagerie> {
  List<SuperUser> superUsers = [];
  List<Messages> msg = [];
  List<List<String>> IdExAnMessages = [[], []];

  bool flagAsync = true;

  bool NoMessage = false;
  remplirUsersEtMessages() async {
    await ContactsController.ContactMessage(widget.superUser.idSuper!)
        .then((Su) {
      setState(() {
        // IdExAnMessages = recup;
        // log(recup.toString());

        superUsers = Su;
      });
    });
  }

  @override
  void initState() {
    try {
      remplirUsersEtMessages();
    } catch (e) {
      // log(e.toString());
    }
    // Timer(
    //   Duration(seconds: 15),
    //   () {
    //     if (superUsers.length == 0) {
    //       setState(() {
    //         superUsers.length = 0;
    //         NoMessage = true;
    //       });
    //     }
    //   },
    // );
    // MessageController.getMessage(idEx: "14", idDes: "16");
    super.initState();

    getAllMessageUsers();
  }

  getAllMessageUsers() async {
    final response = await http.post(
        Uri.parse(
            "https://africanap.000webhostapp.com/african_ap/MessageContact.php"),
        body: {
          "idDes": '${widget.superUser.idSuper}',
        });

    if (response.statusCode == 200) {
      setState(() {
        dataContacts = json.decode(response.body);
        flagAsync = false;
      });
    }

    // log(' \n\n\n\n\n\n\n Resultat : ${dataContacts}');
  }

  Future getLastMessage(idEx) async {
    log(idEx);
    final response = await http.post(
        Uri.parse(
            "https://africanap.000webhostapp.com/african_ap/recupLastEnreg.php/"),
        body: {
          "idDes": '${widget.superUser.idSuper}',
          "idEx": idEx,
        });
    print(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }

    // log(' \n\n\n\n\n\n\n Resultat : ${dataContacts}');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // getLastMessage("16");
    print(dataContacts[0]["idSuper"]);
    double h = Media.height(context);
    double w = Media.width(context);
    // log("\n\n\n\n\n\n\n ${msg[0].text}");
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
                child: flagAsync
                    ? Center(
                        child: Center(
                          child: Container(
                            width: w * .3,
                            child: Lottie.asset("assets/Load.json"),
                          ),
                        ),
                      )
                    :
                    // Column(
                    //     children: [
                    //       for (int i = 0; i < IdExAnMessages[superUsers[0].idSuper]!.length; i++)
                    //         Text(
                    //             '${IdExAnMessages[superUsers[0].idSuper]![i].text}')
                    //     ],
                    //   )
                    ListView.builder(
                        itemCount: dataContacts.length,
                        itemBuilder: (context, index) {
                          // log(index.toString());
                          return Column(
                            children: [
                              // Text('${dataContacts}'),
                              FutureBuilder<dynamic>(
                                  future: getLastMessage(dataContacts[index]
                                          ['idSuper']
                                      .toString()),
                                  builder: (context, snapshot) {
                                    return ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            superUsers[index].imagePath),
                                        radius: 25,
                                        backgroundColor: Colors.grey,
                                      ),
                                      title: Text(
                                        "${dataContacts[index]['prenom']} ${dataContacts[index]['nom']}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text(
                                        (!snapshot.hasData ||
                                                snapshot.data?[0]["text"] ==
                                                    null)
                                            ? "..."
                                            : snapshot.data?[0]["text"],
                                            maxLines: 1,
                                      ),
                                      trailing: Text((!snapshot.hasData ||
                                              snapshot.data?[0]["date"] == null)
                                          ? "..."
                                          : "${snapshot.data[0]["date"].toString().split("-").last.split(" ").last.split(":").first}:${snapshot.data[0]["date"].toString().split("-").last.split(" ").last.split(":")[1]}"),
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => Message(
                                            SuperUserDes: widget.superUser,
                                            SuperUserEx: superUsers[index],

                                            // messages: IdExAnMessages[
                                            //     superUsers[index].idSuper]!,
                                          ),
                                        ));
                                      },
                                    );
                                  }),
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
