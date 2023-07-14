import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:african_ap/Controllers/ContactsController.dart';
import 'package:african_ap/Controllers/LoginController.dart';
import 'package:african_ap/Models/Message.dart';
import 'package:african_ap/Services/dbServices.dart';
import 'package:african_ap/Vue/LocalApp/Message.dart';
import 'package:african_ap/Vue/LocalApp/Principal.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:toast/toast.dart';

class MessageController {
  static void Envoyer(context, Messages message) async {
    BasicsWidgets.Load(context);
    try {
      dbServices().contacterUser(messages: message).then((_) {
        Navigator.pop(context);
        Navigator.pop(context);
        Get.back();
        Toast.show("Contact effectué",duration: 4);
      });
    } catch (e) {
      Navigator.pop(context);
      log(e.toString());
    }
  }

  // static void EnvoyerC(Messages message) async {
  //   try {
  //     String url = "https://myap.moglich.net/api/MessageEnvoyer.php/";

  //     FormData formData = FormData.fromMap({
  //       "idEx": message.idEx,
  //       "idDes": message.idDes,
  //       "text": message.text,
  //       "date": message.dateTime,
  //     });
  //     final Response = await Dio().post(url, data: formData);
  //     if (Response.statusCode == 200) {
  //       String rs = Response.data.toString().replaceAll("\n", "");
  //       var data = jsonDecode(rs);
  //       var resultat = data["data"];
  //       int succes = resultat[1];
  //       if (succes == 1) {
  //         log("idDes :${message.idDes} idEx :${message.idEx}");
  //         ContactsController.ContacterC(
  //             idDes: message.idDes, idEx: message.idEx);
  //         ContactsController.ContacterC(
  //             idDes: message.idEx, idEx: message.idDes);
  //       } else {
  //         Toast.show(resultat[0], duration: 8);
  //       }
  //       print(succes);
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  // static Future<List<Messages>> getMessage(
  //     {required String idEx, required String idDes}) async {
  //   final response = await http.post(
  //       Uri.parse(
  //           "https://myap.moglich.net/api/Messages.php/"),
  //       body: {
  //         "idDes": idDes,
  //         "idEx": idEx,
  //       });
  //   String rs = response.body.toString().replaceAll("\n", "");
  //   var data = jsonDecode(rs);
  //   List<dynamic> valuues = data;
  //   List<Messages> messages = [];

  //   for (int i = 0; i < valuues.length; i++) {
  //     String year = data[i]["date"].toString().split("-").first;
  //     String month = data[i]["date"].toString().split("-")[1];
  //     String day = data[i]["date"].toString().split("-").last.split(" ").first;
  //     String hour = data[i]["date"]
  //         .toString()
  //         .split("-")
  //         .last
  //         .split(" ")
  //         .last
  //         .split(":")
  //         .first;
  //     String minute = data[i]["date"]
  //         .toString()
  //         .split("-")
  //         .last
  //         .split(" ")
  //         .last
  //         .split(":")[1];

  //     messages.add(Messages(
  //         idMessage: data[i]["idMessage"],
  //         idEx: data[i]["idEx"],
  //         idDes: data[i]["idDes"],
  //         text: data[i]["text"],
  //         dateTime: DateTime(
  //           int.parse(year),
  //           int.parse(month),
  //           int.parse(day),
  //           int.parse(hour),
  //           int.parse(minute),
  //         )));
  //   }
  //   // log(superUsers.toString());
  //   return messages;
  // }
}
