import 'package:cloud_firestore/cloud_firestore.dart';

class Messages {
  final String idMessage;
  final String idEx;
  final String idDes;
  final String text;
  final String? dateTime;
  final bool? arrive;

  const Messages({
    required this.idMessage,
    required this.idEx,
    required this.idDes,
    required this.text,
    required this.dateTime,
    this.arrive
  });

   factory Messages.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Messages(
      idMessage: data?["idMessage"],
      idEx: data?['idEx'],
      idDes: data?['idDes'],
      dateTime: data?['date'],
      text: data?['text'],
      arrive: data?['arrive']
    );
  }
  static Messages fromFirestor(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
     return Messages(
      idMessage: data?["idMessage"],
      idEx: data?['idEx'],
      idDes: data?['idDes'],
      dateTime: data?['date'],
      text: data?['text'],
      arrive: data?['arrive']

    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      "idMessage": idMessage,
      "idEx": idEx,
      "idDes": idDes,
      "date": dateTime,
      "text": text,
     'arrive' :arrive

    };
  }







  @override
  toString() {
    return "idMessage:${idMessage}--idEx:${idEx}--idDes:${idDes}--text:${text}--dateTime:${dateTime}";
  }

  // @override
  // int compareTo(other) {
  //   if (other is Messages) {
  //     return other.dateTime.compareTo(dateTime);
  //   }
  //   return 0;
  // }
}
