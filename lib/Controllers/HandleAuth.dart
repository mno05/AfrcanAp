import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Services/Auth.dart';
import 'package:african_ap/Vue/Auth/LoginVue.dart';
import 'package:african_ap/Vue/LocalApp/Principal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HandleAuth extends StatelessWidget {
  const HandleAuth({super.key});
  static AuthServices instance = Get.find();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            AppData.Uid = snapshot.data
                .toString()
                .split("uid")
                .last
                .split(": ")
                .last
                .split(")")
                .first
                .toString();
            return Principal();
          } else {
            return LoginVue();
          }
        }),
        stream: AuthServices().authStateChanges());
  }
}

