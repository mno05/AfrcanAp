import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationM {
  String? idNotif;
  String idUser;
  String typeNotif;
  String? portee;
  String dest;
  String contenue;
  String? imagePath;
  bool? isArrive;
  bool? isView;
  DateTime? date;

  NotificationM({
    this.idNotif,
    required this.idUser,
    this.date,
    required this.contenue,
    required this.typeNotif,
    this.portee,
    required this.dest,
    this.imagePath,
    this.isArrive,
    this.isView,
  });

  Map<String, String> ToMap() {
    return {
      "idNotif": idNotif.toString(),
      "IdUser": idUser,
      "typeNotif": typeNotif,
      "portee": portee!,
      "contenue": contenue,
      "date": date.toString(),
    };
  }

  factory NotificationM.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return NotificationM(
      idNotif: data?["idNotif"],
      contenue: data?['contenue'],
      typeNotif: data?['typeNotif'],
      date: data?['date'],
      idUser: data?['idUser'],
      // imagePath: data?['imagePath'],
      portee: data?['portee'],
      isArrive: data?['isArrive'],
      isView: data?['isView'],
      dest: data?['dest'],
    );
  }
  static NotificationM fromFirestor(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return NotificationM(
      idNotif: data?["idNotif"],
      contenue: data?['contenue'],
      typeNotif: data?['typeNotif'],
      date: data?['date'],
      idUser: data?['idUser'],
      // imagePath: data?['imagePath'],
      portee: data?['portee'],
      isArrive: data?['isArrive'],
      isView: data?['isView'],
      dest: data?['dest'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      "idNotif": idNotif.toString(),
      "IdUser": idUser,
      "typeNotif": typeNotif,
      if (portee != null) "portee": portee,
      "contenue": contenue,
      "isArrive": false,
      "isView": false,
      dest: dest,
      "date": date.toString(),
    };
  }
}
