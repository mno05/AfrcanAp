import 'dart:developer';

import 'package:african_ap/Controllers/NotificationController.dart';
import 'package:african_ap/Models/Notifiacation.dart';
import 'package:african_ap/Tools/DateDifference.dart';
import 'package:african_ap/Tools/MediaQuery.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Notification1 extends StatefulWidget {
  final String Portee;
  final String imagePathUser;

  const Notification1({
    super.key,
    required this.Portee,
    required this.imagePathUser,
  });

  @override
  State<Notification1> createState() => _Notification1State();
}

class _Notification1State extends State<Notification1> {
  List<NotificationM> notifs = [];
  bool get = false;
  
  @override
  void initState() {
    NotificationController.Recuperer(widget.Portee).then((notif) {
      setState(() {
        notifs = notif!;
        get = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Media.height(context);
    double w = Media.width(context);
    print("DFDFD" + notifs.length.toString());
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        width: w,
        height: h,
        child: !get
            ? Center(
                child: Center(
                  child: Container(
                    width: w * .3,
                    child: Lottie.asset("assets/Load.json"),
                  ),
                ),
              )
            : ListView.builder(
                itemCount: notifs.length,
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
                          imagePathUser: widget.imagePathUser,
                          not: notifs.first,
                        ),
                      ],
                    );
                  } else {
                    return NotificationContainer(
                      h: h,
                      w: w,
                      imagePathUser: widget.imagePathUser,
                      not: notifs[index],
                    );
                  }
                },
              ),
      ),
    );
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
