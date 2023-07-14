import 'dart:developer';

import 'package:african_ap/Models/Message.dart';
import 'package:african_ap/Services/dbServices.dart';
import 'package:african_ap/Vue/Widgets/Notifications.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class MessageXController extends GetxController {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    // getAllUsers();
    getMessageForMe();
    // log(idni)
    super.onInit();
  }

  var listMessages = <Messages>[].obs;

  Future<List<Messages>> getAllMessages({required String id}) async {
    dbServices().getMessageCollection().snapshots().listen((event) {
      dbServices().getMessage(id: id).then((qsn) {
        log("The length of qs is" + qsn.docs.length.toString());
        listMessages.clear();
        for (var doc in qsn.docs) {
          Messages msg = Messages.fromFirestor(doc);
          // log(doc.data().toString());
          listMessages.add(msg);
        }
        log(listMessages.last.text);
        // Notifications.showNigTextNotification(
        //     title: "Nouveau message",
        //     body: listMessages.last.text,
        //     fln: flutterLocalNotificationsPlugin);
      });
    });
    return listMessages;
  }

  Future<List<Messages>> getMessageForMe() async {
    dbServices().getMessageCollection().snapshots().listen((event) {
      dbServices().getMessageForMe().then((qsn) {
        for (var msg in qsn.docs) {
          dbServices().getUserM(msg.data()["idEx"]).then((ex)  {
            Notifications.showNigTextNotification(
                title: "${ex.prenom} ${ex.nom}",
                body: msg.data()["text"],
                fln: flutterLocalNotificationsPlugin);
             dbServices().isArrive(msg.id);
          });
        }
      });
    });
    return listMessages;
  }
}
