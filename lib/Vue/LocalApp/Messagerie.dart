import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:african_ap/Controllers/ContactsController.dart';
import 'package:african_ap/Controllers/MessageController.dart';
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/GetXControllers/ContactsController.dart';
import 'package:african_ap/Models/Message.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Tools/DateDifference.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/LocalApp/Message.dart';
import 'package:african_ap/Vue/Widgets/BottomNavigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';

class Messagerie extends StatefulWidget {
  final UserM superUser;
  const Messagerie({super.key, required this.superUser});
  @override
  State<Messagerie> createState() => _MessagerieState();
}

class _MessagerieState extends State<Messagerie> {
  List<UserM> superUsers = [];
  List<Messages> msg = [];
  List<List<String>> IdExAnMessages = [[], []];

  ContatacsXController msc = Get.put(ContatacsXController());

  bool flagAsync = true;

  bool NoMessage = false;
  remplirUsersEtMessages() async {}

  @override
  void initState() {
    Timer(
      Duration(seconds: 15),
      () {
        if (msc.listAllContacts.length == 0) {
          toastLong(
              "Assurez vous d'avoir une bonne connexion internet et avoir des contacts");
        }
      },
    );
    // MessageController.getMessage(idEx: "14", idDes: "16");
    super.initState();

    // getAllMessageUsers();
  }

  // getAllMessageUsers() async {
  //   final response = await http.post(
  //       Uri.parse("https://myap.moglich.net/api/MessageContact.php"),
  //       body: {
  //         "idDes": '${widget.superUser.idSuper}',
  //       });

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       dataContacts = json.decode(response.body);
  //       flagAsync = false;
  //     });
  //   }

  //   // log(' \n\n\n\n\n\n\n Resultat : ${dataContacts}');
  // }

  Future getLastMessage(idEx) async {
    log(idEx);
    final response = await http.post(
        Uri.parse("https://myap.moglich.net/api/recupLastEnreg.php/"),
        body: {
          "idDes": '${widget.superUser.Uid}',
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
    // print(dataContacts[0]["idSuper"]);
    double h = Media.height(context);
    double w = Media.width(context);
    // Timer(
    //   Duration(seconds: 3),
    //   () => getAllMessageUsers(),
    // );
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
        // body: Center(
        //   child:Obx(()=>Text(msc.listAllContacts.toString())) ,
        // ),
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
                      children: [],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          height: h * 0.05,
                          width: w / 1.5,
                          decoration: BoxDecoration(
                            color: Colors.grey[350],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.search,
                                color: Colors.black54,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        // InkWell(
                        //   child: Icon(Icons.format_list_bulleted_rounded),
                        // )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(
                  () => (msc.listAllContacts.length == 0 &&
                          msc.listUserEx.length == 0)
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
                          itemCount: msc.listAllContacts.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            // log(index.toString());
                            return Column(
                              children: [
                                // Text('${dataContacts}'),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    elevation: 1,
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: ListTile(
                                        leading: Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 3,
                                                color: Colors.black54,
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(msc
                                                .listUserEx[index].imagePath!),
                                            radius: 25,
                                            backgroundColor: Colors.grey,
                                          ),
                                        ),
                                        title: Text(
                                          "${msc.listUserEx[index].prenom} ${msc.listUserEx[index].nom}",
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: w * .035,
                                          ),
                                        ),
                                        subtitle: Text(
                                          msc.listAllContacts[index]
                                              ["lastMessage"],
                                          maxLines: 1,
                                        ),
                                        trailing: Text(
                                            "${DateDifference.time(DateDifference.dateFromServerToDateTime(msc.listAllContacts[index]["date"]), DateTime.now())}"),

                                        // : "${snapshot.data[0]["date"].toString().split("-").last.split(" ").last.split(":").first}:${snapshot.data[0]["date"].toString().split("-").last.split(" ").last.split(":")[1]}"),
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => Message(
                                              SuperUserDes: widget.superUser,
                                              SuperUserEx:
                                                  msc.listUserEx[index],
                                              idContact:
                                                  msc.listAllContacts[index]
                                                      ["idContact"],
                                            ),
                                          ));
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
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
