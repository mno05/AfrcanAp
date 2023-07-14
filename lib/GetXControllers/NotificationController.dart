import 'dart:developer';
import 'package:african_ap/Models/Notifiacation.dart';
import 'package:african_ap/Services/dbServices.dart';
import 'package:get/get.dart';


class NotificationXController extends GetxController {
  @override
  void onInit() {
    getAllNotificatons();
    super.onInit();
  }

  var listNotificatons = <NotificationM>[].obs;
  var nbr = -1.obs;
  Future<List<NotificationM>> getAllNotificatons() async {
    dbServices().getNotificationCollection().snapshots().listen((event) {
      dbServices().getNotifications().then((qsn) {
        nbr=qsn.docs.length;
        // log("The length of qs is"+ qsn.docs.length.toString());
        listNotificatons.clear();
        for (var doc in qsn.docs) {
          NotificationM notif = NotificationM.fromFirestor(doc);
          dbServices().getUserM(notif.idUser).then((user) {
            log(doc.data().toString());
            listNotificatons.add(NotificationM(
                idUser: notif.idUser,
                date: notif.date,
                idNotif: notif.idNotif,
                imagePath: user.imagePath,
                portee: notif.portee,
                isArrive: notif.isArrive,
                isView: notif.isView,
                contenue: notif.contenue,
                typeNotif: notif.typeNotif,
                dest: notif.dest));
          });
        }
      });
    });
    return listNotificatons;
  }
}
