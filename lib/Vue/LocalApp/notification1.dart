import 'dart:async';
import 'dart:developer';
import 'package:african_ap/GetXControllers/NotificationController.dart';
import 'package:african_ap/Controllers/NotificationController.dart';
import 'package:african_ap/Models/Notifiacation.dart';
import 'package:african_ap/Tools/DateDifference.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';

class Notification1 extends StatefulWidget {
  const Notification1({
    super.key,
  });

  @override
  State<Notification1> createState() => _Notification1State();
}

class _Notification1State extends State<Notification1> {
  // List<NotificationM> notifs = [];
  bool get = false;
  NotificationXController nofc=Get.put(NotificationXController());
  @override
  void initState() {
    Timer(
      Duration(seconds: 15),
      () {
        if (nofc.listNotificatons.length == 0) {
          toastLong(
              "Assurez vous d'avoir une bonne connexion internet ou soit vous n'avez pas des notifications");
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);
    // print("DFDFD" + notifs.length.toString());
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body:Container(
        width: w,
        height: h,
        child: nofc.nbr==-1
            ? Center(
                child: Center(
                  child: Container(
                    width: w * .3,
                    child: Lottie.asset("assets/Load.json"),
                  ),
                ),
              )
            :nofc.nbr==0?Center(
                child: Center(
                  child: Container(
                    width: w * .3,
                    // child: Lottie.asset("assets/Load.json"),
                    child: Text("Pase de notif"),
                  ),
                ),
              ): 
           Obx(()=> ListView.builder(
                itemCount: nofc.listNotificatons.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: SizedBox(
                            child:
                                // Adobe XD layer: 'txt_Notifications' (text)
                                Text(
                              'Notifications',
                              style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                fontSize: 32,
                                color: const Color(0xff000000),
                                letterSpacing: 0.012479999542236327,
                                fontWeight: FontWeight.w700,
                                height: 1.28125,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                          ),
                        ),
                        SizedBox(height: h*.05),
                        NotificationContainer(
                          h: h,
                          w: w,
                          imagePathUser: nofc.listNotificatons[index].imagePath!,
                          not: nofc.listNotificatons.first,
                        ),
                      ],
                    );
                  } else {
                    return NotificationContainer(
                      h: h,
                      w: w,
                      imagePathUser: nofc.listNotificatons[index].imagePath!,
                      not: nofc.listNotificatons[index],
                    );
                  }
                },
              ),
      ),
    ));
  }
  Widget NotificationContainer({
    required double h,
    required double w,
    required String imagePathUser,
    required NotificationM not,
  }) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
      
        height: h / 8,
        width: w,
        child: ListTile(
          leading: CircleAvatar(
            radius: h * .06,
            backgroundImage: NetworkImage(not.imagePath!),
          ),
          title: Text(not.contenue),
          subtitle: Row(
            children: [
              Icon(Icons.timer),
              Text(
                DateDifference.Ilya(
                  not.date!,
                  DateTime.now(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
