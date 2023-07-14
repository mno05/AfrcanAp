import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:african_ap/GetXControllers/MessageController.dart';
import 'package:african_ap/Services/dbServices.dart';
import 'package:african_ap/Tools/DateDifference.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:african_ap/Controllers/MessageController.dart';
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Models/Message.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/Widgets/StateCircle.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class Message extends StatefulWidget {
  UserM SuperUserEx;
  UserM SuperUserDes;
  String idContact;
  Message({
    super.key,
    required this.SuperUserEx,
    required this.SuperUserDes,
    required this.idContact,
  });

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  TextEditingController messTE = TextEditingController();
  MessageXController msc = Get.put(MessageXController());

  bool flagAsync = true;
  bool flagAsyncSend = false;

  var dataMessages;
  // var msg = <Messages>[].obs;
  @override
  void initState() {
    msc.getAllMessages(id: widget.idContact);
    
    super.initState();
  }

  // Future<void> getAllMessageUsers() async {
  //   final response = await http
  //       .post(Uri.parse("https://myap.moglich.net/api/Messages.php/"), body: {
  //     "idDes": '${widget.SuperUserDes.idSuper}',
  //     "idEx": '${widget.SuperUserEx.idSuper}',
  //   });

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       dataMessages = json.decode(response.body);
  //       for (var i = 0; i < dataMessages.length; i++) {
  //         msg.add(
  //           Messages(
  //             idMessage: dataMessages[i]["idMessage"],
  //             idEx: dataMessages[i]["idEx"],
  //             idDes: dataMessages[i]["idDes"],
  //             text: dataMessages[i]["text"],
  //             dateTime: DateDifference.dateFromServerToDateTime(
  //               dataMessages[i].toString(),
  //             ),
  //           ),
  //         );
  //       }
  //       flagAsync = false;
  //       flagAsyncSend = false;
  //     });
  //   }

  //   // log(' Resultat : ${}');
  // }

  // bool sendByMe = true;
  @override
  Widget build(BuildContext context) {
    log(msc.listMessages.length.toString());
    double h = Media.height(context);
    double w = Media.width(context);
    if (!flagAsync) {
      // msg = msg.reversed.toList();
    }
    print(dataMessages);
    // log(widget.messages.toString());
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.SuperUserEx.imagePath!),
                  radius: 20,
                  backgroundColor: Colors.grey,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: StateCircle(true),
                ),
              ],
            ),
            SizedBox(width: 8),
            Text("${widget.SuperUserEx.prenom} ${widget.SuperUserEx.nom}"),
          ],
        ),
        backgroundColor: AppData.BasicColor,
      ),
      body: Obx(() => (msc.listMessages.length == 0)
          ? Center(
              child: CupertinoActivityIndicator(),
            )
          : Padding(
              padding: EdgeInsets.only(bottom: h * .1),
              child: ListView.builder(
                  reverse: true,
                  itemCount: msc.listMessages.length,
                  itemBuilder: (context, i) {
                    return Container(
                      // width: Media.width(context),
                      margin: EdgeInsets.only(
                          bottom: i == msc.listMessages.length ? 100 : 0),
                      constraints: BoxConstraints(minWidth: 20, maxWidth: 20),
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 10),
                      child: Align(
                        alignment: ((msc.listMessages[i].idDes ==
                                widget.SuperUserDes.Uid.toString()
                            ? Alignment.topLeft
                            : Alignment.topRight)),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (msc.listMessages[i].idDes ==
                                    widget.SuperUserDes.Uid.toString()
                                ? Colors.grey.shade200
                                : Colors.blue[200]),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 0,
                                    top: 0,
                                    // bottom: 10,
                                    right: 30),
                                child: Text(
                                  '${msc.listMessages[i].text}',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30,
                                    // top: 10,
                                    bottom: 0,
                                    right: 0),
                                child: Text(
                                  '${DateDifference.time(DateDifference.dateFromServerToDateTime(msc.listMessages[i].dateTime!), DateTime.now())}',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )),
      bottomSheet: Container(
        padding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 10),
        // height: h * 0.1,
        width: w,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              child: Icon(
                Icons.emoji_emotions_outlined,
                color: Colors.black54,
              ),
            ),
            InkWell(
              child: Icon(
                Icons.link,
                color: Colors.black54,
              ),
            ),
            Container(
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.only(left: 10),
              width: w / 1.35,
              decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadiusDirectional.circular(25)),
              child: TextField(
                controller: messTE,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Ecrire un message",
                  border: InputBorder.none,
                ),
              ),
            ),
            InkWell(
                child: Icon(
                  Icons.send,
                  color: Colors.green,
                ),
                onTap: () async {
                  String idMessage = "Id_" +
                      DateTime.now()
                          .toString()
                          .split(".")
                          .first
                          .replaceAll(" ", "_");
                  if (messTE.text.isEmpty) {
                  } else {
                    Messages ms = Messages(
                      text: messTE.text,
                      idEx: widget.SuperUserDes.Uid!,
                      idDes: widget.SuperUserEx.Uid!,
                      idMessage: idMessage,
                      dateTime: DateTime.now().toString(),
                    );
                    dbServices().contacterUser(messages: ms);
                    messTE.text = '';
                    msc.listMessages.add(ms);
                    // setState(() {
                    //   msg.add(ms);
                    //   messTE.text = "";
                    //   flagAsyncSend = true;
                    // });
                  }
                }),
          ],
        ),
      ),
    );
  }
}
