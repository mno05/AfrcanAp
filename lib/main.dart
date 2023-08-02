import 'package:african_ap/Vue/SplashScreen.dart';
import 'package:african_ap/Vue/Widgets/Notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin= FlutterLocalNotificationsPlugin();
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initialize();
  await Notifications.initialize(flutterLocalNotificationsPlugin);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My AP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.grey,
        inputDecorationTheme: InputDecorationTheme(
          iconColor: Colors.grey,
          focusColor: Colors.grey,
        )
      ),
      // home: Principal(email: "",img: "",nom: "",prenom: "",telephone: ""),
      home: SplashScreen(),
    );
  }
}
