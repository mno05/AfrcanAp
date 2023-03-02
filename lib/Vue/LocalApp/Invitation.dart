import 'dart:developer';

import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Invitation extends StatefulWidget {
  const Invitation({super.key});

  @override
  State<Invitation> createState() => _InvitationState();
}

class _InvitationState extends State<Invitation> {
  List<Contact> contacts = [];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContactsPermission();
  }

  void getContactsPermission() async {
    if (await Permission.contacts.isGranted) {
      fetchContacts();
    } else {
      await Permission.contacts.request();
    }
  }

  void fetchContacts() async {
    await ContactsService.getContacts().then((value) => setState(() {
          contacts = value;
          isLoading = false;
        }));
  }

  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
        backgroundColor: AppData.BasicColor,
      ),
      body: contacts.isEmpty
          ? Center(
              child: Container(
                width: w * .3,
                child: Lottie.asset("assets/Load.json"),
              ),
            )
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () async {
                    String sms =
                        "sms:${contacts[index].phones!.isEmpty ? "0" : contacts[index].phones![0].value!}?body='Bonjour\nJ'utilise l'application AfricanAp et je vous invite à réjoindre la communauté.'";
                    if (await canLaunchUrlString(sms)) {
                      launchUrlString(sms);
                    }else{
                      log("Pas moyen: $sms");
                    }
                  },
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("img/profil.png"),
                    radius: 25,
                    backgroundColor: Colors.grey,
                  ),
                  title: Text(
                    contacts[index].toMap()["displayName"],
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(contacts[index].phones!.isEmpty
                      ? "0"
                      : contacts[index].phones![0].value!),
                );
              }),
    );
  }
}
