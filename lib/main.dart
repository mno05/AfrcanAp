import 'package:african_ap/Vue/Auth/LoginVue.dart';
import 'package:african_ap/Vue/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
