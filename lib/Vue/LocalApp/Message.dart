import 'dart:developer';

import 'package:african_ap/Controllers/MessageController.dart';
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Models/Message.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:african_ap/Vue/Widgets/StateCircle.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class Message extends StatefulWidget {
  List<Messages> messages;
  SuperUser SuperUserEx;
  SuperUser SuperUserDes;

  Message({
    super.key,
    required this.messages,
    required this.SuperUserEx,
    required this.SuperUserDes,
  });

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  TextEditingController messTE = TextEditingController();

  // bool sendByMe = true;
  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);
    log(widget.messages.toString());
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            StateCircle(true),
            SizedBox(width: 8),
            Text("${widget.SuperUserEx.prenom} ${widget.SuperUserEx.nom}"),
          ],
        ),
        backgroundColor: AppData.BasicColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GroupedListView<Messages, DateTime>(
              reverse: true,
              // order: GroupedListOrder.DESC,
              padding: EdgeInsets.all(8.0),
              elements: widget.messages,
              groupBy: (msg) => DateTime(
                msg.dateTime.year,
                msg.dateTime.month,
                msg.dateTime.day,
                // msg.dateTime.hour,
                // msg.dateTime.minute,
              ),
              groupHeaderBuilder: (Messages msg) => SizedBox(
                height: 40,
                child: Center(
                  child: Card(
                    color: AppData.BasicColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        DateFormat.yMMMd().format(msg.dateTime),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              itemBuilder: (context, messages) {
                bool isForMe =false;
                if(widget.SuperUserDes.idSuper==messages.idDes){
                  isForMe=true;
                }
                return Container(
                constraints: BoxConstraints(minWidth: 20, maxWidth: 20),
                padding:
                    EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: (isForMe
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (isForMe
                          ? Colors.grey.shade200
                          : Colors.blue[200]),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      messages.text,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              );
              // Align(
              //   alignment:
              //       messages.idDes== widget.SuperUserDes? Alignment.topRight : Alignment.topLeft,
              //   child: Container(
              //     margin: EdgeInsets.only(right: w*.2),
              //     child: Card(
              //       elevation: 8,
              //       child: Padding(
              //         padding: EdgeInsets.all(12),
              //         child: Text(messages.text),
              //       ),
              //     ),
              //   ),
              // ),
              },
              // itemBuilder: (context, Messages messages) => 
            ),
          ),
          Container(
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
                    color: Colors.black54,
                  ),
                  onTap: () {
                  Messages msg =Messages(
                      text: messTE.text,
                      idEx: widget.SuperUserDes.idSuper!,
                      idDes: widget.SuperUserEx.idSuper!,
                      idMessage: "",
                      dateTime: DateTime.now(),
                    );
                    MessageController.EnvoyerC(msg);
                  setState(() {
                    widget.messages.add(msg);
                    messTE.text = "";
                  });
                  } 
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
