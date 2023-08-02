import 'dart:async';
import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/Models/SuperUser.dart';
import 'package:african_ap/Services/dbServices.dart';
import 'package:african_ap/Vue/Widgets/BascisWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Data/Instantane.dart';
import '../Data/User.dart';
import '../Services/Auth.dart';

class MembreValideController extends GetxController {
  final isLambda = RxBool(true);
  @override
  void onInit() {
    UserM user = Instantane.getUser();
    if (user.isLambda) {
      getMembreUsers();
      ever(isLambda, (callback) {
        if (!isLambda.value) {
          Future.microtask(() => BasicsWidgets.alertWithOkAction(
                  "Votre demande d'adhésion a été acceptée.\nPour des raisons de sécurité, nous allons vous déconnecter de votre compte, vous pourrez vous reconnectez pour que nous puissons se rassurer que c'est vraiment vous.",
                  Get.overlayContext!, () {
                BasicsWidgets.Load(Get.overlayContext!);
                Timer(
                  Duration(seconds: 3),
                  (() async {
                    Navigator.pop(Get.overlayContext!);
                    SaveSuperUser.Supprimer();
                    await removeKey(AppData.userPref);
                    AuthServices().Logout(Get.overlayContext!);
                  }),
                );
              }));
        }
      });
    }
    super.onInit();
  }

  // var ListAllUsers = <UserM>[].obs;
  getMembreUsers() async {
    dbServices().getCollection().snapshots().listen((event) {
      dbServices().getUserM(AppData.Uid).then((user) {
        printInfo(
            info:
                "Nous avons commencerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
        if (user.isLambda == false) {
          isLambda.value = false;
        }
      });
    });
  }
}
