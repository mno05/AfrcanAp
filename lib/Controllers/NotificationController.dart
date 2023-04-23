import 'dart:convert';
import 'dart:developer';

import 'package:african_ap/Models/Notifiacation.dart';
import 'package:african_ap/Tools/DateDifference.dart';
import 'package:dio/dio.dart';
import 'package:toast/toast.dart';

class NotificationController {
  static void Notifier(NotificationM notificationM) async {
    try {
      String url =
          "https://myap.moglich.net/api/Notification.php/";
      FormData formData = FormData.fromMap(notificationM.ToMap());
      final Response = await Dio().post(url, data: formData);
      if (Response.statusCode == 200) {
        String rs = Response.data.toString().replaceAll("\n", "");
        var data = jsonDecode(rs);
        var resultat = data["data"];
        int succes = resultat[1];
        if (succes == 1) {
        } else {
          // Navigator.pop(context);
          Toast.show(resultat[0], duration: 8);
        }
        print(succes);
      }
    } catch (e) {
      // Navigator.pop(context);
      log(e.toString());
    }
  }

  static Future<List<NotificationM>?> Recuperer(String portee) async {
    try {
      String url =
          "https://myap.moglich.net/api/recupNootification.php/";
      FormData formData = FormData.fromMap({"portee": portee});
      final Response = await Dio().post(url, data: formData);
      if (Response.statusCode == 200) {
        String rs = Response.data.toString().replaceAll("\n", "");
        var dataNotifiacations = jsonDecode(rs);
        var resultat = dataNotifiacations;
          List<NotificationM> notifs = [];
          for (int index = 0; index < resultat.length; index++) {
            notifs.add(NotificationM(
              imagePath: resultat[index]['imagePath'],
              contenue: resultat[index]['contenue'],
              date: DateDifference.DateFromServerToDateTime(resultat[index]),
              idPost: resultat[index]['Idpost'],
              idUser: resultat[index]['idUser'],
              portee: resultat[index]['portee'],
              idNotif: resultat[index]['idNotif'],
            ));
          }
          return notifs;
      }
    } catch (e) {
      // Navigator.pop(context);
      log(e.toString());
    }
    // return NotificationM(idUser: "", date: DateTime.now(), contenue: "", idPost: "", portee: "");
  }
}
