import 'package:african_ap/Data/AppData.dart';
import 'package:african_ap/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize = AndroidInitializationSettings("mipmap/ic_launcher");
    var initializationSettings =
        InitializationSettings(android: androidInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future showNigTextNotification({
    var id = 0,
    required String title,
    required String body,
    var payload,
    required FlutterLocalNotificationsPlugin fln,
  }) async {
    AndroidNotificationDetails aND = const AndroidNotificationDetails(
      "you_can_name_it_whatever1",
      "channelName",
      playSound: true,
      // sound: RawResourceAndroidNotificationSound('notification'),
      color: Colors.white,
      importance: Importance.max,
      priority: Priority.high,
    );

    var not = NotificationDetails(android: aND);
    await fln.show(id, title, body, not);
  }
} 
